const Main = require("../main");
const Data = require("../values/data");
const GameUtil = require("./game_util");
const Util = require("./util");

class AbilityUtil {
    static discardPileTypeCard = [
        "Running",
        "Typhoon",
        "Lunch Time",
        "Move The Pet",
        "Ressurect",
        //Special
        "Double Run",
        "Double Resurrect",
        "Moving Aim",
    ];

    static onAbilityAction(main, card, extraprop) {
        if (card["useSpecial"] == true) {
            this.onSpecialAction(main, card, extraprop);
        } else {
            this.onCommonAction(main, card, extraprop);
        }
    }

    static onCommonAction(main, card, extraprop) {
        let isNotFound = false;
        const cardAbility = card["ability"];
        switch (cardAbility) {
            // Up
            case "Aim":
                this.onAim(main, card, extraprop);
                this.onActionFinish(main);
                break;
            case "TwoAim":
                this.onTwoAim(main, card, extraprop);
                this.onActionFinish(main);
                break;
            case "Boom":
                this.onBoom(main, card, extraprop);
                this.onActionFinish(main);
                break;
            case "TwoBoom":
                this.onTwoBoom(main, card, extraprop);
                this.onActionFinish(main);
                break;
            case "Miss":
                // need confirmation sometimes
                this.onCheckMiss(main, card, extraprop);
                // this.onMiss(main, card, extraprop);
                break;
            case "BumpLeft":
                this.onBumpLeft(main, card, extraprop);
                this.onActionFinish(main);
                break;
            case "BumpRight":
                this.onBumpRight(main, card, extraprop);
                this.onActionFinish(main);
                break;
            // Down
            case "Grenade":
                this.onGrenade(main, card, extraprop);
                this.onActionFinish(main);
                break;
            // Front
            case "Hide":
                this.onHide(main, card, extraprop);
                this.onActionFinish(main);
                break;
            case "Armor":
                this.onArmor(main, card, extraprop);
                this.onActionFinish(main);
                break;
            case "GetCover":
                // need confirmation sometimes
                this.onCheckGetCover(main, card, extraprop);
                // this.onGetCover(main, card, extraprop);
                break;
            case "Doom":
                this.moveCardToDiscardPile(main, card);
                this.onDoom(main, card, extraprop);
                this.onActionFinish(main);
                break;
            case "GoForward":
                this.onGoForward(main, card, extraprop);
                this.onActionFinish(main);
                break;
            case "GoBackward":
                this.onGoBackward(main, card, extraprop);
                this.onActionFinish(main);
                break;
            // Discard Pile
            case "Running":
                this.moveCardToDiscardPile(main, card);
                this.onRunning(main, card, extraprop);
                this.onActionFinish(main);
                break;
            case "Typhoon":
                this.moveCardToDiscardPile(main, card);
                this.onTyphoon(main, card, extraprop);
                this.onActionFinish(main);
                break;
            case "Ressurect":
                this.moveCardToDiscardPile(main, card);
                this.onRessurect(main, card, extraprop);
                this.onActionFinish(main);
                break;
            case "MoveThePet":
                // need confirmation
                this.moveCardToDiscardPile(main, card);
                this.onCheckMoveThePet(main, card, extraprop);
                // this.onMoveThePet(main, card, extraprop);
                break;
            case "LunchTime":
                this.moveCardToDiscardPile(main, card);
                this.onLunchTime(main, card, extraprop);
                this.onActionFinish(main);
                break;
            default:
                isNotFound = true;
                // console.log(cardAbility + " is 404");
                break;
        }
    }

