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
        socket.join(roomID);
        if (!rooms[roomID]) {
            rooms[roomID] = {
                "num": 0,
                "ready": 0
            };
        }
        rooms[roomID][socket.id] = { id: socket.id, name: null };

        game.playerObj[socket.id] = new Player(socket.id, "", game.maxLife);

        rooms[roomID]["num"] = rooms[roomID]["num"] + 1;
        if (rooms[roomID]["num"] === game.playerNum) {
            game.init(roomID);
        }

        socket.on('setPlayerName', (data) => {
            rooms[roomID][socket.id].name = data.name;
            game.playerObj[socket.id].name = data.name;
            console.log(game.playerObj[socket.id]);
            io.to(socket.id).emit("setPlayerName", socket.id);
            // io.to(roomID).emit('playerMoved', rooms[roomID][socket.id]);
        });

        socket.on('onGameInit', (data) => {
            console.log("client init data: " + data);
        });

        socket.on('onReady', (data) => {
            if (data === "ready") {
                rooms[roomID]["ready"] = rooms[roomID]["ready"] + 1;
            }
            if (rooms[roomID]["ready"] === rooms[roomID]["num"]) {
                console.log("Game Ready to Start");
                game.ready();
            }
        });

        socket.on('dealCard', (data) => {
            // Send Data to Client Only by to each player by socket.id
            console.log("dealCard" + data);
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
            console.log('user disconnected:', socket.id);
            if (rooms[roomID]) {
                delete rooms[roomID][socket.id];
                io.to(roomID).emit('playerDisconnected', socket.id);
                if (Object.keys(rooms[roomID]).length === 0) {
                    delete rooms[roomID];
                }
            }
        });

        socket.on('playerMovement', (movementData) => {
            let player = rooms[roomID][socket.id];
            if (player) {
                player.x += movementData.x;
                player.y += movementData.y;
                io.to(roomID).emit('playerMoved', player);
            }
        });
    });

    // Reconnection logic
    socket.on('disconnecting', () => {
        console.log('user disconnecting:', socket.id);
        const roomsToLeave = Object.keys(socket.rooms);
        roomsToLeave.forEach(room => {
            if (rooms[room]) {
                delete rooms[room][socket.id];
                io.to(room).emit('playerDisconnected', socket.id);
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
