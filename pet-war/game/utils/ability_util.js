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
                this.onActionFinish(main);
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
                this.onActionFinish(main);
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
                    extraprop["goIndex"] = extraprop["targetIndex"] == "left" ? -2 : 2;
                }
                this.onGoAnyward(main, card, extraprop);
                break;
            default:
                // do nothing
                isNotFound = true;
                this.onActionFinish(main);
                console.log(cardAbility + " is 404");
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
            // TWO AIM TAIL
            if (main.actionUp[targetIndex] == null && main.aimList[targetIndex] == true) {
                if ((targetIndex + indexVal - 1) < 0 || (targetIndex + indexVal) > 5) {
                    return;
                }
                console.log("onAimMove");
                //let isTwoAim = main.actionUp[targetIndex].name === Data.ACTION["Two Aim"].name && main.actionUp[targetIndex].block == 2;
                //let isTwoAimTail = main.actionUp[targetIndex] == null && main.aimList[targetIndex] == true && main.actionUp[targetIndex - 1].name === Data.ACTION["Two Aim"].name && main.actionUp[targetIndex - 1].block == 2;
                // let cardBlockNum = isTwoAim ? 2 : 1;

                let aimCard = main.actionUp[targetIndex - 1];
                let targetPosAim = targetIndex + indexVal - 1;
                let targetPosTail = targetIndex + indexVal;
                console.log("onAimMove(A,T): " + targetPosAim + "," + targetPosTail);
                if (indexVal < 0) { // -1
                    if (main.actionUp[targetPosAim] == null && main.aimList[targetPosAim] == null) {
                        console.log("onAimMove");
                        main.aimList[targetIndex] = null;
                        main.actionUp[targetIndex - 1] = null;

                        main.aimList[targetPosAim] = true;
                        main.aimList[targetPosTail] = true;
                        main.actionUp[targetPosAim] = aimCard;
                    }
                } else { // 1
                    if (main.actionUp[targetPosTail] == null && main.aimList[targetPosTail] == null) {
                        console.log("onAimMove");
                        main.aimList[targetIndex - 1] = null;
                        main.actionUp[targetIndex - 1] = null;
                        main.aimList[targetPosAim] = true;
                        main.aimList[targetPosTail] = true;
                        main.actionUp[targetPosAim] = aimCard;
                    }
                }
            } else if (main.actionUp[targetIndex] != null && main.actionUp[targetIndex].name === Data.ACTION["Two Aim"].name && main.actionUp[targetIndex].block == 2) {
                let aimCard = main.actionUp[targetIndex];
                let targetPosAim = targetIndex + indexVal;
                let targetPosTail = targetIndex + indexVal + 1;
                console.log("onAimMove(A,T): " + targetPosAim + "," + targetPosTail);
                if (indexVal < 0) { // -1
                    if (main.actionUp[targetPosAim] == null && main.aimList[targetPosAim] == null) {
                        console.log("onAimMove");
                        main.aimList[targetIndex] = null;
                        main.aimList[targetIndex + 1] = null;
                        main.actionUp[targetIndex] = null;

                        main.aimList[targetPosAim] = true;
                        main.aimList[targetPosTail] = true;
                        main.actionUp[targetPosAim] = aimCard;
                    }
                } else { // 1
                    if (main.actionUp[targetPosTail] == null && main.aimList[targetPosTail] == null) {
                        console.log("onAimMove");
                        main.aimList[targetIndex] = null;
                        main.actionUp[targetIndex] = null;
                        main.aimList[targetPosAim] = true;
                        main.aimList[targetPosTail] = true;
                        main.actionUp[targetPosAim] = aimCard;
                    }
                }
            } else {
                if (main.actionUp[targetIndex + indexVal] == null && main.aimList[targetIndex + indexVal] == null) {
                    // move
                    const aimCard = main.actionUp[targetIndex];
                    main.aimList[targetIndex] = null;
                    main.aimList[targetIndex + indexVal] = true;
                    main.actionUp[targetIndex] = null;
                    main.actionUp[targetIndex + indexVal] = aimCard;
                }
            }

        }
    }

    static onPetGo(main, condition, targetIndex, indexVal) {
        if (main.trapList[targetIndex] != null) {
            console.log("Tidak bisa bergerak karena ada Trap");
            main.io.to(main.roomID).emit("infoAction", "Tidak bisa bergerak karena ada Trap");
            return;
        }
        // console.log("onPetGo condition:" + condition);
        if (condition) {
            let petCard = main.petDeck.getAt(targetIndex);//[targetIndex];
            let hidePet = main.hideList[targetIndex];
            // let oldPetCard = main.petDeck.getAt(targetIndex + indexVal);//[targetIndex + indexVal];
            // main.petDeck.setAt(targetIndex, oldPetCard);//[targetIndex] = oldPetCard;
            // main.petDeck.setAt(targetIndex + indexVal, petCard);//[targetIndex + indexVal] = petCard;
            let startIndex = -1;
            let endIndex = -1;
            // let selectedCard
            if ((targetIndex + indexVal) < targetIndex) { // Forward (-)
                startIndex = targetIndex;
                endIndex = targetIndex + indexVal;
                for (let i = startIndex; i > endIndex; i--) {
                    let tempPet = main.petDeck.getAt(i - 1);
                    main.petDeck.setAt(i, tempPet);
                    let tempHide = main.hideList[i - 1];
                    main.hideList[i] = tempHide;
                }
                // main.petDeck.setAt(endIndex, petCard);
                // main.hideList[endIndex] = hidePet;
            } else { // Backward (+)
                startIndex = targetIndex; // 3
                endIndex = targetIndex + indexVal; // 5
                for (let i = startIndex; i < endIndex; i++) {
                    let tempPet = main.petDeck.getAt(i + 1);
                    main.petDeck.setAt(i, tempPet);
                    let tempHide = main.hideList[i + 1];
                    main.hideList[i] = tempHide;
                }
                // main.petDeck.setAt(endIndex, petCard);
                // main.hideList[endIndex] = hidePet;
            }
            main.petDeck.setAt(endIndex, petCard);
            main.hideList[endIndex] = hidePet;


            // if (main.hideList[targetIndex] != null) {
            //     if (main.hideList[targetIndex + indexVal] != null) {
            //         let newHide = main.playerIdArr.indexOf(main.hideList[targetIndex]);
            //         let oldHide = main.playerIdArr.indexOf(main.hideList[targetIndex + indexVal]);
            //         main.hideList[targetIndex + indexVal] = oldHide < newHide ? main.hideList[targetIndex] : main.hideList[targetIndex + indexVal];
            //     } else {
            //         main.hideList[targetIndex + indexVal] = main.hideList[targetIndex];
            //     }
            // } else if (main.hideList[targetIndex + indexVal] != null) {
            //     main.hideList[targetIndex + indexVal] = main.hideList[targetIndex];
            // }
        }
    }

    static onMoveTrapOrHide(main, index, newIndex, type) {
        if (type == "onPetGo") {
            main.hideList = this.goHideOrTrapList(main, main.hideList, index, newIndex);

            main.trapList = this.goHideOrTrapList(main, main.trapList, index, newIndex);
        } else if (type == "onPetMove") {

        }
    }

    static goHideOrTrapList(main, arrList, index, newIndex) {
        if (arrList[index] != null) {
            if (arrList[newIndex] != null) {
                let newCard = main.playerIdArr.indexOf(arrList[index]);
                let oldCard = main.playerIdArr.indexOf(arrList[newIndex]);
                arrList[newIndex] = oldCard < newCard ? arrList[index] : arrList[newIndex];
            } else {
                arrList[newIndex] = arrList[index];
            }
        } else if (arrList[newIndex] != null) {
            arrList[index] = arrList[newIndex];
        }
        return arrList;
    }

    static onCover(main, condition, targetIndex, indexVal) {
        // check is 0 < index < 5
        if (targetIndex + indexVal < 0) {

        }
        // check target isForest

    }

    static onNewDestroyPet(main, targetIndex) {
        if (targetIndex >= main.petDeck.length) {
            return false;
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
            if (isForest)
                main.io.to(main.roomID).emit("infoAction", "Forest diserang");
            if (isHide)
                main.io.to(main.roomID).emit("infoAction", "Serangan tidak berguna karena ada Hide");
            // main.io.to(main.roomID).emit("infoAction", "Forest diserang");
            return false;
        }
        // // main.petDeck.getAt(targetIndex)[0];
        // // check target hasKamikaze
        let hasKamikaze = useSpecialAbility && (specialCardName == Data.ACTION["Aim-Kamikaze"].special.name);
        if (hasKamikaze) {
            console.log("hasKamikaze : true");
            main.io.to(main.roomID).emit("infoAction", "Kamikaze aktif");
            this.moveCardToDiscardPile(main, main.petDeck.getAt(targetIndex)[0]);
            main.petDeck.getAt(targetIndex).splice(0, 1);
            let lpgZordIndex = -1;
            for (let i = 0; i < main.petDeck.getAt(targetIndex).length; i++) {
                let petName = main.petDeck.getAt(targetIndex)[i].name;
                if (petName == Data.PET["Lpg-Zord"].name) {
                    lpgZordIndex = i;
                    break;
                }
            }
            if (lpgZordIndex != -1) {
                let playerId = GameUtil.getPlayerIdByPet(Data.PET["Lpg-Zord"].name, main.playerObj);
                main.io.to(main.roomID).emit("infoAction", main.petDeck.getAt(targetIndex)[lpgZordIndex].name + " mati");
                main.playerObj[playerId].life--;
                main.playerObj[playerId].defeatedPet.push(main.petDeck.getAt(targetIndex)[lpgZordIndex]);
                if (main.petDeck.getAt(targetIndex).length > 1) {
                    main.petDeck.getAt(targetIndex).splice(lpgZordIndex, 1);
                } else {
                    main.petDeck.removeAt(targetIndex);
                }
                this.activeKamikaze(main, targetIndex);
            }
            return false;
        }
        // // check target hasShield -> change shield to Armor (useSpecial => false)
        let isShield = useSpecialAbility && isSpecialCard && (specialCardName == Data.ACTION["Armor-Shield"].special.name);
        console.log((cardName == Data.ACTION["Armor-Shield"].special.name));
        console.log("isShield");
        if (isShield) {
            console.log("isShield : true");
            main.petDeck.getAt(targetIndex)[0].useSpecial = false;
            main.io.to(main.roomID).emit("infoAction", "Shield telah menjadi Armor");
            return false;
        }
        // // check target hasArmor -> destroy Armor
        let isArmor = !useSpecialAbility && (cardName == Data.ACTION["Armor"].name);
        console.log("isArmor");
        if (isArmor) {
            console.log("isArmor : true");
            this.moveCardToDiscardPile(main, main.petDeck.getAt(targetIndex)[0]);
            main.petDeck.getAt(targetIndex).splice(0, 1);
            main.io.to(main.roomID).emit("infoAction", "Armor dihancurkan");
            return false;
        }

        let playerId = GameUtil.getPlayerIdByPet(cardName, main.playerObj);
        main.playerObj[playerId].life--;
        main.playerObj[playerId].defeatedPet.push(main.petDeck.getAt(targetIndex)[0]);
        let emptyBlock = false;
        if (main.petDeck.getAt(targetIndex).length > 1) {
            main.petDeck.getAt(targetIndex).splice(0, 1);
        } else {
            main.petDeck.removeAt(targetIndex);
            emptyBlock = true;
        }
        main.io.to(main.roomID).emit("infoAction", main.playerObj[playerId]["ranger"]["pet"] + " mati");
        return emptyBlock;
    }

    static onDestroyPet(main, targetIndex) {
        if (targetIndex >= main.petDeck.length) {
            return false;
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
            if (isForest)
                main.io.to(main.roomID).emit("infoAction", "Forest diserang");
            if (isHide)
                main.io.to(main.roomID).emit("infoAction", "Serangan tidak berguna karena ada Hide");
            // main.io.to(main.roomID).emit("infoAction", "Forest diserang");
            return false;
        }
        // // main.petDeck.getAt(targetIndex)[0];
        // // check target hasKamikaze
        let hasKamikaze = useSpecialAbility && (specialCardName == Data.ACTION["Aim-Kamikaze"].special.name);
        if (hasKamikaze) {
            console.log("hasKamikaze : true");
            main.io.to(main.roomID).emit("infoAction", "Kamikaze aktif");
            this.moveCardToDiscardPile(main, main.petDeck.getAt(targetIndex)[0]);
            main.petDeck.getAt(targetIndex).splice(0, 1);
            let lpgZordIndex = -1;
            for (let i = 0; i < main.petDeck.getAt(targetIndex).length; i++) {
                let petName = main.petDeck.getAt(targetIndex)[i].name;
                if (petName == Data.PET["Lpg-Zord"].name) {
                    lpgZordIndex = i;
                    break;
                }
            }
            if (lpgZordIndex != -1) {
                let playerId = GameUtil.getPlayerIdByPet(Data.PET["Lpg-Zord"].name, main.playerObj);
                main.playerObj[playerId].life--;
                main.playerObj[playerId].defeatedPet.push(main.petDeck.getAt(targetIndex)[lpgZordIndex]);
                let emptyBlock = false;
                if (main.petDeck.getAt(targetIndex).length > 1) {
                    main.petDeck.getAt(targetIndex).splice(lpgZordIndex, 1);
                } else {
                    main.petDeck.removeAt(targetIndex);
                    // main.hideList.splice(targetIndex, 1);
                    // main.trapList.splice(targetIndex, 1);
                    // main.hideList[5] = null;
                    // main.trapList[5] = null;
                    emptyBlock = true;
                }
                this.activeKamikaze(main, targetIndex, emptyBlock);
            }
            return false;
        }
        // // check target hasShield -> change shield to Armor (useSpecial => false)
        let isShield = useSpecialAbility && isSpecialCard && (specialCardName == Data.ACTION["Armor-Shield"].special.name);
        console.log((cardName == Data.ACTION["Armor-Shield"].special.name));
        console.log("isShield");
        if (isShield) {
            console.log("isShield : true");
            main.petDeck.getAt(targetIndex)[0].useSpecial = false;
            main.io.to(main.roomID).emit("infoAction", "Shield telah menjadi Armor");
            return false;
        }
        // // check target hasArmor -> destroy Armor
        let isArmor = !useSpecialAbility && (cardName == Data.ACTION["Armor"].name);
        console.log("isArmor");
        if (isArmor) {
            console.log("isArmor : true");
            this.moveCardToDiscardPile(main, main.petDeck.getAt(targetIndex)[0]);
            main.petDeck.getAt(targetIndex).splice(0, 1);
            main.io.to(main.roomID).emit("infoAction", "Armor dihancurkan");
            return false;
        }

        let playerId = GameUtil.getPlayerIdByPet(cardName, main.playerObj);
        main.playerObj[playerId].life--;
        main.playerObj[playerId].defeatedPet.push(main.petDeck.getAt(targetIndex)[0]);
        let emptyBlock = false;
        if (main.petDeck.getAt(targetIndex).length > 1) {
            main.petDeck.getAt(targetIndex).splice(0, 1);
        } else {
            main.petDeck.removeAt(targetIndex);
            // main.hideList.splice(targetIndex, 1);
            // main.trapList.splice(targetIndex, 1);
            // main.hideList[5] = null;
            // main.trapList[5] = null;
            emptyBlock = true;
        }
        main.io.to(main.roomID).emit("infoAction", main.playerObj[playerId]["ranger"]["pet"] + " mati");
        return emptyBlock;

    }

    static addCardToPet(main, card, extraprop) {
        let index = Util.nullSafety(extraprop["index"], -1);
        if (index != -1) {
            // check splice
            // DONE Set hide card to the top
            // let hasHide = false;
            let tempCard = [];
            let hideCard = null;
            // for (let i = 0; i < main.petDeck.getAt(index).length; i++) {
            //     if ((main.petDeck.getAt(index)[i].useSpecial === false) && (main.petDeck.getAt(index)[i].name === Data.ACTION["Hide"].name)) {
            //         hideCard = main.petDeck.getAt(index)[i];
            //         // console.log("hideCard: ");
            //         // console.log(hideCard);
            //     } else {
            //         tempCard.push(main.petDeck.getAt(index)[i]);
            //     }
            // }
            // if (hideCard != null) {
            //     main.petDeck.setAt(index, tempCard);
            //     main.petDeck.getAt(index).unshift(card);//.splice(index, 0, card);
            //     main.petDeck.getAt(index).unshift(hideCard);
            // } else {
            main.petDeck.getAt(index).unshift(card);//.splice(index, 0, card);
            // }
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
        if (card != null) {
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
                    if (main.actionUp[index] != null) {
                        // check if the card is two aim
                        let isTwoAim = main.actionUp[index].name === Data.ACTION["Two Aim"].name && main.actionUp[index].block == 2;
                        if (isTwoAim && main.aimList[index + 1] != null) {
                            main.actionUp[index].block = 1;
                            main.actionUp[index + 1] = main.actionUp[index];
                            main.actionUp[index] = null;
                        } else {
                            this.moveCardToDiscardPile(main, main.actionUp[index]);
                            main.actionUp[index] = null;
                        }
                    } else {
                        // two aim (virtual card)
                        let isTwoAim = main.actionUp[index - 1].name === Data.ACTION["Two Aim"].name && main.actionUp[index - 1].block == 2;
                        if (isTwoAim && main.aimList[index - 1] != null) {
                            main.actionUp[index - 1].block = 1;
                        }
                    }
                    main.aimList[index] = null;

                    // onDestroyPet
                    this.onDestroyPet(main, index);
                } else if (line == 1) { // kamikaze
                    this.onDestroyPet(main, index);
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
                    if (main.actionUp[index] != null) {
                        this.moveCardToDiscardPile(main, main.actionUp[index]);
                        main.actionUp[index] = null;
                    } else {
                        // two aim (virtual card)
                        let isTwoAim = main.actionUp[index - 1].name === Data.ACTION["Two Aim"].name && main.actionUp[index - 1].block == 2;
                        if (isTwoAim && main.aimList[index - 1] != null) {
                            main.actionUp[index - 1].block = 1;
                        }
                    }
                    main.aimList[index] = null;
                    let leaveEmpty = this.onDestroyPet(main, index);

                    if (index + 1 < 6 && main.actionUp[index + 1] != null) {
                        let isTwoAim = main.actionUp[index + 1].name === Data.ACTION["Two Aim"].name && main.actionUp[index + 1].block == 2;
                        if (isTwoAim && main.aimList[index + 1 + 1] != null) {
                            main.actionUp[index + 1].block = 1;
                            main.actionUp[index + 1 + 1] = main.actionUp[index + 1];
                            main.actionUp[index + 1] = null;
                        } else {
                            this.moveCardToDiscardPile(main, main.actionUp[index + 1]);
                            main.actionUp[index + 1] = null;
                        }
                        // this.moveCardToDiscardPile(main, main.actionUp[index + 1]);
                        // main.actionUp[index + 1] = null;
                    }
                    if (index + 1 < 6 && main.aimList[index + 1] == true) {
                        main.aimList[index + 1] = null;
                        this.onDestroyPet(main, leaveEmpty ? index : index + 1);
                    }

                    // check if the card is two aim

                    // onDestroyPet
                } else if (line == 1) {
                    this.onDestroyPet(main, index);
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
                if (main.actionUp[index] != null) {
                    let isTwoAim = main.actionUp[index].name === Data.ACTION["Two Aim"].name && main.actionUp[index].block == 2;
                    if (isTwoAim && main.aimList[index + 1] != null) {
                        main.actionUp[index].block = 1;
                        main.actionUp[index + 1] = main.actionUp[index];
                        main.actionUp[index] = null;
                    } else {
                        this.moveCardToDiscardPile(main, main.actionUp[index]);
                        main.actionUp[index] = null;
                    }
                    // this.moveCardToDiscardPile(main, main.actionUp[index]);
                    // main.actionUp[index] = null;
                } else {
                    // two aim (virtual card)
                    let isTwoAim = main.actionUp[index - 1].name === Data.ACTION["Two Aim"].name && main.actionUp[index - 1].block == 2;
                    if (isTwoAim && main.aimList[index - 1] != null) {
                        main.actionUp[index - 1].block = 1;
                    }
                }
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
                if (main.actionUp[index] != null) {
                    // this.moveCardToDiscardPile(main, main.actionUp[index]);
                    // main.actionUp[index] = null;
                    // }
                    let isTwoAim = main.actionUp[index].name === Data.ACTION["Two Aim"].name && main.actionUp[index].block == 2;
                    if (isTwoAim && main.aimList[index + 1] != null) {
                        main.actionUp[index].block = 1;
                        main.actionUp[index + 1] = main.actionUp[index];
                        main.actionUp[index] = null;
                    } else {
                        this.moveCardToDiscardPile(main, main.actionUp[index]);
                        main.actionUp[index] = null;
                    }
                } else {
                    // two aim (virtual card)
                    if (main.aimList[index] != null) {
                        let isTwoAim = main.actionUp[index - 1].name === Data.ACTION["Two Aim"].name && main.actionUp[index - 1].block == 2;
                        if (isTwoAim && main.aimList[index - 1] != null) {
                            main.actionUp[index - 1].block = 1;
                        }
                    }
                }
                main.aimList[index] = null;

                // check if the card is two aim

                // this.onDestroyPet(main, index);
                // let copyOfPetDeck = main.petDeck.copyAll();
                let leaveEmpty = this.onDestroyPet(main, index);
                // if (leaveEmpty) {
                //     // geser
                //     main.hideList.splice(index, 1);
                //     main.trapList.splice(index, 1);
                //     main.hideList[5] = null;
                //     main.trapList[5] = null;
                // }

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
        // console.log("explodeGrenade" + index);
        let flag = false;
        if (main.actionDown[index] != null && main.actionDown[index].useSpecial === true) {
            let firstIndex = index - 1;
            if (firstIndex < 0) {
                firstIndex = 0;
            }
            let lastIndex = index + 1;
            if (lastIndex > main.petLine.length) {
                lastIndex = main.petLine.length - 1;
            }
            main.io.to(main.roomID).emit("infoAction", "Mega Grenade telah meledak");
            let counter = 0;
            let maxCounter = lastIndex - firstIndex;
            let i = firstIndex;
            while (counter <= maxCounter) {
                // if (counter >= maxCounter) {
                //     break;
                // }
                let leaveEmpty = this.onDestroyPet(main, i);
                if (leaveEmpty) {
                    // main.hideList.splice(i, 1);
                    // main.trapList.splice(i, 1);
                    // main.hideList[5] = null;
                    // main.trapList[5] = null;
                } else {
                    i++;
                }
                counter++;
            }
            flag = true;
            // for (let i = startIndex; i < endIndex; i++) {
            //     this.onDestroyPet(main, i);
            // }
        } else if (main.actionDown[index] != null) {
            main.io.to(main.roomID).emit("infoAction", "Grenade telah meledak");
            if (index < main.petLine.length) {
                this.onDestroyPet(main, index);
            }
            flag = true;
        }

        if (flag) {
            this.moveCardToDiscardPile(main, main.actionDown[index]);
            main.actionDown[index] = null;
        }

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
        for (let i = 0; i < 6; i++) {
            if (i == 5) {
                main.hideList[5] = null;
                main.trapList[5] = null;
            } else {
                main.hideList[i] = main.hideList[i + 1];
                main.trapList[i] = main.trapList[i + 1];
            }
        }
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
                // this.removeActionCardOnIndex(main, card["name"], index);
                this.addCardToPet(main, card, extraprop);
                card["prop"]["playerId"] = main.nowTurnId;
                // main.hideList[index] = main.nowTurnId;
            }
        }
    }

    static removeHideAndTrapCard(main, id) {
        for (let index = 0; index < main.petLine.length; index++) {
            let tempCard = [];
            for (var i = 0; i < main.petDeck.getAt(index).length; i++) {
                if (main.petDeck.getAt(index)[i].name == "Hide" || (main.petDeck.getAt(index)[i].special != null && main.petDeck.getAt(index)[i].special.name == "Trap")) {
                    console.log("removeHideAndTrapCard" + main.petDeck.getAt(index)[i]);
                    if (main.petDeck.getAt(index)[i]["prop"] != null && main.petDeck.getAt(index)[i]["prop"]["playerId"] == id) {
                        console.log("removeHideAndTrapCard");
                        let card = main.petDeck.getAt(index)[i];
                        this.moveCardToDiscardPile(main, card);
                    } else {
                        tempCard.push(main.petDeck.getAt(index)[i]);
                    }
                } else {
                    tempCard.push(main.petDeck.getAt(index)[i]);
                }
            }
            main.petDeck.setAt(index, tempCard);
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
            console.log("onGoAnyward index:" + index);
            let goIndex = Util.nullSafety(extraprop["goIndex"], -1);
            let condition = true;
            // if (goIndex < 0) { // -2
            //     if ((index + goIndex) < 0) {
            //         goIndex = -1;
            //     }
            //     condition = (index + goIndex) >= 0;
            // } else { // +2
            //     if ((index + goIndex) > main.petDeck.toArray().length) {
            //         goIndex = 1;
            //     }
            //     condition = (index + goIndex) <= main.petDeck.toArray().length;
            // }
            const petDeckLength = main.petDeck.toArray().length;

            // Calculate the new position after applying goIndex
            let newPosition = index + goIndex;

            // Ensure the new position is within the valid range
            if (newPosition < 0) {
                newPosition = 0;
                condition = !(newPosition == index);
            } else if (newPosition > petDeckLength) {
                newPosition = petDeckLength;
                condition = !(newPosition == index);
            } else {
                condition = true;
            }
            this.onPetGo(main, condition, index, newPosition - index);
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
        if (extraprop != null) {
            let index = Util.nullSafety(extraprop["index"], -1);
            let coverIndex = Util.nullSafety(extraprop["masterHideIndex"], -1);
            if (coverIndex != -1) {
                extraprop["coverIndex"] = coverIndex;
                this.onGetCover(main, card, extraprop);
            }
        }
        // this.needConfirmation(main, card, extraprop);
    }

    static onCheckMasterHide(main, card, extraprop) {
        // console.log("TODO onCheckMasterHide");
        // if
        // emit confirmation
        // this.onActionFinish(main);
        this.needConfirmation(main, card, extraprop);
    }

    static onTrap(main, card, extraprop) {
        // console.log("TODO onTrap");
        if (extraprop != null) {
            let index = Util.nullSafety(extraprop["index"], -1);
            if (index != -1) {
                // remove hide if there is hide
                // this.removeActionCardOnIndex(main, card["name"], index);
                this.addCardToPet(main, card, extraprop);
                card["prop"]["playerId"] = main.nowTurnId;
                // main.trapList[index] = main.nowTurnId;
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
                // need to do hide and trap
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

    static activeKamikaze(main, targetIndex, emptyBlock) {
        let firstIndex = 0;
        let lastIndex = 5;

        if (targetIndex == 0) {
            // jika kamikaze berada di paling ujung kiri (targetIndex == 0)
            firstIndex = 0;
            lastIndex = emptyBlock ? firstIndex : 1;
        } else if (targetIndex == 5 || targetIndex == (main.petDeck.toArray().length - 1)) {
            // jika kamikaze berada di paling ujung kanan (targetIndex == 5)
            firstIndex = targetIndex - 1;
            lastIndex = emptyBlock ? firstIndex : targetIndex;
        } else {
            // jika kamikaze tidak berada di ujung (targetIndex > 0 && targetIndex < 5)
            firstIndex = targetIndex - 1;
            lastIndex = emptyBlock ? targetIndex : targetIndex + 1;
        }
        let counter = 0;
        let maxCounter = lastIndex - firstIndex;
        let i = firstIndex;
        while (counter <= maxCounter) {
            // if (counter >= maxCounter) {
            //     break;
            // }
            let leaveEmpty = this.onDestroyPet(main, i);
            if (leaveEmpty) {
                // main.hideList.splice(i, 1);
                // main.trapList.splice(i, 1);
                // main.hideList[5] = null;
                // main.trapList[5] = null;
            } else {
                i++;
            }
            counter++;
        }
        // for (let i = firstIndex; i <= lastIndex; i++) {
        //     let leaveEmpty = this.onDestroyPet(main, i);
        //     if (leaveEmpty) {

        //     }
        // }
    }

    static onEscape(main, card, extraprop) {
        // DONE
        // console.log("onEscape");
        if (extraprop != null) {
            let index = Util.nullSafety(extraprop["index"], -1);
            if (index != -1 && main.petDeck.toArray().length > 6) {
                const firstPetDeckIndex = 6;
                // let copyOfPetDeck = [...main.petDeck.toArray()];
                // get pet card
                var petCard = main.petDeck.getAt(index);
                // let tempCard = [];
                for (let i = 0; i < petCard.length; i++) {
                    if (main.petDeck.getAt(index)[i].hasOwnProperty("ability")) {
                        // if there is armor/shield/hide remove (action card) move to discardPile
                        let card = main.petDeck.getAt(index)[i];
                        this.moveCardToDiscardPile(main, card);
                    } else {
                        // if there is other pet add to petDeck too
                        // console.log(main.petDeck.getAt(index)[i].id);
                        main.petDeck.addElement([main.petDeck.getAt(index)[i]]);
                        // tempCard.push(main.petDeck.getAt(index)[i]);
                    }
                }
                // main.petDeck.setAt(index, tempCard);
                // add to petDeck
                // main.petDeck.addElement(petCard);

                // shuffle petDeck (exclude the pet line)
                // NEED TO CHECK
                main.petDeck.shuffleOn(firstPetDeckIndex, main.petDeck.toArray().length);

                // get first petDeck and put in the petCard oldIndex
                let newPet = main.petDeck.getAt(firstPetDeckIndex);
                // console.log(newPet[0].id)
                main.petDeck.setAt(index, newPet);
                main.petDeck.removeAt(firstPetDeckIndex);

                // remove hide and trap
                // main.hideList[index] = null;
                // main.trapList[index] = null;

                // set the pet deck from copyOfPetDeck
            }

        }
    }
}

module.exports = AbilityUtil;
