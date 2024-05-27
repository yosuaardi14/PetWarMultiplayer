const Data = require('./values/data');
const Player = require('./models/player');
const CircularQueue = require('./utils/circular_queue');
const GameUtil = require('./utils/game_util');
const Util = require('./utils/util');
const AbilityUtil = require('./utils/ability_util');

class Main {
    constructor(io) {
        this.io = io;
        // Visible
        this.aimList = [null, null, null, null, null, null]; // 6
        this.actionUp = [null, null, null, null, null, null]; // 6

        this.petLine = []; // 6
        this.hideList = [null, null, null, null, null, null]; // 6
        this.trapList = [null, null, null, null, null, null]; // 6

        this.grenadeList = [null, null, null, null, null, null]; // 6
        this.actionDown = [null, null, null, null, null, null]; // 6

        //Not Visible
        this.actionDeck = [];
        this.petDeck = new CircularQueue();
        this.discardPile = [];

        //
        this.rangerList = [];
        this.playerObj = {};
        this.playerIdArr = [];
        this.playerNum = 1;
        this.maxLife = 5; //5;
        this.nowTurnId = "";
        this.turn = 0; // For finding the next turn (if player dead, increase value until get player who still alive)
        this.totalTurn = 0;
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
                this.winner = playerId;
            }
        }

        if (deadNum === (this.playerIdArr.length - 1)) {
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
                let player = this.playerObj[playerId];
                let card = this.actionDeck.splice(0, 1);
                player.cardDeck.push(card[0]);
            }
        }

        for (let playerId in this.playerObj) {
            const player = this.playerObj[playerId];
            this.io.to(player.id).emit("onGameReady", JSON.stringify(player.toJson()));
        }
        this.io.to(this.roomID).emit("nextTurn", this.nowTurnId);
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
                this.nowTurnId = playerId;
            }
        }

        for (let playerId in this.playerObj) {
            this.playerIdArr.push(playerId);
        }
        var firstPlayerIndex = this.playerIdArr.indexOf(this.nowTurnId);
        if (firstPlayerIndex != 0) {
            [this.playerIdArr[0], this.playerIdArr[firstPlayerIndex]] = [this.playerIdArr[firstPlayerIndex], this.playerIdArr[0]];
        }
    }

    getActionCard(player) {
        this.moveDiscardPileToActionDeck();
        let card = this.actionDeck.splice(0, 1);
        if (card[0] !== undefined) {
            player.cardDeck.push(card[0]);
        }
        console.log(card);
        this.io.to(player.id).emit("getCard", JSON.stringify(player.toJson()));
    }

    moveDiscardPileToActionDeck() {
        if (this.actionDeck.length <= 0) {
            console.log("moveDiscardPileToActionDeck");
            this.actionDeck.push(...Util.shuffle(this.discardPile));
            this.discardPile = [];
        }
    }

    // START
    onPlayerAction(data) {
        var cardDeckIndex = this.playerObj[this.nowTurnId].cardDeck.indexOf(Util.findyById(this.playerObj[this.nowTurnId].cardDeck, data["card"]["id"]));
        console.log(this.playerObj[this.nowTurnId].cardDeck);
        console.log(cardDeckIndex);
        this.playerObj[this.nowTurnId].cardDeck.splice(cardDeckIndex, 1);
        console.log(this.playerObj[this.nowTurnId].cardDeck);
        // Ability Util
        let useSpecial = data["card"]["useSpecial"];
        let cardName = useSpecial == true ? data["card"]["special"]["name"] : data["card"]["name"];
        console.log(data["card"]);
        console.log(data["extraprop"]);
        if (data["extraprop"] == null) {
            // discard pile card
            if (AbilityUtil.discardPileTypeCard.indexOf(cardName) >= 0) {
                AbilityUtil.onAbilityAction(this, data["card"], data["extraprop"]);
                // this.io.to(this.nowTurnId).emit("confirmAction", "discardPile");
            } else {
                this.discardPile.push(data["card"]);
                this.io.to(this.nowTurnId).emit("confirmAction", "");
            }
        } else {
            AbilityUtil.onAbilityAction(this, data["card"], data["extraprop"]);
            // this.actionUp[data["extraprop"]["index"]] = data["card"];
            // this.io.to(this.nowTurnId).emit("confirmAction", "normal");
        }
    }

    onConfirmAction(data) {
        // console.log(data["card"]+ "this.onConfirmAction");
        if (data["card"] !== undefined) {
            AbilityUtil.onConfirmAbilityAction(this, data["card"], data["extraprop"]);
        }
        // nothing
        // this.io.to(this.nowTurnId).emit("confirmAction", "normal");
        this.onFinishAction();
    }

    onFinishAction() {
        this.petLine = this.petDeck.getRange(6);
        let text = "[";
        for (let i = 0; i < this.petLine.length; i++) {
            text += `[${this.petLine[i].length}],`;
        }
        text += "]";
        console.log(text);
        console.log(this.petLine);
        this.updateGrenadeTurn();
        this.sendDataToClient();
        this.sendCardDeckToClient();
        this.onNextTurn();
    }

    onNextTurn() {
        if (this.checkFinish() == false) {
            this.totalTurn += 1;
            do {
                this.turn += 1;
                this.nowTurnId = this.playerIdArr[this.turn % this.playerIdArr.length];
                this.checkHideAndTrapTurn();
            } while (this.playerObj[this.nowTurnId].isDead);
            // this.turn += 1;
            // this.nowTurnId = this.playerIdArr[this.turn % this.playerIdArr.length];
            // check if player isDead, skip
            // check hide turn
            // this.checkHideAndTrapTurn();
            // if (this.playerObj[this.nowTurnId].isDead) {

            //     this.nowTurnId = this.playerIdArr[this.turn % this.playerIdArr.length];
            //     //search player who is not dead;
            // }
            this.io.to(this.roomID).emit("nextTurn", this.nowTurnId);
        } else {
            this.finish();
        }
    }

    checkHideAndTrapTurn() {
        // remove hide if player index == hideList.indexOf() >= 0 but it impossible to have to hide in same time
        let hideIndexList = Util.findAllIndex(this.hideList, this.nowTurnId);
        console.log("hideList" + hideIndexList);
        if (hideIndexList.length > 0) {
            for (let i = 0; i < hideIndexList.length; i++) {
                AbilityUtil.removeActionCardOnIndex(this, "Hide", i);
            }
        }

        let trapIndexList = Util.findAllIndex(this.trapList, this.nowTurnId);
        if (trapIndexList.length > 0) {
            for (let i = 0; i < trapIndexList.length; i++) {
                AbilityUtil.removeActionCardOnIndex(this, "Trap", i);
            }
        }
    }

    updateGrenadeTurn() {
        for (let i = 0; i < this.grenadeList.length; i++) {
            let grenade = this.grenadeList[i];
            if (grenade == null) {
                continue;
            }
            grenade += 1;
            if (grenade == 3) {
                this.grenadeList[i] = null;
                // explode grenade
                // need to add check if there is grenade, megagrenada, grenade -> will it explode or add checking in UI
                AbilityUtil.explodeGrenade(this, i);
            }
        }
    }

    // FINISH
    onDead(player) {
        // for (let i = 0; i < player.cardDeck.length; i++) {
        //     const card = player.cardDeck[i];
        //     this.discardPile.push(card);
        // }
        this.discardPile.push(...player.cardDeck);
        player.cardDeck.splice(0, 3);
    }

    // OTHER
    sendInitDataToClient(roomID) {
        const masterData = {
            "aimList": this.aimList,
            "actionUp": this.actionUp,
            // "actionDeck": this.actionDeck,
            "actionDeckLength": this.actionDeck.length,
            // "petDeck": this.petDeck.toArray(),
            "grenadeList": this.grenadeList,
            "petDeckLength": this.petDeck.toArray().length,
            "petLine": this.petLine,
            "actionDown": this.actionDown,
            "discardPile": this.discardPile,
        };
        // console.log(masterData);
        // console.log(JSON.stringify(masterData));
        this.io.to(roomID).emit("onGameInit", JSON.stringify(masterData));
    }

    sendDataToClient() {
        const gameData = {
            "aimList": this.aimList,
            "actionUp": this.actionUp,
            // "actionDeck": this.actionDeck,
            "actionDeckLength": this.actionDeck.length,
            // "petDeck": this.petDeck.toArray(),
            "grenadeList": this.grenadeList,
            "petDeckLength": this.petDeck.toArray().length,
            "petLine": this.petLine,
            "actionDown": this.actionDown,
            "discardPile": this.discardPile,
        };
        // const gameData = {
        //     "aimList": this.aimList,
        //     "actionUp": this.getIdFromArray(this.actionUp),
        //     "actionDeck": this.getIdFromArray(this.actionDeck),
        //     // "petLine": this.getIdFromArrayOfArray(this.petLine),
        //     "petDeck": this.getIdFromArrayOfArray(this.petDeck.toArray()),
        //     "actionDown": this.getIdFromArray(this.actionDown),
        //     "discardPile": this.getIdFromArrayOfArray(this.discardPile),
        // };
        // console.log(gameData);
        // console.log(JSON.stringify(gameData));
        this.io.to(this.roomID).emit("finishAction", JSON.stringify(gameData));
    }

    sendCardDeckToClient() {
        let player = this.playerObj[this.nowTurnId];
        this.getActionCard(player);
    }

    getIdFromArray(data) {
        const result = data.map(item => item.id ?? null);
        return result;
    }

    getIdFromArrayOfArray(data) {
        const result = data.map(subArray => subArray.map(item => item.id));
        return result;
    }
}

module.exports = Main;