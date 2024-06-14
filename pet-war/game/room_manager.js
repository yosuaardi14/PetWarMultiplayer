const Room = require("./models/room");
const Game = require("./main");

class RoomManager {
    constructor(io) {
        this.io = io;
        this.rooms = {};
    }

    detailRoom(roomId){
        return this.rooms[roomId]; // toJson;
    }

    createRoom(data) {
        const roomID = data["roomId"];
        const playerNum = data["playerNum"];
        const mode = data["mode"];
        if (!rooms[roomID]) {
            const roomData = {
                "id": roomID,
                "game": new Game(io),
                "status": "EMPTY",
                "num": 0,
                "maxNum": playerNum,
                "ready": 0,
                "mode": data["mode"],
            };
            rooms[roomID] = new Room(roomData);
            return true;
        } else {
            return false;
        }
    }

    spectateRoom() {

    }

    joinRoom() {

    }

    showRoomList() {

    }

    leaveRoom() {

    }
}

module.exports = RoomManager;