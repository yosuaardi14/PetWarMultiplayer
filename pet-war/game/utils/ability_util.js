const Main = require("../main");
const Data = require("../values/data");
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
                this.onDoom(main, card, extraprop);
                this.moveCardToDiscardPile(main, card);
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
                this.onRunning(main, card, extraprop);
                this.moveCardToDiscardPile(main, card);
                this.onActionFinish(main);
                break;
            case "Typhoon":
                this.onTyphoon(main, card, extraprop);
                this.moveCardToDiscardPile(main, card);
                this.onActionFinish(main);
                break;
            case "Ressurect":
                this.onRessurect(main, card, extraprop);
                this.moveCardToDiscardPile(main, card);
                this.onActionFinish(main);
                break;
            case "MoveThePet":
                // need confirmation
                this.onCheckMoveThePet(main, card, extraprop);
                // this.onMoveThePet(main, card, extraprop);
                this.moveCardToDiscardPile(main, card);
                break;
            case "LunchTime":
                this.onLunchTime(main, card, extraprop);
                this.moveCardToDiscardPile(main, card);
                this.onActionFinish(main);
                break;
            default:
                isNotFound = true;
                console.log(cardAbility + " is 404");
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
                this.onDoubleRessurect(main, card, extraprop);
                this.moveCardToDiscardPile(main, card);
                this.onActionFinish(main);
                break;
            case "GoAnyward":
                // need confirmation
                this.onCheckGoAnyward(main, card, extraprop);
                // this.onGoAnyward(main, card, extraprop);
                break;
            case "OverShock":
                // Same as Doom
                this.onOverShock(main, card, extraprop);
                this.onActionFinish(main);
                break;
            case "DoubleRun":
                this.onDoubleRun(main, card, extraprop);
                this.moveCardToDiscardPile(main, card);
                this.onActionFinish(main);
                break;
            case "Escape":
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
                console.log(cardAbility + " is 404");
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
                this.onMiss(main, card, extraprop);
                break;
            case "GetCover":
                // targetIndex (1/-1)
                this.onGetCover(main, card, extraprop);
                break;
            case "GoAnyward":
                // targetIndex (2/-2)
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
                main.io.to(main.nowTurn).emit("confirmAction", "aimList");
                break;
            case "MoveThePet":
                // petLine
                main.io.to(main.nowTurn).emit("confirmAction", "petLine");
                break;
            case "MasterHide":
                // targetIndex
                main.io.to(main.nowTurn).emit("confirmAction", "masterHideIndex");
                break;
            case "Miss":
            // targetIndex (1/-1)
            case "GetCover":
            // targetIndex (1/-1)
            case "GoAnyward":
                // targetIndex (2/-2)
                main.io.to(main.nowTurn).emit("confirmAction", "targetIndex");
                break;
            default:
                // do nothing
                break;
        }
    }

    static onActionFinish(main) {
        main.io.to(main.nowTurn).emit("confirmAction", "");
    }

    //
    static onAimMove(main, condition, targetIndex, indexVal) {
        // check is 0 < index < 5
        // check is empty
        if (condition) {
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
        console.log("onPetGo condition:"+condition);
        if (condition) {
            let petCard = main.petDeck.getAt(targetIndex);//[targetIndex];
            let oldPetCard = main.petDeck.getAt(targetIndex + indexVal);//[targetIndex + indexVal];
            main.petDeck.setAt(targetIndex, oldPetCard);//[targetIndex] = oldPetCard;
            main.petDeck.setAt(targetIndex + indexVal, petCard);//[targetIndex + indexVal] = petCard;
            // Equal ???
            // [main.petDeck[targetIndex], main.petDeck[targetIndex + indexVal]] = [main.petDeck[targetIndex + indexVal], main.petDeck[targetIndex]];
        }
    }

    static onCover() {
        // check is 0 < index < 5
        // check target isForest
    }

    static onDestroyPet(main, targetIndex) {
        // check target isForest -> do nothing
        if (main.petDeck.getAt(targetIndex)[0].name === Data.PET["Jungle"].name || main.petDeck.getAt(targetIndex)[0].name === Data.ACTION["Hide-Master Hide"].name) {

        }
        // check target hasHide -> do nothing
        // main.petDeck.getAt(targetIndex)[0];
        // check target hasKamikaze
        // check target hasShield -> change shield to Armor (useSpecial => false)
        // check target hasArmor -> destroy Armor
    }

    static addCardToPet(main, card, extraprop) {
        let index = Util.nullSafety(extraprop["index"], -1);
        if (index != -1) {
            // check splice
            main.petDeck.getAt(index).unshift(card);//.splice(index, 0, card);
        }
    }

    static moveCardToDiscardPile(main, card) {
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
        console.log("TODO onTwoAim");
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
    static onBoom(main, card, extraprop) {
        console.log("TODO onBoom");
        this.moveCardToDiscardPile(main, card);
    }

    static onTwoBoom(main, card, extraprop) {
        console.log("TODO onTwoBoom");
        this.moveCardToDiscardPile(main, card);
    }

    static onCheckMiss(main, card, extraprop) {
        console.log("TODO onCheckMiss");
        // if no need confirmation
        // this.onMiss(main, card, extraprop);
        this.onActionFinish(main);
        // else
        // emit confirmation
        // this.needConfirmation(main, card, extraprop);
    }

    static onMiss(main, card, extraprop) {
        console.log("TODO onMiss");
        this.moveCardToDiscardPile(main, card);
    }

    static onDoom(main, card, extraprop) {
        console.log("TODO onDoom");
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

    static onRunning(main, card, extraprop) {
        let tempCard = [];
        for (var i = 0; i < main.petDeck.getAt(0).length; i++) {
            if (main.petDeck.getAt(0)[i].hasOwnProperty("ability")) {
                main.discardPile.push(main.petDeck.getAt(0)[i]);
            } else {
                tempCard.push(main.petDeck.getAt(0)[i]);
            }
        }
        main.petDeck.setAt(0, tempCard);// = tempCard;
        main.petDeck.moveForwardAll();
    }

    static onDoubleRun(main, card, extraprop) {
        for (let i = 0; i < 2; i++) {
            this.onRunning(main, card, extraprop);
        }
    }

    static onRessurect(main, card, extraprop) {
        if (main.playerObj[main.nowTurn].life < main.playerObj[main.nowTurn].maxLife) {
            main.playerObj[main.nowTurn].life += 1;
            main.petDeck.addElement(main.playerObj.defeatedPet.splice(0, 1));
            // main.petDeck.addElement([Data.PET[main.playerObj.ranger.pet]]);
        }
    }

    static onDoubleRessurect(main, card, extraprop) {
        for (let i = 0; i < 2; i++) {
            this.onRessurect(main, card, extraprop);
        }
    }

    static onLunchTime(main, card, extraprop) {
        for (let i = 0; i < main.actionUp.length; i++) {
            if (main.actionUp[i] !== null) {
                main.discardPile.push(main.actionUp[i]);
            }
        }
        Util.setListElementNull(main.actionUp, 6);
        Util.setListElementNull(main.aimList, 6);
    }

    static onTyphoon(main, card, extraprop) {
        for (var i = 0; i < main.petLine.length; i++) {
            let tempCard = [];
            for (var j = 0; j < main.petDeck.getAt(i).length; j++) {
                if (main.petDeck.getAt(i)[j].hasOwnProperty("ability")) {
                    main.discardPile.push(main.petDeck.getAt(i)[j]);
                } else {
                    tempCard.push(main.petDeck.getAt(i)[j]);
                }
            }
            main.petDeck.setAt(i, tempCard);
        }
        main.petDeck.shuffleAll();
    }

    static onHide(main, card, extraprop) {
        // TODO Set hide card to the top
        if (extraprop != null) {
            this.addCardToPet(main, card, extraprop);
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
        if (extraprop != null) {
            let index = Util.nullSafety(extraprop["index"], 0);
            this.onPetGo(main, index > 0, index, -1);
        }
        this.moveCardToDiscardPile(main, card);
    }

    static onGoBackward(main, card, extraprop) {
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
        console.log("TODO onGoAnyward");
        // if (extraprop != null) {
        //     let index = Util.nullSafety(extraprop["index"], 5);
        //     let maxIndex = 5;
        //     if (maxIndex > (main.petDeck.toArray().length - 1)) {
        //         maxIndex = main.petDeck.toArray().length - 1;
        //     }
        //     this.onPetGo(main, index < maxIndex, index, 2);
        // }
        // need confirmation
        this.moveCardToDiscardPile(main, card);
    }

    static onCheckGoAnyward(main, card, extraprop) {
        console.log("TODO onCheckGoAnyward");
        // emit confirmation
        this.needConfirmation(main, card, extraprop);
    }

    static onGetCover(main, card, extraprop) {
        console.log("TODO onGetCover");
    }

    static onCheckGetCover(main, card, extraprop) {
        console.log("TODO onCheckGetCover");
        // emit confirmation
        this.needConfirmation(main, card, extraprop);
    }

    static onMasterHide(main, card, extraprop) {
        console.log("TODO onMasterHide");
        this.needConfirmation(main, card, extraprop);
    }

    static onCheckMasterHide(main, card, extraprop) {
        console.log("TODO onCheckMasterHide");
        // if
        // emit confirmation
        this.needConfirmation(main, card, extraprop);
    }

    static onTrap(main, card, extraprop) {
        console.log("TODO onTrap");
    }

    static onMovingAim(main, card, extraprop) {
        console.log("TODO onMovingAim");
    }

    static onCheckMovingAim(main, card, extraprop) {
        console.log("TODO onCheckMovingAim");
        // emit confirmation
        this.needConfirmation(main, card, extraprop);
    }

    static onMoveThePet(main, card, extraprop) {
        console.log("TODO onMoveThePet");
        
    }

    static onCheckMoveThePet(main, card, extraprop) {
        console.log("TODO onCheckMoveThePet");
        // emit confirmation
        this.needConfirmation(main, card, extraprop);
    }

    static onKamikaze(main, card, extraprop) {
        if (extraprop != null) {
            this.addCardToPet(main, card, extraprop);
        }
    }

    static onEscape(main, card, extraprop) {
        console.log("TODO onEscape");
    }


}

module.exports = AbilityUtil;