    static onSpecialAction(main, card, extraprop) {
        let isNotFound = false;
        const cardAbility = card["special"]["ability"];
        switch (cardAbility) {
            case "Shield":
                this.onShield(main, card, extraprop);
                this.onActionFinish(main);
                break;
            case "MasterHide":
                this.moveCardToDiscardPile(main, card);
                // need confirmation
                this.onCheckMasterHide(main, card, extraprop);
                // this.onMasterHide(main, card, extraprop);
                break;
            case "MovingAim":
                // need confirmation
                this.onCheckMovingAim(main, card, extraprop);
                // this.onMovingAim(main, card, extraprop);
                break;
            case "Trap":
                this.onTrap(main, card, extraprop);
                this.onActionFinish(main);
                break;
            case "DoubleRessurect":
                this.moveCardToDiscardPile(main, card);
                this.onDoubleRessurect(main, card, extraprop);
                this.onActionFinish(main);
                break;
            case "GoAnyward":
                // need confirmation
                this.moveCardToDiscardPile(main, card);
                this.onCheckGoAnyward(main, card, extraprop);
                // this.onGoAnyward(main, card, extraprop);
                break;
            case "OverShock":
                // Same as Doom
                this.moveCardToDiscardPile(main, card);
                this.onOverShock(main, card, extraprop);
                this.onActionFinish(main);
                break;
            case "DoubleRun":
                this.moveCardToDiscardPile(main, card);
                this.onDoubleRun(main, card, extraprop);
                this.onActionFinish(main);
                break;
            case "Escape":
                this.moveCardToDiscardPile(main, card);
                this.onEscape(main, card, extraprop);
                this.onActionFinish(main);
                break;
            case "MegaGrenade":
                this.onMegaGrenade(main, card, extraprop);
                this.onActionFinish(main);
                break;
            case "Kamikaze":
                this.onKamikaze(main, card, extraprop);
                this.onActionFinish(main);
                break;
            default:
                isNotFound = true;
                // console.log(cardAbility + " is 404");
                break;
        }
    }
    // static onConfirmAbilityAction(main, cardAbility, extraprop) {
    static onConfirmAbilityAction(main, card, extraprop) {
        let isNotFound = false;
        var cardAbility = card["useSpecial"] == true
            ? card["special"]["ability"]
            : card["ability"];
        switch (cardAbility) {
            case "MovingAim":
                // aimList
                // actionUp
                this.onMovingAim(main, card, extraprop);
                break;
            case "MoveThePet":
                // petLine
                this.onMoveThePet(main, card, extraprop);
                break;
            case "MasterHide":
                // targetIndex
                this.onMasterHide(main, card, extraprop);
                break;
            case "Miss":
                // targetIndex (1/-1)
                if (extraprop != null) {
                    extraprop["missIndex"] = extraprop["index"] + (extraprop["targetIndex"] == "left" ? -1 : 1);
                }
                this.onMiss(main, card, extraprop);
                break;
            case "GetCover":
                // targetIndex (1/-1)
                if (extraprop != null) {
                    extraprop["coverIndex"] = extraprop["index"] + (extraprop["targetIndex"] == "left" ? -1 : 1);
                }
                this.onGetCover(main, card, extraprop);
                break;
            case "GoAnyward":
                // targetIndex (2/-2)
                if (extraprop != null) {
                    extraprop["goIndex"] = extraprop["index"] + (extraprop["targetIndex"] == "left" ? -2 : 2);
                }
                this.onGoAnyward(main, card, extraprop);
                break;
            default:
                // do nothing
                break;
        }
    }

    //
    static needConfirmation(main, card, extraprop) {
        var cardAbility = card["useSpecial"] == true
            ? card["special"]["ability"]
            : card["ability"];
        switch (cardAbility) {
            case "MovingAim":
                // aimList
                // actionUp
                main.io.to(main.nowTurnId).emit("confirmAction", JSON.stringify({ "type": "aimList", "extraprop": extraprop }));
                break;
            case "MoveThePet":
                // petLine
                main.io.to(main.nowTurnId).emit("confirmAction", JSON.stringify({ "type": "petLine", "extraprop": extraprop }));
                break;
            case "MasterHide":
                // targetIndex
                main.io.to(main.nowTurnId).emit("confirmAction", JSON.stringify({ "type": "masterHideIndex", "extraprop": extraprop }));
                break;
            case "Miss":
            // targetIndex (1/-1)
            case "GetCover":
            // targetIndex (1/-1)
            case "GoAnyward":
                // targetIndex (2/-2)
                main.io.to(main.nowTurnId).emit("confirmAction", JSON.stringify({ "type": "targetIndex", "extraprop": extraprop }));
                break;
            default:
                // do nothing
                break;
        }
    }

