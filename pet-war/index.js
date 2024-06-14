// 
const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);
const { Server } = require('socket.io');
const io = new Server(server);
const port = process.env.PORT || 3000;
const cors = require('cors');
const session = require('express-session');
const sharedSession = require('express-socket.io-session');


// Session middleware
const sessionMiddleware = session({
    secret: 'pet-war',
    resave: false,
    saveUninitialized: true
});


// User Defined
const Game = require("./game/main");
const Player = require('./game/models/player');
const RoomManager = require('./game/room_manager');

// const game = new Game(io);
const rooms = {};

app.use(cors());
// app.use(express.static(__dirname));
app.use(express.static(__dirname + "/public")); // For UI

app.use(sessionMiddleware);

// Share session middleware with Socket.IO
io.use(sharedSession(sessionMiddleware, {
    autoSave: true
}));

// // Share session middleware with Socket.IO
// io.use((socket, next) => {
//     sessionMiddleware(socket.request, socket.request.res || {}, next);
// });

// Handle socket.io connections
io.on('connection', (socket) => {
    console.log('a user connected:', socket.id);
    // const session = socket.request.session;
    // console.log('User connected with session ID:', session.id);

    // // Save data in session
    // session.socketId = socket.id;
    // session.save();

    // socket.on('disconnect', () => {
    //     console.log('User disconnected:', session.id);
    // });

    // io.emit("roomList", rooms);

    const sessionId = socket.handshake.query.sessionId;
    if (sessionId) {
        // Retrieve session from storage if needed, or handle sessionId
        console.log('User connected with session ID:', sessionId);
        socket.handshake.session.id = sessionId;
    } else {
        console.log('New user connected');
    }

    // Save socket ID in session
    socket.handshake.session.socketId = socket.id;
    socket.handshake.session.save();

    socket.on('spectateRoom', (roomID) => {
        if (rooms[roomID]) {
            socket.join(roomID);
            io.to(socket.id).emit("spectateRoom", "Joined");
        } else {
            io.to(socket.id).emit("spectateRoom", "Room not Found");
            // io.to.(socket.id).emit("onSpectateInit", rooms[roomID].game.getInitialData());
        }
    });

    socket.on('createRoom', (data) => {
        const roomID = data["roomId"];
        const playerNum = data["playerNum"];
        const mode = data["mode"];

        if (!rooms[roomID]) {
            rooms[roomID] = {
                "id": roomID,
                "game": new Game(io),
                "status": "EMPTY",
                "num": 0,
                "maxNum": playerNum,
                "ready": 0,
                "team": data["mode"],
            };
            socket.join(roomID);
            let game = rooms[roomID]["game"];
            game.playerNum = playerNum;
            rooms[roomID]["num"] += 1;
            rooms[roomID][socket.handshake.session.socketId] = { id: socket.handshake.session.socketId, name: null };
            game.playerObj[socket.handshake.session.socketId] = new Player(socket.handshake.session.socketId, "", game.maxLife);
            io.to(socket.handshake.session.socketId).emit("createRoom", "Created");
        } else {
            socket.join(roomID);
            let game = rooms[roomID]["game"];
            rooms[roomID][socket.handshake.session.socketId] = { id: socket.handshake.session.socketId, name: null };
            game.playerObj[socket.handshake.session.socketId] = new Player(socket.handshake.session.socketId, "", game.maxLife);
            io.to(socket.handshake.session.socketId).emit("createRoom", "Joined");
        }
    });

    socket.on('roomList', (_) => {
        let dataRoom = {};
        for (let roomId in rooms) {
            dataRoom[roomId] = {
                "id": roomId,
                "num": rooms[roomId]["num"],
                "maxNum": rooms[roomId]["maxNum"],
            }
        }
        io.to(socket.handshake.session.socketId).emit("roomList", dataRoom);
    });

    socket.on('kickPlayer', (data) => {
        const roomID = data["roomId"];
        const playerId = data["playerId"];

        if (!rooms[roomID]) {

        }
        // let dataRoom = Object.assign({}, rooms);
        // dataRoom.forEach(roomID => {
        //     console.log(dataRoom[roomID]);
        //     delete dataRoom[roomID]["game"];
        // });
        // io.emit("kickPlayer", dataRoom);
    });

    socket.on('leaveRoom', (data) => {
        const roomID = data["roomId"];
        const playerId = data["playerId"];
        if (rooms[roomID][socket.handshake.session.socketId]) {
            delete rooms[roomID][socket.handshake.session.socketId];
            rooms[roomID]["num"] -= 1;
            game.playerObj[socket.handshake.session.socketId].isDead = true;
        }
        // io.emit("leaveRoom", "Ok");
    });

    socket.on('joinRoom', (roomID) => {
        console.log("joinRoom " + roomID);
        if (!rooms[roomID]) {
            // io.to(socket.handshake.session.socketId).emit("joinRoom", "Room not Found");
            // return;
            rooms[roomID] = {
                "id": roomID,
                "game": new Game(io),
                "status": "EMPTY",
                "num": 0,
                "ready": 0
            };
        }

        let game = rooms[roomID]["game"];
        console.log(rooms[roomID]);

        if ((rooms[roomID]["num"] + 1) > game.playerNum) {
            console.log("Room is Full");
            io.to(socket.handshake.session.socketId).emit("joinRoom", "Room is Full");
            return;
        } else {
            console.log(socket.handshake.session.socketId + " join room " + roomID);
            socket.join(roomID);
            rooms[roomID][socket.handshake.session.socketId] = { id: socket.handshake.session.socketId, name: null };
            game.playerObj[socket.handshake.session.socketId] = new Player(socket.handshake.session.socketId, "", game.maxLife);
            rooms[roomID]["num"] = rooms[roomID]["num"] + 1;
            rooms[roomID]["status"] = "WAITING";
            io.to(socket.handshake.session.socketId).emit("joinRoom", "Please send your Name");
        }
        console.log("Room Num Player: " + rooms[roomID]["num"]);

        socket.on('setPlayerName', (data) => {
            console.log("setPlayerName " + data.name);
            rooms[roomID][socket.handshake.session.socketId].name = data.name;
            game.playerObj[socket.handshake.session.socketId].name = data.name;
            io.to(socket.handshake.session.socketId).emit("setPlayerName", socket.handshake.session.socketId);
            // console.log(game.getAllPlayerName());
            io.to(roomID).emit("playerRoomList", game.getAllPlayerName());
            if (rooms[roomID]["num"] === game.playerNum) {
                rooms[roomID]["status"] = "INITGAME";
                game.init(roomID);
                // game.init(roomID);
            }
        });

        socket.on('onGameInit', (data) => {
            console.log("client init data: " + data);
            if (data === "ready") {
                rooms[roomID]["ready"] = rooms[roomID]["ready"] + 1;
            }
            if (rooms[roomID]["ready"] === rooms[roomID]["num"]) {
                console.log("Game Ready to Start");
                rooms[roomID]["status"] = "STARTGAME";
                game.ready();
                // game.ready();
            }
        });

        socket.on('onGameReady', (data) => {
            console.log("onGameReady" + data);
        });

        socket.on('dealCard', (data) => {
            // Send Data to Client Only by to each player by socket.id
            console.log("dealCard" + data);
        });

        socket.on('getCard', (data) => {
            // Send Data to Client Only by to each player by socket.id
            console.log("getCard" + data);
        });

        socket.on('nextTurn', (data) => {
            // Send Data to Client Only to All in Room
            console.log("nextTurn" + data);
        });

        socket.on('sendAction', (data) => {
            // Server 
            console.log("sendAction" + data);
            game.onPlayerAction(data);
        });

        socket.on('infoAction', (data) => {
            // Server 
            console.log("infoAction" + data);
        });

        socket.on('confirmAction', (data) => {
            // Server 
            console.log("confirmAction" + data);
            game.onConfirmAction(data);
        });

        socket.on('finishAction', (data) => {
            // Send Data to Client Only to All in Room (Update Game Canvas)
            // Send Player Card Deck (who have finish the action before) 
            console.log("finishAction" + data);
        });

        socket.on('onPlayerDefeated', (data) => {
            // Send Data to Client Only by to each player by socket.id
            console.log("onPlayerDefeated" + data);
        });

        socket.on('onGameFinish', (data) => {
            // Send Data to Client Only to All in Room
            console.log("onGameFinish" + data);
        });

        socket.on('message', (data) => {
            // Send Data to Client Only to All in Room (Update Game Canvas)
            // Send Player Card Deck (who have finish the action before) 
            console.log("message" + data);
            const playerName = "";
            let chatText = playerName + "\t\t:" + data;
            io.to(roomID).emit("message", chatText);
        });

        socket.on('disconnect', () => {
            console.log('user on room disconnect:', socket.handshake.session.socketId);
            if (rooms[roomID]) {
                delete rooms[roomID][socket.handshake.session.socketId];
                rooms[roomID]["num"] = rooms[roomID]["num"] - 1;
                io.to(roomID).emit('playerDisconnected', socket.handshake.session.socketId);
                if (Object.keys(rooms[roomID]).length === 0) {
                    delete rooms[roomID];
                }
            }
        });
    });

    // Reconnection logic
    socket.on('disconnecting', () => {
        console.log('user disconnecting:' + socket.handshake.session.socketId);
        console.log('user disconnecting sessionid:' + socket.handshake.session.socketId);

        let roomsToLeave = Object.keys(socket.rooms);

        console.log("'user disconnecting room list:'" + roomsToLeave);
        // const roomsToLeave = Object.keys(rooms);
        roomsToLeave.forEach(roomID => {
            console.log(rooms[roomID]);
            if (rooms[roomID]) {
                console.log('room disconnecting from room:', roomID);
                delete rooms[roomID][socket.handshake.session.socketId];
                rooms[roomID]["num"] = rooms[roomID]["num"] - 1;
                io.to(roomID).emit('playerDisconnected', socket.handshake.session.socketId);
                if (Object.keys(rooms[roomID]).length === 0) {
                    delete rooms[roomID];
                }
            }
        });
    });

    socket.on('reconnect', () => {
        console.log('user reconnected:', socket.handshake.session.socketId);
        const roomsToJoin = Object.keys(socket.rooms).filter(room => room !== socket.handshake.session.socketId);
        roomsToJoin.forEach(room => {
            socket.join(room);
            if (!rooms[room]) {
                rooms[room] = {};
            }
            rooms[room][socket.handshake.session.socketId] = { id: socket.handshake.session.socketId, name: null, x: 100, y: 100, color: colorList[rooms[roomID]["num"] % colorList.length] };
            io.to(room).emit('playerReconnected', rooms[room][socket.handshake.session.socketId]);
        });
    });
});

// Start the server
server.listen(port, () => {
    console.log(`Socket.IO server running at http://localhost:${port}/`);
});
