class Room {
    constructor(roomData) {
        this.id = roomData["id"];
        this.host = roomData["host"]; // playerId
        this.game = roomData["game"];
        this.status = "EMPTY";//roomData["status"];
        this.num = 0;//roomData["num"];
        this.maxNum = roomData["maxNum"];
        this.ready = 0;//roomData["ready"];
        this.mode = roomData["mode"];
        this.playerList = {};
    }

    addPlayer(playerObj) {
        this.playerList[playerObj.id] = playerObj;
        this.game.playerNum = this.maxNum;
        this.game.playerObj[playerObj.id] = new Player(playerObj.id, "", game.maxLife);
        this.num += 1;
    }

    removePlayer(playerid) {
        delete this.playerList[playerid];
        this.num -= 1;
    }

    setPlayerName(playerid, playerName){
        this.playerList[playerid]["name"] = playerName;
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