    static onActionFinish(main) {
        main.io.to(main.nowTurnId).emit("confirmAction", "");
    }

    //
    static onAimMove(main, condition, targetIndex, indexVal) {
        // check is 0 < index < 5
        // check is empty
        if (condition) {
            // check if there is two aim TODO
            if (main.actionUp[targetIndex + indexVal] == null) {
                // move
                const aimCard = main.actionUp[targetIndex];
                main.aimList[targetIndex] = null;
                main.aimList[targetIndex + indexVal] = true;
                main.actionUp[targetIndex] = null;
                main.actionUp[targetIndex + indexVal] = aimCard;
            }
        }
    }

    static onPetGo(main, condition, targetIndex, indexVal) {
        // console.log("onPetGo condition:" + condition);
        if (condition) {
            let petCard = main.petDeck.getAt(targetIndex);//[targetIndex];
            let oldPetCard = main.petDeck.getAt(targetIndex + indexVal);//[targetIndex + indexVal];
            main.petDeck.setAt(targetIndex, oldPetCard);//[targetIndex] = oldPetCard;
            main.petDeck.setAt(targetIndex + indexVal, petCard);//[targetIndex + indexVal] = petCard;
            if (main.hideList[targetIndex] != null) {
                if (main.hideList[targetIndex + indexVal] != null) {
                    let oldHide = main.playerIdArr.indexOf(main.hideList[targetIndex + indexVal]);
                    let newHide = main.playerIdArr.indexOf(main.hideList[targetIndex]);
                    main.hideList[targetIndex + indexVal] = oldHide < newHide ? main.hideList[targetIndex] : main.hideList[targetIndex + indexVal];
                } else {
                    main.hideList[targetIndex + indexVal] = main.hideList[targetIndex];
                }
            }
        }
    }

    static onCover(main, condition, targetIndex, indexVal) {
        // check is 0 < index < 5
        if (targetIndex + indexVal < 0) {

        }
        // check target isForest

    }

    static onDestroyPet(main, targetIndex) {
        if (targetIndex >= main.petDeck.length) {
            return;
        }
        let useSpecialAbility = main.petDeck.getAt(targetIndex)[0].useSpecial == true;
        console.log("onDestroyPet useSpecial" + useSpecialAbility);
        let isSpecialCard = main.petDeck.getAt(targetIndex)[0].special != null;
        console.log("onDestroyPet isSpecialCard" + isSpecialCard);

        let cardName = main.petDeck.getAt(targetIndex)[0].name;
        let specialCardName = isSpecialCard ? main.petDeck.getAt(targetIndex)[0].special.name : "";
        // // check target isForest -> do nothing
        // // check target hasHide -> do nothing
        let isForest = cardName == Data.PET["Jungle"].name;
        let isHide = !useSpecialAbility && (cardName == Data.ACTION["Hide"].name);
        let isTrap = useSpecialAbility && isSpecialCard && (specialCardName == Data.ACTION["Aim-Trap"].special.name);
        console.log((cardName == Data.ACTION["Aim-Trap"].special.name));
        console.log("isForest || isHide || isTrap");
        if (isForest || isHide || isTrap) {
            console.log("isForest || isHide || isTrap : true");
            return;
        }
        // // main.petDeck.getAt(targetIndex)[0];
        // // check target hasKamikaze
        let hasKamikaze = useSpecialAbility && (specialCardName == Data.ACTION["Aim-Kamikaze"].special.name);
        if (hasKamikaze) {
            console.log("isForest || isHide || isTrap : true");
            return;
        }
        // // check target hasShield -> change shield to Armor (useSpecial => false)
        let isShield = useSpecialAbility && isSpecialCard && (specialCardName == Data.ACTION["Armor-Shield"].special.name);
        console.log((cardName == Data.ACTION["Armor-Shield"].special.name));
        console.log("isShield");
        if (isShield) {
            console.log("isShield : true");
            main.petDeck.getAt(targetIndex)[0].useSpecial = false;
            // console.log("Destroy Shield");
            return;
        }
        // // check target hasArmor -> destroy Armor
        let isArmor = !useSpecialAbility && (cardName == Data.ACTION["Armor"].name);
        console.log("isArmor");
        if (isArmor) {
            console.log("isArmor : true");
            this.moveCardToDiscardPile(main, main.petDeck.getAt(targetIndex)[0]);
            main.petDeck.getAt(targetIndex).splice(0, 1);
            return;
        }

        let playerId = GameUtil.getPlayerIdByPet(cardName, main.playerObj);
        main.playerObj[playerId].life--;
        main.playerObj[playerId].defeatedPet.push(main.petDeck.getAt(targetIndex)[0]);
        if (main.petDeck.getAt(targetIndex).length > 1) {
            main.petDeck.getAt(targetIndex).splice(0, 1);
        } else {
            main.petDeck.removeAt(targetIndex);
        }
    }

