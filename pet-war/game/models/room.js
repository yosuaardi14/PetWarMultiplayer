const Player = require("./player");

class Room {
    constructor(roomData, io) {
        this.io = io;
        this.id = roomData["id"];
        this.host = roomData["host"]; // playerId
        this.game = roomData["game"];
        this.status = "WAITING";//roomData["status"];
        this.num = 0;//roomData["num"];
        this.maxNum = roomData["maxNum"];
        this.ready = 0;//roomData["ready"];
        this.mode = roomData["mode"];
        this.playerList = {};
    }

    isFull() {
        return this.num == this.maxNum;
    }

    isAllReady() {
        return this.ready == this.maxNum;
    }

    onResponseReady(data) {
        if (data === "ready") {
            this.ready += 1;
        }
        this.checkGamePreparation();
    }

    addPlayer(playerObj) {
        this.playerList[playerObj.id] = playerObj;
        this.game.playerNum = this.maxNum;
        this.game.playerObj[playerObj.id] = new Player(playerObj.id, "", this.game.maxLife);
        this.num += 1;
    }

    removePlayer(playerid) {
        delete this.playerList[playerid];
        delete this.game.playerObj[playerid];
        this.num -= 1;
    }

    setPlayerName(playerid, playerName) {
        this.playerList[playerid]["name"] = playerName;
        this.game.playerObj[playerid]["name"] = playerName;
    }

    checkGamePreparation() {
        switch (this.status) {
            case "WAITING":
                if (this.isFull()) {
                    this.status = "INITGAME";
                    this.game.init(this.id);
                }
            case "INITGAME":
                if (this.isAllReady()) {
                    this.status = "STARTGAME";
                    this.game.ready();
                }
                console.log(this.game.playerObj);
                break;
            default:
                break;
        }
    }

    toJson() {
        return {
            "id": this.id,
            "game": this.game,
            "ready": this.ready,
            "playerList": this.playerList,
            "num": this.num,
            "maxNum": this.maxNum,
            "status": this.status
        };
    }

    clientToJson() {
        return {
            "id": this.id,
            "num": this.num,
            "maxNum": this.maxNum,
            "status": this.status
        };
    }
}

module.exports = Room;