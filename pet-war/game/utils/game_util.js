const Data = require('../values/data');
const DataTwo = require('../values/data_two');
const DataExpansion = require('../values/data_expansion');
const DataNaviBattle = require('../values/data_navi_battle');
const DataLeader = require('../values/data_leader');
const Util = require('./util');
const CircularQueue = require('./circular_queue');

class GameUtil {
    static initActionDeck() {
        let actionDeck = [];
        let cardDB = Data.ACTION;
        for (var i in cardDB) {
            let actionCard = Object.assign({}, cardDB[i]);
            switch (i) {
                case "Aim-Trap":
                    actionCard["prop"] = { "playerId": "", "index": -1 };
                    break;
                case "Hide":
                case "Hide-Master Hide":
                case "Hide-Corpse Cover":
                    actionCard["prop"] = { "playerId": "" };
                    break;
            }
            if (actionCard["prop"] != null) {
                console.log(actionCard["prop"]);
            }
            var size = actionCard["cardNum"];
            for (var j = 0; j < size; j++) {
                let cardName = actionCard["name"];
                let normalName = actionCard["name"], specialName = "";
                actionCard["id"] = Util.generateId("action");
                if (cardName.indexOf("-") >= 0) {
                    normalName = cardName.split("-")[0];
                    specialName = cardName.split("-")[1];

                    if (actionCard["special"] != null) {
                        var specialMap = Object.assign({}, actionCard["special"]);
                        if (specialMap.get("name") == undefined) {
                            specialMap["name"] = specialName;
                        }
                        actionCard["special"] = specialMap;
                    }
                    actionCard["name"] = normalName;
                }
                actionCard["useSpecial"] = false;
                delete actionCard["cardNum"];
                actionDeck.push(actionCard);
            }
            // if(actionDeck.length > 6){
            //     break;
            // }
        }
        Util.shuffle(actionDeck);
        return actionDeck;
    }

    static initCanvasRanger() {
        let cardDB = Data.CANVAS_RANGER;
        let rangerList = Array.from(cardDB);
        for (var i = 0; i < rangerList.length; i++) {
            let ranger = Object.assign({}, rangerList[i]);
            ranger["id"] = Util.generateId("ranger");
            rangerList[i] = ranger;
            console.log(ranger);
        }
        return rangerList;
    }

    static initPetDeck(playerObj) {
        let cardDB = Data.PET;
        const petDeck = new CircularQueue();
        const jungleSize = cardDB["Jungle"]["cardNum"];

        for (let i = 0; i < jungleSize; i++) {
            let pet = Object.assign({}, cardDB["Jungle"]);
            pet["id"] = Util.generateId("pet");
            petDeck.addElement([pet]);
        }

        Object.values(playerObj).forEach(player => {
            for (let j = 0; j < player.maxLife; j++) {
                let pet = Object.assign({}, cardDB[player.ranger["pet"]]);
                pet["id"] = Util.generateId("pet");
                petDeck.addElement([pet]);
            }
        });

        petDeck.shuffleAll();
        return petDeck;
    }

    static initPetDeckNew(playerObj) {
        let cardDB = Data.PET;
        let petDeck = [];
        const jungleSize = 3;//cardDB["Jungle"]["cardNum"]; // Assume this is the default value or fetch from Constant.PET["Jungle"]["cardNum"] ?? 0;

        for (let i = 0; i < jungleSize; i++) {
            let pet = Object.assign({}, cardDB["Jungle"]);
            pet["id"] = Util.generateId("pet");
            petDeck.push([pet]);
        }

        Object.values(playerObj).forEach(player => {
            for (let j = 0; j < player.maxLife; j++) {
                let pet = Object.assign({}, cardDB[player.ranger["pet"]]);
                pet["id"] = Util.generateId("pet");
                petDeck.push([pet]);
            }
        });

        petDeck = Util.shuffle(petDeck);
        return petDeck;
    }

    static getPlayerIdByPet(petName, playerObj) {
        for (const playerId in playerObj) {
            const player = playerObj[playerId];
            if (player.ranger["pet"] === petName) {
                console.log("getPlayerIdByPet(" + petName + ", playerObj)" + player.id);
                return player.id;
            }
        }
        console.log("getPlayerIdByPet(" + petName + ", playerObj) Not Found");
        return "";
    }

    static resetCard(card) {
        card.useSpecial = false;
        if (card.name == "Two Aims" || card.name == "Two Booms") {
            card.block = 2;
        }
        // TODO CHECK
        if (card.prop != null) {
            if (card.name.indexOf("Hide") >= 0) {
                card.prop = { "playerId": "" };
            } else {
                card.prop = { "playerId": "", "index": -1 };
            }
        }
        return card;
    }
}

module.exports = GameUtil;