    static addCardToPet(main, card, extraprop) {
        let index = Util.nullSafety(extraprop["index"], -1);
        if (index != -1) {
            // check splice
            // TODO Set hide card to the top
            // let hasHide = false;
            let tempCard = [];
            let hideCard = null;
            for (let i = 0; i < main.petDeck.getAt(index).length; i++) {
                if ((main.petDeck.getAt(index)[i].useSpecial === false) && (main.petDeck.getAt(index)[i].name === Data.ACTION["Hide"].name)) {
                    hideCard = main.petDeck.getAt(index)[i];
                    // console.log("hideCard: ");
                    // console.log(hideCard);
                } else {
                    tempCard.push(main.petDeck.getAt(index)[i]);
                }
            }
            if (hideCard != null) {
                main.petDeck.setAt(index, tempCard);
                main.petDeck.getAt(index).unshift(card);//.splice(index, 0, card);
                main.petDeck.getAt(index).unshift(hideCard);
            } else {
                main.petDeck.getAt(index).unshift(card);//.splice(index, 0, card);
            }
        }
    }

    static findAndRemoveCard(main, cardName) {
        for (var i = 0; i < main.petLine.length; i++) {
            let tempCard = [];
            for (var j = 0; j < main.petDeck.getAt(i).length; j++) {
                if (main.petDeck.getAt(i)[j].name == cardName) {
                    let card = main.petDeck.getAt(i)[j];
                    this.moveCardToDiscardPile(main, card);
                } else {
                    tempCard.push(main.petDeck.getAt(i)[j]);
                }
            }
            main.petDeck.setAt(i, tempCard);
        }
    }

    static removeActionCardOnIndex(main, cardName, index) {
        let tempCard = [];
        for (var i = 0; i < main.petDeck.getAt(index).length; i++) {
            if (main.petDeck.getAt(index)[i].name == cardName || (main.petDeck.getAt(index)[i].special != null && main.petDeck.getAt(index)[i].special.name == cardName)) {
                console.log("removeActionCardOnIndex " + cardName);
                let card = main.petDeck.getAt(index)[i];
                this.moveCardToDiscardPile(main, card);
            } else {
                tempCard.push(main.petDeck.getAt(index)[i]);
            }
        }
        main.petDeck.setAt(index, tempCard);
    }

    static moveCardToDiscardPile(main, card) {
        if (card.block) {
            card.block = 1;
        }
        main.discardPile.push(card);
    }

    static onAim(main, card, extraprop) {
        if (extraprop != null) {
            let index = Util.nullSafety(extraprop["index"], -1);
            if (index != -1) {
                main.aimList[index] = true;
                main.actionUp[index] = card;
            } else {
                this.moveCardToDiscardPile(main, card);
            }
        }
    }

    static onTwoAim(main, card, extraprop) {
        // console.log("TODO onTwoAim");
        if (extraprop != null) {
            let index = Util.nullSafety(extraprop["index"], -1);
            if (index != -1) {
                main.aimList[index] = true;
                if ((index + 1 < 6) && (main.aimList[index + 1] == null)) {
                    main.aimList[index + 1] = true;
                    card["block"] = 2; // add card block in UI to rotate;
                } else {
                    card["block"] = 1;
                }
                main.actionUp[index] = card;
            } else {
                this.moveCardToDiscardPile(main, card);
            }
        }
    }

