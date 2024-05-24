const Data = require('./values/data');
const Player = require('./models/player');
const CircularQueue = require('./utils/circular_queue');
const GameUtil = require('./utils/game_util');

class Main {
    constructor(io) {
        this.io = io;
        // Visible
        this.aimList = [null, null, null, null, null, null]; // 6
        this.actionUp = [null, null, null, null, null, null]; // 6
        this.petLine = []; // 6
        this.actionDown = [null, null, null, null, null, null]; // 6

        //Not Visible
        this.actionDeck = [];
        this.petDeck = new CircularQueue();
        this.discardPile = [];

        //
        this.rangerList = [];
        this.playerObj = {};
        this.playerIdArr = [];
        this.playerNum = 2;
        this.maxLife = 1; //5;
        this.nowTurn = "";
        this.turn = 0;
        this.actualTurn = 0; // Ignore Player Dead
        this.round = 0;
        this.winner = null;
    }

    init(roomID) {
        this.roomID = roomID;
        this.initDeck();
        this.sendInitDataToClient(roomID);
    }

    ready() {
        this.getFirstTurn();
        this.dealActionCard(3);
    }

    checkFinish() {
        let deadNum = 0;

        for (let playerId in this.playerObj) {
            const player = this.playerObj[playerId];
            if (player.life === 0) {
                if (player.isDead()) {
                    continue;
                }
                player.isDead = true;
                deadNum += 1;
                this.onDead(player);
            } else {
                this.winner = i;
            }
        }

        if (deadNum === (playerArr.length - 1)) {
            return true;
        }
        return false;
    }

    finish() {
        this.io.to(this.roomID).emit("onGameFinish", "Game Finish The winner is" + this.winner);
    }

    // INIT
    initDeck() {
        // INIT Action Deck
        this.actionDeck = GameUtil.initActionDeck();
        console.log(this.actionDeck);

        // INIT Canvas Ranger
        this.initRanger();

        // INIT Pet Line and Deck
        this.petDeck = GameUtil.initPetDeck(this.playerObj);
        this.petLine = this.petDeck.getRange(6);
        console.log(this.petDeck);
        // this.convertPetDeck();
    }

    initRanger() {
        this.rangerList = GameUtil.initCanvasRanger();
        console.log(this.rangerList);
        this.setPlayerRanger();
    }

    setPlayerRanger() {
        for (let playerId in this.playerObj) {
            if (this.playerObj.hasOwnProperty(playerId)) {
                const rand = Math.floor(Math.random() * this.rangerList.length);
                const player = this.playerObj[playerId];
                player.setRanger(this.rangerList[rand]);
                this.rangerList.splice(rand, 1);
            }
        }
    }

    // READY
    dealActionCard(size) {
        for (let i = 0; i < size; i++) {
            for (let playerId in this.playerObj) {
                const player = this.playerObj[playerId];
                player.cardDeck.push(this.actionDeck.splice(0, 1));
            }
        }

        for (let playerId in this.playerObj) {
            const player = this.playerObj[playerId];
            this.io.to(player.id).emit("dealCard", player.cardDeck);
        }
        this.io.to(this.roomID).emit("nextTurn", this.nowTurn);
        console.log(this.actionDeck.length);
    }

    getFirstTurn() {
        let firstPet = this.petLine[0][0];

        for (let i = 0; i < this.petLine.length; i++) {
            firstPet = this.petLine[i][0];
            if (firstPet.name !== Data.PET["Jungle"].name) {
                break;
            }
        }

        for (let playerId in this.playerObj) {
            const player = this.playerObj[playerId];
            if (player.ranger.pet === firstPet.name) {
                this.nowTurn = playerId;
            }
        }

        for (let playerId in this.playerObj) {
            this.playerIdArr.push(playerId);
        }
        var firstPlayerIndex = this.playerIdArr.indexOf(this.nowTurn);
        if (firstPlayerIndex != 0) {
            [this.playerIdArr[0], this.playerIdArr[firstPlayerIndex]] = [this.playerIdArr[firstPlayerIndex], this.playerIdArr[0]];
        }
    }

    getActionCard(player) {
        let card = this.actionDeck.splice(0, 1);
        player.cardDeck.push(card);
        this.io.to(player.id).emit("getCard", card.id);
    }

    // START
    onPlayerAction(data) {
        // Ability Util
        this.onFinishAction();
    }

    onFinishAction() {
        this.sendDataToClient();
        this.sendCardDeckToClient();
        this.onNextTurn();
    }

    onNextTurn() {
        if (this.checkFinish() == false) {
            this.actualTurn += 1;
            this.nowTurn = this.playerIdArr[this.actualTurn % this.playerIdArr.length];
            // check if player isDead, skip
            if (this.playerObj[this.nowTurn].isDead) {
                this.turn += 1;
                this.nowTurn = this.playerIdArr[this.actualTurn % this.playerIdArr.length];
                //search player who is not dead;
            }
            this.io.to(this.roomID).emit("nextTurn", this.nowTurn);
        } else {
            this.finish();
        }
    }

    // FINISH
    onDead(player) {
        for (let i = 0; i < player.cardDeck.length; i++) {
            const card = player.cardDeck[i];
            this.discardPile.push(card);
        }
        this.discardPile.addAll(player.cardDeck);
        player.cardDeck.splice(0, 3);
    }

    // OTHER
    sendInitDataToClient(roomID) {
        const masterData = {
            "aimList": this.aimList,
            "actionUp": this.actionUp,
            "actionDeck": this.actionDeck,
            "petDeck": this.petDeck.toArray(),
            // "petLine": this.petLine,
            "actionDown": this.actionDown,
            "discardPile": this.discardPile,
        };
        console.log(masterData);
        console.log(JSON.stringify(masterData));
        this.io.to(roomID).emit("onGameInit", JSON.stringify(masterData));
    }

    sendDataToClient() {
        const gameData = {
            "aimList": this.aimList,
            "actionUp": this.getIdFromArray(this.actionUp),
            "actionDeck": this.getIdFromArray(this.actionDeck),
            // "petLine": this.getIdFromArrayOfArray(this.petLine),
            "petDeck": this.getIdFromArrayOfArray(this.petDeck.toArray()),
            "actionDown": this.getIdFromArray(this.actionDown),
            "discardPile": this.getIdFromArrayOfArray(this.discardPile),
        };
        console.log(gameData);
        console.log(JSON.stringify(gameData));
        // this.io.to(roomID).emit("finishAction", JSON.stringify(gameData));
    }

    sendCardDeckToClient() {
        const player = this.playerObj[this.nowTurn];
        this.getActionCard(player);
    }

    getIdFromArray(data) {
        const result = data.map(item => item.id);
        return result;
    }

    getIdFromArrayOfArray(data) {
        const result = data.map(subArray => subArray.map(item => item.id));
        return result;
    }
}

module.exports = Main;