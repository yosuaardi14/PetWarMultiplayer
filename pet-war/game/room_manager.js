const Room = require("./models/room");
const Game = require("./main");

class RoomManager {
    constructor(io) {
        this.io = io;
        this.rooms = {};
    }

    detailRoom(roomId) {
        return this.rooms[roomId];
    }

    createRoom(socket, data) {
        const roomID = data["roomId"];
        const playerNum = data["playerNum"];
        const mode = data["mode"];

        if (!this.rooms[roomID]) {
            let roomData = {
                "id": roomID,
                "game": new Game(this.io),
                "host": socket.handshake.session.socketId,
                "status": "EMPTY",
                "num": 0,
                "maxNum": playerNum,
                "ready": 0,
                "mode": mode,
            };
            let newRoom = new Room(roomData);
            // newRoom.addPlayer({ id: socket.handshake.session.socketId, name: null });
            // socket.join(roomID);
            this.rooms[roomID] = newRoom;
            this.io.to(socket.handshake.session.socketId).emit("createRoom", { "status": "Created", "roomId": roomID });
            // this.io.to(socket.handshake.session.socketId).emit("joinRoom", "Please send your Name");
            return true;
        } else {
            this.io.to(socket.handshake.session.socketId).emit("createRoom", { "status": "Room is Exist", "roomId": roomID });
            return false;
        }
    }

    spectateRoom(socket, roomID) {
        // this.joinRoom(socket, roomID);
        if (this.rooms[roomID]) {
            socket.join(roomID);
            this.io.to(socket.handshake.session.socketId).emit("spectateRoom", "Joined");
            return true;
        } else {
            this.io.to(socket.handshake.session.socketId).emit("spectateRoom", "Room not Found");
            return false;
        }
    }

    joinRoom(socket, roomID) {
        if (this.rooms[roomID].isFull()) {
            console.log("Room is Full");
            this.io.to(socket.handshake.session.socketId).emit("joinRoom", "Room is Full");
        } else {
            console.log(socket.handshake.session.socketId + " join room " + roomID);
            socket.join(roomID);
            this.rooms[roomID].addPlayer({ id: socket.handshake.session.socketId, name: null });
            this.io.to(socket.handshake.session.socketId).emit("joinRoom", "Please send your Name");
        }
    }

    showRoomList(socket) {
        let dataRoom = {};
        for (let roomId in this.rooms) {
            dataRoom[roomId] = this.rooms[roomId].clientToJson();
        }
        this.io.to(socket.handshake.session.socketId).emit("roomList", dataRoom);
    }

    leaveRoom(data) {
        const roomID = data["roomId"];
        const playerId = data["playerId"];
        // if (rooms[roomID][socket.handshake.session.socketId]) {
        //     delete rooms[roomID][socket.handshake.session.socketId];
        //     rooms[roomID]["num"] -= 1;
        //     game.playerObj[socket.handshake.session.socketId].isDead = true;
        // }
        // io.emit("leaveRoom", "Ok");
    }
}

module.exports = RoomManager;