    static onBoom(main, card, extraprop) {
        // console.log("TODO onBoom");
        if (extraprop != null) {
            let index = Util.nullSafety(extraprop["index"], -1);
            let line = Util.nullSafety(extraprop["line"], -1);
            if (index != -1) {
                if (line == 0) {
                    // remove AIM
                    this.moveCardToDiscardPile(main, main.actionUp[index]);
                    main.aimList[index] = null;
                    main.actionUp[index] = null;
                    // check if the card is two aim

                    // onDestroyPet
                    this.onDestroyPet(main, index);
                } else if (line == 1) { // kamikaze

                }
            }
        }
        this.moveCardToDiscardPile(main, card);
    }

    static onTwoBoom(main, card, extraprop) {
        // console.log("TODO onTwoBoom");
        if (extraprop != null) {
            let index = Util.nullSafety(extraprop["index"], -1);
            let line = Util.nullSafety(extraprop["line"], -1);
            if (index != -1) {
                if (line == 0) {
                    // remove AIM
                    // todo refactor using for
                    this.moveCardToDiscardPile(main, main.actionUp[index]);
                    main.actionUp[index] = null;
                    main.aimList[index] = null;
                    this.onDestroyPet(main, index);

                    if (index + 1 < 6 && main.actionUp[index + 1] != null) {
                        this.moveCardToDiscardPile(main, main.actionUp[index + 1]);
                        main.actionUp[index + 1] = null;
                    }
                    if (index + 1 < 6 && main.aimList[index + 1] == true) {
                        main.aimList[index + 1] = null;
                        this.onDestroyPet(main, index + 1);

                    }

                    // check if the card is two aim

                    // onDestroyPet
                } else if (line == 1) {

                }
            }
        }
        this.moveCardToDiscardPile(main, card);
    }

    static onCheckMiss(main, card, extraprop) {
        // console.log("TODO onCheckMiss");
        if (extraprop != null) {
            let index = Util.nullSafety(extraprop["index"], -1);
            if (index != -1) {
                // remove AIM card
                this.moveCardToDiscardPile(main, main.actionUp[index]);
                main.actionUp[index] = null;
                main.aimList[index] = null;
                // check if the card is two aim

                let missIndex = 0;
                if (index == 0 || index == 5) {
                    //
                    missIndex = index == 0 ? index + 1 : index - 1;
                    extraprop["missIndex"] = missIndex;
                    // if no need confirmation
                    this.onMiss(main, card, extraprop);
                    this.onActionFinish(main);
                } else {
                    // emit confirmation
                    this.needConfirmation(main, card, extraprop);
                }
            }
        }
    }

    static onMiss(main, card, extraprop, missIndex = null) {
        // console.log("TODO onMiss");
        if (extraprop != null) {
            let index = Util.nullSafety(extraprop["missIndex"], -1);
            if (index != -1) {
                this.onDestroyPet(main, index);
            }
        }
        this.moveCardToDiscardPile(main, card);
    }

    static onDoom(main, card, extraprop) {
        // console.log("TODO onDoom");
        if (extraprop != null) {
            let index = Util.nullSafety(extraprop["index"], -1);
            if (index != -1) {
                // remove AIM if exist
                main.aimList[index] = null;
                if (main.actionUp[index] != null) {
                    this.moveCardToDiscardPile(main, main.actionUp[index]);
                    main.actionUp[index] = null;
                }

                // check if the card is two aim

                this.onDestroyPet(main, index);

            }
        }
    }

    static onOverShock(main, card, extraprop) {
        this.onDoom(main, card, extraprop);
    }

    static onGrenade(main, card, extraprop) {
        if (extraprop != null) {
            let index = Util.nullSafety(extraprop["index"], -1);
            if (index != -1) {
                main.grenadeList[index] = 0;
                main.actionDown[index] = card;
            } else {
                this.moveCardToDiscardPile(main, card);
            }
        }
    }

