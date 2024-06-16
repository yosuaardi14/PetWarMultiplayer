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

const roomManager = new RoomManager(io);

app.use(cors());
// app.use(express.static(__dirname));
app.use(express.static(__dirname + "/public")); // For UI

app.use(sessionMiddleware);

// Share session middleware with Socket.IO
io.use(sharedSession(sessionMiddleware, {
    autoSave: true
}));

// Handle socket.io connections
io.on('connection', (socket) => {
    console.log('a user connected:', socket.id);

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
        console.log(socket.handshake.session.socketId + " spectate " + roomID);
        roomManager.spectateRoom(socket, roomID);
    });

    socket.on('createRoom', (data) => {
        console.log(socket.handshake.session.socketId + " create " + data["roomId"]);
        roomManager.createRoom(socket, data);
    });

    socket.on('roomList', (_) => {
        console.log("roomList");
        roomManager.showRoomList(socket);
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
        console.log("leaveRoom");
        roomManager.leaveRoom(data);
    });

    socket.on('joinRoom', (roomID) => {
        console.log(socket.handshake.session.socketId + "joinRoom " + roomID);

        let gameRoom = roomManager.detailRoom(roomID);

        let game = gameRoom.game;

        roomManager.joinRoom(socket, roomID);

        console.log("Room " + roomID + " Num Player: " + gameRoom.num);

        socket.on('setPlayerName', (data) => {
            console.log("setPlayerName " + data);
            gameRoom.setPlayerName(socket.handshake.session.socketId, data);
            io.to(socket.handshake.session.socketId).emit("setPlayerName", socket.handshake.session.socketId);
            io.to(roomID).emit("playerRoomList", game.getAllPlayerName());
            gameRoom.checkGamePreparation();
        });

        socket.on('onGameInit', (data) => {
            console.log("client init data: " + data);
            gameRoom.onResponseReady(data);
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

        socket.on('spectatorData', (data) => {
            // Send Data to Client Only to All in Room (Update Game Canvas)
            // Send Player Card Deck (who have finish the action before) 
            console.log("spectatorData" + data);
            io.to(socket.handshake.session.socketId).emit("spectatorData", game.getUpdatedData());
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
            const playerName = gameRoom.playerList[socket.handshake.session.socketId]["name"];
            let chatText = playerName + "\t\t: " + data;
            io.to(roomID).emit("message", chatText);
        });

        socket.on('disconnect', () => {
            console.log('user with id on room disconnect:', socket.id);
            console.log('user with sessionid on room disconnect:', socket.handshake.session.socketId);
            // if (rooms[roomID]) {
            //     delete rooms[roomID][socket.handshake.session.socketId];
            //     rooms[roomID]["num"] = rooms[roomID]["num"] - 1;
            //     io.to(roomID).emit('playerDisconnected', socket.handshake.session.socketId);
            //     if (Object.keys(rooms[roomID]).length === 0) {
            //         delete rooms[roomID];
            //     }
            // }
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
