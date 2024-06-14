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
        this.playerNum = 1;//2;
        this.maxLife = 5; //5;
        this.nowTurnId = "";
        this.turn = 0; // For finding the next turn (if player dead, increase value until get player who still alive)
        this.totalTurn = 0;
        this.round = 0;
        this.winner = null;
        this.playerInfoList = [];
        this.gameFinish = false;

        this.devMode = true;
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
            let player = this.playerObj[playerId];
            if (player.life === 0) {
                deadNum += 1;
                if (player.isDead) {
                    continue;
                }
                player.isDead = true;
                this.onDead(player);
            } else {
                this.winner = this.playerObj[playerId]["name"] + " (" + this.playerObj[playerId]["rangerName"] + ")";
            }
        }

        if ((deadNum > 0) && (deadNum === (this.playerIdArr.length - 1))) {
            console.log("checkFinish true");
            this.gameFinish = true;
        } else {
            // console.log("checkFinishfalse");
            this.gameFinish = false;
        }

    }

    finish() {
        this.sendDataToClient();
        this.io.to(this.roomID).emit("onGameFinish", "Pemenangnya adalah " + this.winner);
    }

    // INIT
    initDeck() {
        // INIT Action Deck
        this.actionDeck = GameUtil.initActionDeck();
        // // console.log(this.actionDeck);

        // INIT Canvas Ranger
        this.initRanger();

        // INIT Pet Line and Deck
        this.petDeck = GameUtil.initPetDeck(this.playerObj);
        this.petLine = this.petDeck.getRange(6);
        // // console.log(this.petDeck);
        // this.convertPetDeck();
    }

    initRanger() {
        this.rangerList = GameUtil.initCanvasRanger();
        // // console.log(this.rangerList);
        this.setPlayerRanger();
    }

    setPlayerRanger() {
        for (let playerId in this.playerObj) {
            if (this.playerObj.hasOwnProperty(playerId)) {
                const rand = Math.floor(Math.random() * this.rangerList.length);
                let player = this.playerObj[playerId];
                player.setRanger(this.rangerList[rand]);
                this.playerInfoList.push(player.clientToJson());
                this.rangerList.splice(rand, 1);
            }
        }
    }

    getAllPlayerName() {
        let playerNameList = {};
        for (let playerId in this.playerObj) {
            playerNameList[playerId] = this.playerObj[playerId]["name"];
        }
        return playerNameList;
    }

    // READY
    dealActionCard(size) {
        const cardName = ["Two Aim", "Aim", "Bump Left"];
        for (let i = 0; i < size; i++) {
            for (let playerId in this.playerObj) {
                let player = this.playerObj[playerId];
                if (this.playerIdArr.indexOf(playerId) == 0 && this.devMode) {
                    let card = this.actionDeck.find(item => item.name === cardName[i]);
                    if (card === undefined) {
                        card = this.actionDeck.find(item => item.special.name === cardName[i]);
                        if (card === undefined) {
                            card = this.actionDeck.splice(0, 1)[0];
                        }
                    }
                    // let card = this.actionDeck.splice(cardIndex, 1);
                    player.cardDeck.push(card);
                } else {
                    let card = this.actionDeck.splice(0, 1);
                    player.cardDeck.push(card[0]);
                }

            }
        }

        for (let playerId in this.playerObj) {
            const player = this.playerObj[playerId];
            this.io.to(player.id).emit("onGameReady", JSON.stringify(player.toJson()));
        }
        this.updatePlayerInfo();
        this.io.to(this.roomID).emit("playerInfo", JSON.stringify(this.playerInfoList));
        this.io.to(this.roomID).emit("nextTurn", this.nowTurnId);
        this.io.to(this.roomID).emit("nextTurnName", this.playerObj[this.nowTurnId].name);
        // // console.log(this.actionDeck.length);
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
                break;
            }
        }

        for (let playerId in this.playerObj) {
            this.playerIdArr.push(playerId);
        }
        console.log(this.playerIdArr);
        var firstPlayerIndex = this.playerIdArr.indexOf(this.nowTurnId);
        if (firstPlayerIndex != 0) {
            [this.playerIdArr[0], this.playerIdArr[firstPlayerIndex]] = [this.playerIdArr[firstPlayerIndex], this.playerIdArr[0]];
            console.log(this.playerIdArr);
        }
    }

    getActionCard(player) {
        this.moveDiscardPileToActionDeck();
        if (player.isDead == false) {
            let card = this.actionDeck.splice(0, 1);
            if (card[0] !== undefined) {
                player.cardDeck.push(GameUtil.resetCard(card[0]));
            }
            // console.log(card);
        }
        this.io.to(player.id).emit("getCard", JSON.stringify(player.toJson()));
        this.onNextTurn();
    }

    moveDiscardPileToActionDeck() {
        if (this.actionDeck.length <= 0) {
            // console.log("moveDiscardPileToActionDeck");
            this.actionDeck.push(...Util.shuffle(this.discardPile));
            this.discardPile = [];
        }
    }

    // START
    onPlayerAction(data) {
        var cardDeckIndex = this.playerObj[this.nowTurnId].cardDeck.indexOf(Util.findyById(this.playerObj[this.nowTurnId].cardDeck, data["card"]["id"]));
        // console.log(this.playerObj[this.nowTurnId].cardDeck);
        // console.log(cardDeckIndex);
        this.playerObj[this.nowTurnId].cardDeck.splice(cardDeckIndex, 1);
        // console.log(this.playerObj[this.nowTurnId].cardDeck);
        // Ability Util
        let useSpecial = data["card"]["useSpecial"];
        let cardName = useSpecial == true ? data["card"]["special"]["name"] : data["card"]["name"];
        // console.log(data["card"]);
        // console.log(data["extraprop"]);
        if (data["extraprop"] == null) {
            // discard pile card
            if (AbilityUtil.discardPileTypeCard.indexOf(cardName) >= 0) {
                this.onInfoAction(data["card"]);
                AbilityUtil.onAbilityAction(this, data["card"], data["extraprop"]);
                // this.io.to(this.nowTurnId).emit("confirmAction", "discardPile");
            } else {
                this.onInfoAction(data["card"], true);
                if (data["card"] != null) {
                    data["card"]["block"] = 1;
                }
                this.discardPile.push(data["card"]);
                this.io.to(this.nowTurnId).emit("confirmAction", "");
            }
        } else {
            this.onInfoAction(data["card"]);
            AbilityUtil.onAbilityAction(this, data["card"], data["extraprop"]);
            // this.actionUp[data["extraprop"]["index"]] = data["card"];
            // this.io.to(this.nowTurnId).emit("confirmAction", "normal");
        }
    }

    onInfoAction(card, discard = false) {
        let infoText = this.playerObj[this.nowTurnId]["name"];
        infoText += discard ? " membuang " : " menggunakan ";
        if (card["useSpecial"] === true) {
            infoText += card["special"]["name"];
        } else {
            infoText += card["name"];
        }
        this.io.to(this.roomID).emit("infoAction", infoText);
    }

    onConfirmAction(data) {
        // // console.log(data["card"]+ "this.onConfirmAction");
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
        // console.log(text);
        // console.log(this.petLine);
        this.updatePlayerInfo();
        this.updateGrenadeTurn();
        this.sendCardDeckToClient();
        // this.onNextTurn();
    }

    updatePlayerInfo() {
        this.playerInfoList = [];
        for (let i in this.playerIdArr) {
            this.playerInfoList.push(this.playerObj[this.playerIdArr[i]].clientToJson());
            this.io.to(this.playerObj[this.playerIdArr[i]]).emit("getCard", JSON.stringify(this.playerObj[this.playerIdArr[i]].toJson()));
        }
        // console.log(this.playerInfoList);
    }

    onNextTurn() {
        if (this.gameFinish == false) {
            this.totalTurn += 1;
            for (let i = 0; i < this.playerIdArr.length; i++) {
                this.turn += 1;
                this.nowTurnId = this.playerIdArr[this.turn % this.playerIdArr.length];
                this.checkHideAndTrapTurn(this.nowTurnId);
                if (this.playerObj[this.nowTurnId].isDead === false) {
                    break;
                }
                // if (this.playerObj[this.nowTurnId].life > 0) {
                //     break;
                // }
            }
            // this.turn += 1;
            // this.nowTurnId = this.playerIdArr[this.turn % this.playerIdArr.length];
            // check if player isDead, skip
            // check hide turn
            // this.checkHideAndTrapTurn();
            // if (this.playerObj[this.nowTurnId].isDead) {

            //     this.nowTurnId = this.playerIdArr[this.turn % this.playerIdArr.length];
            //     //search player who is not dead;
            // }
            // console.log("nextTurn" + this.nowTurnId);
            // console.log("nextTurnName" + this.playerObj[this.nowTurnId].name);
            this.sendDataToClient();
            this.io.to(this.roomID).emit("nextTurn", this.nowTurnId);
            this.io.to(this.roomID).emit("nextTurnName", this.playerObj[this.nowTurnId].name);
            this.io.to(this.roomID).emit("infoAction", "Giliran: " + this.playerObj[this.nowTurnId].name);
        } else {
            this.finish();
        }
    }

    checkHideAndTrapTurn(playerId) {
        // // remove hide if player index == hideList.indexOf() >= 0 but it impossible to have to hide in same time
        // let hideIndexList = Util.findAllIndex(this.hideList, playerId);
        // // console.log("hideList" + hideIndexList);
        // // if (hideIndexList.length > 0) {
        // for (let i = 0; i < hideIndexList.length; i++) {
        //     this.hideList[hideIndexList[i]] = null;
        //     this.io.to(this.roomID).emit("infoAction", "Hide dari " + this.playerObj[playerId]["name"] + " telah menghilang");
        //     AbilityUtil.removeActionCardOnIndex(this, "Hide", hideIndexList[i]);
        // }
        // // }

        // let trapIndexList = Util.findAllIndex(this.trapList, playerId);
        // // if (trapIndexList.length > 0) {
        // for (let i = 0; i < trapIndexList.length; i++) {
        //     this.trapList[trapIndexList[i]] = null;
        //     this.io.to(this.roomID).emit("infoAction", "Trap dari " + this.playerObj[playerId]["name"] + " telah menghilang");
        //     AbilityUtil.removeActionCardOnIndex(this, "Trap", trapIndexList[i]);
        // }
        // // }
        this.removeHideAndTrap(playerId);
    }

    removeHideAndTrap(playerId) {
        AbilityUtil.removeHideAndTrapCard(this, playerId);
    }

    updateGrenadeTurn() {
        for (let i = 0; i < this.grenadeList.length; i++) {
            if (this.grenadeList[i] === null) {
                continue;
            }
            this.grenadeList[i] += 1;
            if (this.grenadeList[i] == Data.GRENADE_TURN) {
                this.grenadeList[i] = null;
                // explode grenade
                // need to add check if there is grenade, megagrenada, grenade -> will it explode or add checking in UI
                AbilityUtil.explodeGrenade(this, i);
            }
        }
        // console.log("this.grenadeList:");
        // console.log(this.grenadeList);
    }

    // FINISH
    onDead(player) {
        // for (let i = 0; i < player.cardDeck.length; i++) {
        //     const card = player.cardDeck[i];
        //     this.discardPile.push(card);
        // }
        this.io.to(player.id).emit("onPlayerDefeated", "Defeat");
        this.discardPile.push(...player.cardDeck);
        player.cardDeck.splice(0, 3);
        this.io.to(player.id).emit("getCard", JSON.stringify(player.toJson()));
    }

    // OTHER
    // initialData
    getInitialData() {
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
            "playerInfoList": this.playerInfoList,
        };
        return masterData;
    }

    sendInitDataToClient(roomID) {
        // // console.log(masterData);
        // // console.log(JSON.stringify(masterData));
        this.io.to(roomID).emit("onGameInit", JSON.stringify(this.getInitialData()));
    }

    getUpdatedData() {
        this.petLine = this.petDeck.getRange(6);
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
            "playerInfoList": this.playerInfoList,
        };
        return gameData;
    }

    sendDataToClient() {
        // const gameData = {
        //     "aimList": this.aimList,
        //     "actionUp": this.getIdFromArray(this.actionUp),
        //     "actionDeck": this.getIdFromArray(this.actionDeck),
        //     // "petLine": this.getIdFromArrayOfArray(this.petLine),
        //     "petDeck": this.getIdFromArrayOfArray(this.petDeck.toArray()),
        //     "actionDown": this.getIdFromArray(this.actionDown),
        //     "discardPile": this.getIdFromArrayOfArray(this.discardPile),
        // };
        // // console.log(gameData);
        // // console.log(JSON.stringify(gameData));
        this.io.to(this.roomID).emit("finishAction", JSON.stringify(this.getUpdatedData()));
    }

    sendCardDeckToClient() {
        this.checkFinish();
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