    static onMegaGrenade(main, card, extraprop) {
        if (extraprop != null) {
            let index = Util.nullSafety(extraprop["index"], -1);
            if (index != -1) {
                main.grenadeList[index] = 0;
                main.actionDown[index] = card;
                // add left and right
                if (index + 1 <= 5) {
                    main.grenadeList[index + 1] = 0;

                }
                if (index - 1 >= 0) {
                    main.grenadeList[index - 1] = 0;
                }
            } else {
                this.moveCardToDiscardPile(main, card);
            }
        }
    }

    static explodeGrenade(main, index) {
        if (main.actionDown[index] != null && main.actionDown[index].useSpecial === true) {
            let startIndex = index - 1;
            if (startIndex < 0) {
                startIndex = 0;
            }
            let endIndex = index + 1;
            if (endIndex > main.petLine.length) {
                endIndex = main.petLine.length - 1;
            }
            for (let i = startIndex; i < endIndex; i++) {
                this.onDestroyPet(main, i);
            }
        } else {
            if (index < main.petLine.length) {
                this.onDestroyPet(main, index);
            }
        }
        this.moveCardToDiscardPile(main, main.actionDown[index]);
        main.actionDown[index] = null;
    }

    static onRunning(main, card, extraprop) {
        // DONE NEED CHECK add check if pet using getCover -> separate it
        let tempCard = [];
        for (var i = 0; i < main.petDeck.getAt(0).length; i++) {
            if (main.petDeck.getAt(0)[i].hasOwnProperty("ability")) {
                let card = main.petDeck.getAt(0)[i];
                this.moveCardToDiscardPile(main, card);
            } else {
                if (i == (main.petDeck.getAt(0).length - 1)) {
                    tempCard.push(main.petDeck.getAt(0)[i]);
                } else {
                    main.petDeck.addElement([main.petDeck.getAt(0)[i]]);
                }
            }
        }
        main.petDeck.setAt(0, tempCard);// = tempCard;
        main.hideList[0] = null;
        main.trapList[0] = null;
        main.petDeck.moveForwardAll();
    }

    static onDoubleRun(main, card, extraprop) {
        for (let i = 0; i < 2; i++) {
            this.onRunning(main, card, extraprop);
        }
    }

    static onRessurect(main, card, extraprop) {
        if (main.playerObj[main.nowTurnId].life < main.playerObj[main.nowTurnId].maxLife) {
            main.playerObj[main.nowTurnId].life += 1;
            main.petDeck.addElement(main.playerObj[main.nowTurnId].defeatedPet.splice(0, 1));
            // main.petDeck.addElement([Data.PET[main.playerObj.ranger.pet]]);
        }
    }

    static onDoubleRessurect(main, card, extraprop) {
        for (let i = 0; i < 2; i++) {
            this.onRessurect(main, card, extraprop);
        }
    }

    static onLunchTime(main, card, extraprop) {
        // DONE
        for (let i = 0; i < main.actionUp.length; i++) {
            if (main.actionUp[i] !== null) {
                let card = main.actionUp[i];
                this.moveCardToDiscardPile(main, card);
            }
        }
        Util.setListElementNull(main.actionUp, 6);
        Util.setListElementNull(main.aimList, 6);
    }

    static onTyphoon(main, card, extraprop) {
        // DONE NEED CHECK add check if pet using getCover -> separate it
        // let tempPetDeck = [];
        for (var i = 0; i < main.petLine.length; i++) {
            let tempCard = [];
            for (var j = 0; j < main.petDeck.getAt(i).length; j++) {
                if (main.petDeck.getAt(i)[j].hasOwnProperty("ability")) {
                    let card = main.petDeck.getAt(i)[j];
                    this.moveCardToDiscardPile(main, card);
                } else {
                    if (tempCard.length > 0) {
                        main.petDeck.addElement([main.petDeck.getAt(i)[j]]);
                    } else {
                        tempCard.push(main.petDeck.getAt(i)[j]);
                    }
                }
            }
            main.petDeck.setAt(i, tempCard);
        }
        main.petDeck.shuffleAll();
        Util.setListElementNull(main.hideList, 6);
        Util.setListElementNull(main.trapList, 6);
    }

