// 
const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);
const { Server } = require('socket.io');
const io = new Server(server);
const port = process.env.PORT || 3000;
const cors = require('cors');

// User Defined
const Game = require("./game/main");
const Player = require('./game/models/player');

const game = new Game(io);
let rooms = {};

app.use(cors());
app.use(express.static(__dirname));

// Handle socket.io connections
io.on('connection', (socket) => {
    console.log('a user connected:', socket.id);
    socket.on('joinRoom', (roomID) => {
        console.log("joinRoom " + roomID);
        if (!rooms[roomID]) {
            rooms[roomID] = {
                "game": new Game(io),
                "status": "EMPTY",
                "num": 0,
                "ready": 0
            };
        }

        let roomGame = rooms[roomID]["game"];
        
        if ((rooms[roomID]["num"] + 1) > roomGame.playerNum) {
            console.log("Room is Full");
            io.to(socket.id).emit("joinRoom", "Room is Full");
        } else {
            console.log(socket.id + " join room " + roomID);
            socket.join(roomID);
            rooms[roomID][socket.id] = { id: socket.id, name: null };
            roomGame.playerObj[socket.id] = new Player(socket.id, "", roomGame.maxLife);
            rooms[roomID]["num"] = rooms[roomID]["num"] + 1;
            rooms[roomID]["status"] = "WAITING";
            io.to(socket.id).emit("joinRoom", "Please send your Name");
        }
        console.log("Room Num Player: " + rooms[roomID]["num"]);

        socket.on('setPlayerName', (data) => {
            console.log("setPlayerName " + data.name);
            rooms[roomID][socket.id].name = data.name;
            roomGame.playerObj[socket.id].name = data.name;
            io.to(socket.id).emit("setPlayerName", socket.id);
            if (rooms[roomID]["num"] === roomGame.playerNum) {
                rooms[roomID]["status"] = "INITGAME";
                roomGame.init(roomID);
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
                roomGame.ready();
                // game.ready();
            }
        });

        socket.on('onGameReady', (data) => {
            console.log("onGameReady" + data);
            // if (data === "ready") {
            //     rooms[roomID]["ready"] = rooms[roomID]["ready"] + 1;
            // }
            // if (rooms[roomID]["ready"] === rooms[roomID]["num"]) {
            //     console.log("Game Ready to Start");
            //     game.ready();
            // }
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
            roomGame.onPlayerAction(data);
            // game.onPlayerAction(data);
        });

        socket.on('confirmAction', (data) => {
            // Server 
            console.log("confirmAction" + data);
            roomGame.onConfirmAction(data);
            // game.onConfirmAction(data);
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

        socket.on('disconnect', () => {
            console.log('user on room disconnect:', socket.id);
            if (rooms[roomID]) {
                delete rooms[roomID][socket.id];
                rooms[roomID]["num"] = rooms[roomID]["num"] - 1;
                io.to(roomID).emit('playerDisconnected', socket.id);
                if (Object.keys(rooms[roomID]).length === 0) {
                    delete rooms[roomID];
                }
            }
        });
    });

    // Reconnection logic
    socket.on('disconnecting', () => {
        console.log('user disconnecting:' + socket.id);
        let roomsToLeave = Object.keys(socket.rooms);

        console.log("'user disconnecting room list:'" + roomsToLeave);
        // const roomsToLeave = Object.keys(rooms);
        roomsToLeave.forEach(roomID => {
            console.log(rooms[roomID]);
            if (rooms[roomID]) {
                console.log('room disconnecting from room:', roomID);
                delete rooms[roomID][socket.id];
                rooms[roomID]["num"] = rooms[roomID]["num"] - 1;
                io.to(roomID).emit('playerDisconnected', socket.id);
                if (Object.keys(rooms[roomID]).length === 0) {
                    delete rooms[roomID];
                }
            }
        });
    });

    socket.on('reconnect', () => {
        console.log('user reconnected:', socket.id);
        const roomsToJoin = Object.keys(socket.rooms).filter(room => room !== socket.id);
        roomsToJoin.forEach(room => {
            socket.join(room);
            if (!rooms[room]) {
                rooms[room] = {};
            }
            rooms[room][socket.id] = { id: socket.id, name: null, x: 100, y: 100, color: colorList[rooms[roomID]["num"] % colorList.length] };
            io.to(room).emit('playerReconnected', rooms[room][socket.id]);
        });
    });
});

// Start the server
server.listen(port, () => {
    console.log(`Socket.IO server running at http://localhost:${port}/`);
});
