const Data = require('../values/data');
const Util = require('./util');
const CircularQueue = require('./circular_queue');

class GameUtil {
    static initActionDeck() {
        let actionDeck = [];
        for (var i in Data.ACTION) {
            let actionCard = Object.assign({}, Data.ACTION[i]);
            // if (actionCard.block != undefined) {
            //     actionCard["block"] = 1;
            // }
            switch (actionCard["name"]) {
                case "Grenade":
                case "Grenade-Mega Grenade":
                    actionCard["extraprop"] = { "turn": 0 };
                    break;
                case "Hide":
                case "Hide-Master Hide":
                    actionCard["extraprop"] = { "playerId": -1 };
                    break;
                case "Shield":
                    actionCard["extraprop"] = { "life": 2 };
                    break;
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
        let rangerList = Array.from(Data.CANVAS_RANGER);
        for (var i = 0; i < rangerList.length; i++) {
            let ranger = Object.assign({}, rangerList[i]);
            ranger["id"] = Util.generateId("ranger");
            rangerList[i] = ranger;
            console.log(ranger);
        }
        return rangerList;
    }

    static initPetDeck(playerObj) {
        const petDeck = new CircularQueue();
        const jungleSize = Data.PET["Jungle"]["cardNum"]; // Assume this is the default value or fetch from Constant.PET["Jungle"]["cardNum"] ?? 0;

        for (let i = 0; i < jungleSize; i++) {
            let pet = Object.assign({}, Data.PET["Jungle"]);
            pet["id"] = Util.generateId("pet");
            petDeck.addElement([pet]);
        }

        // playerArr.forEach(player => {
        //     for (let j = 0; j < player.maxLife; j++) {
        //         let pet = Object.assign({}, Data.PET[player.ranger["pet"]]);
        //         pet["id"] = Util.generateId("pet");
        //         petDeck.addElement([pet]);
        //     }
        // });

        Object.values(playerObj).forEach(player => {
            for (let j = 0; j < player.maxLife; j++) {
                let pet = Object.assign({}, Data.PET[player.ranger["pet"]]);
                pet["id"] = Util.generateId("pet");
                petDeck.addElement([pet]);
            }
        });

        petDeck.shuffleAll();
        return petDeck;
    }

    static getPlayerIdByPet(petName, playerObj) {
        for (const playerId in playerObj) {
            const player = playerObj[playerId];
            if (player.ranger["pet"] === petName) {
                return player.id;
            }
        }
        return "";
    }

    static resetCard(card) {
        card.useSpecial = false;
        if (card.name == "Two Aim" || card.name == "Two Boom") {
            card.block = 2;
        }
        return card;
    }
}

module.exports = GameUtil;