    static onHide(main, card, extraprop) {
        if (extraprop != null) {
            let index = Util.nullSafety(extraprop["index"], -1);
            if (index != -1) {
                // remove hide if there is hide
                this.removeActionCardOnIndex(main, card["name"], index);
                this.addCardToPet(main, card, extraprop);
                main.hideList[index] = main.nowTurnId;
            }
        }
    }

    static onArmor(main, card, extraprop) {
        if (extraprop != null) {
            this.addCardToPet(main, card, extraprop);
        }
    }

    static onShield(main, card, extraprop) {
        if (extraprop != null) {
            this.addCardToPet(main, card, extraprop);
        }
    }

    static onBumpLeft(main, card, extraprop) {
        if (extraprop != null) {
            let index = Util.nullSafety(extraprop["index"], 0);
            this.onAimMove(main, index > 0, index, -1);
        }
        this.moveCardToDiscardPile(main, card);
    }

    static onBumpRight(main, card, extraprop) {
        if (extraprop != null) {
            let index = Util.nullSafety(extraprop["index"], 5);
            this.onAimMove(main, index < 5, index, 1);
        }
        this.moveCardToDiscardPile(main, card);
    }

    static onGoForward(main, card, extraprop) {
        // DONE
        if (extraprop != null) {
            let index = Util.nullSafety(extraprop["index"], 0);
            this.onPetGo(main, index > 0, index, -1);
        }
        this.moveCardToDiscardPile(main, card);
    }

    static onGoBackward(main, card, extraprop) {
        // DONE
        if (extraprop != null) {
            let index = Util.nullSafety(extraprop["index"], 5);
            let maxIndex = 5;
            if (maxIndex > (main.petDeck.toArray().length - 1)) {
                maxIndex = main.petDeck.toArray().length - 1;
            }
            this.onPetGo(main, index < maxIndex, index, 1);
        }
        this.moveCardToDiscardPile(main, card);
    }

    static onGoAnyward(main, card, extraprop) {
        // console.log("TODO onGoAnyward");
        if (extraprop != null) {
            let index = Util.nullSafety(extraprop["index"], 5);
            let goIndex = Util.nullSafety(extraprop["goIndex"], -1);
            let condition = true;
            if (goIndex < 0) { // -2
                if (index + goIndex < 0) {
                    goIndex = -1;
                }
                condition = index + goIndex >= 0;
            } else { // +2
                if (index + goIndex > main.petDeck.toArray().length) {
                    goIndex = 1;
                }
                condition = index + goIndex <= main.petDeck.toArray().length;
            }
            this.onPetGo(main, condition, index, goIndex);
        }
        // need confirmation
        this.moveCardToDiscardPile(main, card);
    }

    static onCheckGoAnyward(main, card, extraprop) {
        // console.log("TODO onCheckGoAnyward");
        // emit confirmation
        this.needConfirmation(main, card, extraprop);
    }

    static onGetCover(main, card, extraprop) {
        // console.log("TODO onGetCover");
        if (extraprop != null) {
            let index = Util.nullSafety(extraprop["index"], -1);
            let coverIndex = Util.nullSafety(extraprop["coverIndex"], -1);
            // console.log("TODO coverIndex" + index);
            // console.log("TODO coverIndex" + coverIndex);
            if (coverIndex != -1) {
                // console.log("TODO coverIndex length: " + main.petDeck.getAt(coverIndex).length);
                if (main.petDeck.getAt(coverIndex)[0].name !== Data.PET["Jungle"].name) {
                    let tempPet = main.petDeck.getAt(index);
                    // console.log("Def " + main.petDeck);
                    // console.log(main.petDeck);
                    main.petDeck.getAt(coverIndex).push(...tempPet);
                    // console.log("AfterCover " + main.petDeck);
                    // console.log(main.petDeck);
                    main.petDeck.removeAt(index);
                    // console.log("RemoveOld " + main.petDeck);
                    // console.log(main.petDeck);
                    // TODO if there is hide card move theHideList
                }
            }
        }
    }

