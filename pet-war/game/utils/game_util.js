const Data = require('../values/data');
const Util = require('./util');
const CircularQueue = require('./circular_queue');

class GameUtil {
    static initActionDeck() {
        let actionDeck = [];
        for (var i in Data.ACTION_NEW) {
            let actionCard = Object.assign({}, Data.ACTION_NEW[i]);
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
            var size = 1; //actionCard["cardNum"];
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
        const jungleSize = 1; // Assume this is the default value or fetch from Constant.PET["Jungle"]["cardNum"] ?? 0;

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
}

module.exports = GameUtil;