    static onCheckGetCover(main, card, extraprop) {
        // console.log("TODO onCheckGetCover");
        if (extraprop != null) {
            const minIndex = 0;
            let maxIndex = 5;
            if (maxIndex > main.petLine.length) {
                maxIndex = main.petLine.length - 1;
            }
            let index = Util.nullSafety(extraprop["index"], -1);
            let coverIndex = -1;
            if (index == minIndex || index == maxIndex) {
                coverIndex = index == 0 ? index + 1 : index - 1;
                extraprop["coverIndex"] = coverIndex;
                this.onGetCover(main, card, extraprop);
                this.onActionFinish(main);
            } else {
                // emit confirmation
                this.needConfirmation(main, card, extraprop);
            }
        }
    }

    static onMasterHide(main, card, extraprop) {
        // console.log("TODO onMasterHide");
        this.needConfirmation(main, card, extraprop);
    }

    static onCheckMasterHide(main, card, extraprop) {
        // console.log("TODO onCheckMasterHide");
        // if
        // emit confirmation
        this.onActionFinish(main);
        // this.needConfirmation(main, card, extraprop);
    }

    static onTrap(main, card, extraprop) {
        // console.log("TODO onTrap");
        if (extraprop != null) {
            let index = Util.nullSafety(extraprop["index"], -1);
            if (index != -1) {
                // remove hide if there is hide
                this.removeActionCardOnIndex(main, card["name"], index);
                this.addCardToPet(main, card, extraprop);
                main.trapList[index] = main.nowTurnId;
            }
        }
    }

    static onMovingAim(main, card, extraprop) {
        // console.log("TODO onMovingAim");
        if (extraprop != null) {
            main.actionUp = extraprop["actionUp"];
            main.aimList = extraprop["aimList"];
        }
    }

    static onCheckMovingAim(main, card, extraprop) {
        // console.log("TODO onCheckMovingAim");
        // emit confirmation
        this.needConfirmation(main, card, extraprop);
    }

    static onMoveThePet(main, card, extraprop) {
        if (extraprop != null) {
            for (let i = 0; i < main.petLine.length; i++) {
                let pet = extraprop["petLine"][i];
                main.petDeck.setAt(i, pet);
            }
        }
    }

    static onCheckMoveThePet(main, card, extraprop) {
        // console.log("TODO onCheckMoveThePet");
        // emit confirmation
        this.needConfirmation(main, card, extraprop);
    }

    static onKamikaze(main, card, extraprop) {
        if (extraprop != null) {
            this.addCardToPet(main, card, extraprop);
        }
    }

    static onEscape(main, card, extraprop) {
        // console.log("TODO onEscape");
        if (extraprop != null) {
            let index = Util.nullSafety(extraprop["index"], -1);
            if (index != -1 && main.petDeck.toArray().length > 5) {
                const firstPetDeckIndex = 6;
                // let copyOfPetDeck = [...main.petDeck.toArray()];
                // get pet card
                var petCard = main.petDeck.getAt(index);
                let tempCard = [];
                for (let i = 0; i < petCard.length; i++) {
                    if (main.petDeck.getAt(index)[i].hasOwnProperty("ability")) {
                        // if there is armor/shield/hide remove (action card) move to discardPile
                        let card = main.petDeck.getAt(index)[i];
                        this.moveCardToDiscardPile(main, card);
                    } else {
                        // if there is other pet add to petDeck too
                        main.petDeck.addElement([main.petDeck.getAt(index)[i]]);
                        // tempCard.push(main.petDeck.getAt(index)[i]);
                    }
                }
                // main.petDeck.setAt(index, tempCard);
                // add to petDeck
                // main.petDeck.addElement(petCard);

                // shuffle petDeck (exclude the pet line)
                main.petDeck.shuffleOn(firstPetDeckIndex, main.petDeck.toArray().length);

                // get first petDeck and put in the petCard oldIndex
                let newPet = main.petDeck.getAt(firstPetDeckIndex);
                main.petDeck.setAt(index, newPet);
                main.petDeck.removeAt(firstPetDeckIndex);

                // set the pet deck from copyOfPetDeck
            }

        }
    }
}

module.exports = AbilityUtil;
