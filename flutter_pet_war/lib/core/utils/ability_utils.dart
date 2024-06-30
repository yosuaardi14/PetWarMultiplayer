import 'package:flutter_pet_war/core/utils/base_ability_utils.dart';
import 'package:flutter_pet_war/core/utils/card_utils.dart';
import 'package:flutter_pet_war/core/utils/game_utils.dart';
import 'package:flutter_pet_war/core/utils/global_functions.dart';
import 'package:flutter_pet_war/core/values/constant.dart';
import 'package:flutter_pet_war/modules/base/controllers/base_game_firebase_controller.dart';
import 'package:flutter_pet_war/modules/game/local_widgets/dialog/master_hide_dialog.dart';
import 'package:get/get.dart';

class AbilityUtils {
  static const errorPrefix = "AbilityUtils:";
  static onAbilityAction(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    bool isNotFound = false;
    var cardAbility = card["useSpecial"] == true ? card["special"]["ability"] : card["ability"];
    switch (cardAbility) {
      case "BumpLeft":
        await onBumpLeft(controller, card, extraprop: extraprop);
        break;
      case "BumpRight":
        await onBumpRight(controller, card, extraprop: extraprop);
        break;
      case "TwoAims":
        await onTwoAims(controller, card, extraprop: extraprop);
        break;
      case "Aim":
        await onAim(controller, card, extraprop: extraprop);
        break;
      case "TwoBooms":
        await onTwoBooms(controller, card, extraprop: extraprop);
        break;
      case "Boom":
        await onBoom(controller, card, extraprop: extraprop);
        break;
      case "Doom":
        await onDoom(controller, card, extraprop: extraprop);
        break;
      case "Miss":
        await onMiss(controller, card, extraprop: extraprop);
        break;
      case "GoForward":
        await onGoForward(controller, card, extraprop: extraprop);
        break;
      case "GoBackward":
        await onGoBackward(controller, card, extraprop: extraprop);
        break;
      case "MoveThePet":
        await onMoveThePet(controller, card, extraprop: extraprop);
        break;
      case "Typhoon":
        await onTyphoon(controller, card, extraprop: extraprop);
        break;
      case "GetCover":
        await onGetCover(controller, card, extraprop: extraprop);
        break;
      case "Armor":
        await onArmor(controller, card, extraprop: extraprop);
        break;
      case "Kamikaze":
        await onKamikaze(controller, card, extraprop: extraprop);
        break;
      case "GoAnyward":
        await onGoAnyward(controller, card, extraprop: extraprop);
        break;
      case "OverShock":
        await onOverShock(controller, card, extraprop: extraprop);
        break;
      case "Shield":
        await onShield(controller, card, extraprop: extraprop);
        break;
      case "Hide":
        await onHide(controller, card, extraprop: extraprop);
        break;
      case "MasterHide":
        await onMasterHide(controller, card, extraprop: extraprop);
        break;
      case "Trap":
        await onTrap(controller, card, extraprop: extraprop);
        break;
      case "MovingAim":
        await onMovingAim(controller, card, extraprop: extraprop);
        break;
      case "Grenade":
        await onGrenade(controller, card, extraprop: extraprop);
        break;
      case "MegaGrenade":
        await onMegaGrenade(controller, card, extraprop: extraprop);
        break;
      case "DoubleResurrect":
        await onDoubleResurrect(controller, card, extraprop: extraprop);
        break;
      case "Resurrect":
        await onResurrect(controller, card, extraprop: extraprop);
        break;
      case "LunchTime": // DONE
        await onLunchTime(controller, card, extraprop: extraprop);
        break;
      case "Escape":
        await onEscape(controller, card, extraprop: extraprop);
        break;
      case "DoubleRun":
        await onDoubleRun(controller, card, extraprop: extraprop);
        break;
      case "Running": // DONE
        await onRunning(controller, card, extraprop: extraprop);
        break;
      default:
        // TODO Development only
        controller.playerfinishAction(card, extraprop);
        isNotFound = true;
    }
    if (!isNotFound) {
      // controller.playerfinishAction();
    }
  }

  // Up
  static onAim(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      if (extraprop != null) {
        int index = extraprop["index"] ?? -1;
        if (index != -1) {
          controller.aimList[index] = true;
          controller.actionUp[index] = card;
        } else {
          controller.discardPilePerTurn.add(CardUtils.resetCard(card));
        }
      }
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  static onTwoAims(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      if (extraprop != null) {
        int index = extraprop["index"] ?? -1;
        if (index != -1) {
          if (card["block"] == 1) {
            onAim(controller, card, extraprop: extraprop);
          } else {
            controller.aimList[index] = true;
            if ((index + 1 < 6) && (controller.aimList[index + 1] == null)) {
              controller.aimList[index + 1] = true;
              card["block"] = 2; // add card block in UI to rotate;
            } else {
              card["block"] = 1;
            }
            controller.actionUp[index] = card;
          }
        } else {
          controller.discardPilePerTurn.add(CardUtils.resetCard(card));
        }
      }
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  static onBoom(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      if (extraprop != null) {
        int index = extraprop["index"] ?? -1;
        int line = extraprop["line"] ?? -1;

        if (index != -1) {
          if (line == 0) {
            if (controller.actionUp[index] != null) {
              // check if the card is two aim
              bool isTwoAim = controller.actionUp[index]?["name"] == Constant.ACTION["TwoAims"]?["name"] &&
                  controller.actionUp[index]?["block"] == 2;
              if (isTwoAim && controller.aimList[index + 1] != null) {
                controller.actionUp[index]?["block"] = 1;
                controller.actionUp[index + 1] = controller.actionUp[index];
                controller.actionUp[index] = null;
              } else {
                controller.discardPilePerTurn.add(controller.actionUp[index]!);
                controller.actionUp()[index] = null;
              }
            } else {
              // two aim (virtual card)
              bool isTwoAim = controller.actionUp[index - 1]?["name"] == Constant.ACTION["TwoAims"]?["name"] &&
                  controller.actionUp[index - 1]?["block"] == 2;
              if (isTwoAim && controller.aimList[index - 1] != null) {
                controller.actionUp[index - 1]?["block"] = 1;
              }
            }
            controller.aimList[index] = null;
            BaseAbilityUtils.onDestroyPet(controller, index);
          } else if (line == 1) {
            BaseAbilityUtils.onDestroyPet(controller, index);
          }
        }
      }
      controller.discardPilePerTurn.add(CardUtils.resetCard(card));
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  static onTwoBooms(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      if (extraprop != null) {
        int index = extraprop["index"] ?? -1;
        int line = extraprop["line"] ?? -1;
        if (index != -1) {
          if (card["block"] == 1) {
            onBoom(controller, card, extraprop: extraprop);
          } else {
            if (line == 0) {
              // remove AIM
              // todo refactor using for
              if (controller.actionUp[index] != null) {
                controller.discardPilePerTurn.add(controller.actionUp[index]!);
                controller.actionUp()[index] = null;
              } else {
                // two aim (virtual card)
                bool isTwoAim = controller.actionUp[index - 1]?["name"] == Constant.ACTION["TwoAims"]?["name"] &&
                    controller.actionUp[index - 1]?["block"] == 2;
                if (isTwoAim && controller.aimList[index - 1] != null) {
                  controller.actionUp[index - 1]?["block"] = 1;
                }
              }
              controller.aimList[index] = null;
              bool leaveEmpty = BaseAbilityUtils.onDestroyPet(controller, index);

              if (index + 1 < 6 && controller.actionUp[index + 1] != null) {
                bool isTwoAim = controller.actionUp[index + 1]?["name"] == Constant.ACTION["TwoAims"]?["name"] &&
                    controller.actionUp[index + 1]?["block"] == 2;
                if (isTwoAim && controller.aimList[index + 1 + 1] != null) {
                  controller.actionUp[index + 1]?["block"] = 1;
                  controller.actionUp()[index + 1 + 1] = controller.actionUp[index + 1];
                  controller.actionUp()[index + 1] = null;
                } else {
                  controller.discardPilePerTurn.add(controller.actionUp[index + 1]!);
                  controller.actionUp()[index + 1] = null;
                }
              }
              if (index + 1 < 6 && controller.aimList[index + 1] == true) {
                controller.aimList[index + 1] = null;
                BaseAbilityUtils.onDestroyPet(controller, leaveEmpty ? index : index + 1);
              }
            } else if (line == 1) {
              BaseAbilityUtils.onDestroyPet(controller, index);
            }
          }
        }
      }
      controller.discardPilePerTurn.add(CardUtils.resetCard(card));
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  static onMiss(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      if (extraprop != null) {
        int index = extraprop["index"] ?? -1;
        if (index != -1) {
          if (controller.actionUp[index] != null) {
            // check if the card is two aim
            bool isTwoAim = controller.actionUp[index]?["name"] == Constant.ACTION["TwoAims"]?["name"] &&
                controller.actionUp[index]?["block"] == 2;
            if (isTwoAim && controller.aimList[index + 1] != null) {
              controller.actionUp[index]?["block"] = 1;
              controller.actionUp[index + 1] = controller.actionUp[index];
              controller.actionUp[index] = null;
            } else {
              controller.discardPilePerTurn.add(controller.actionUp[index]!);
              controller.actionUp()[index] = null;
            }
          } else {
            // two aim (virtual card)
            bool isTwoAim = controller.actionUp[index - 1]?["name"] == Constant.ACTION["TwoAims"]?["name"] &&
                controller.actionUp[index - 1]?["block"] == 2;
            if (isTwoAim && controller.aimList[index - 1] != null) {
              controller.actionUp[index - 1]?["block"] = 1;
            }
          }
        }
        controller.aimList[index] = null;
        var missIndex = 0;
        if (index == 0 || index == 5) {
          missIndex = index == 0 ? index + 1 : index - 1;
        } else {
          missIndex = (await GF.showLeftRightDialog()) + index;
        }
        BaseAbilityUtils.onDestroyPet(controller, missIndex);
      }
      controller.discardPilePerTurn.add(CardUtils.resetCard(card));
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  static onBumpLeft(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      controller.discardPilePerTurn.add(CardUtils.resetCard(card));
      if (extraprop != null) {
        int index = extraprop["index"] ?? 0;
        BaseAbilityUtils.onAimMove(controller, index > 0, index, -1);
      }
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  static onBumpRight(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      controller.discardPilePerTurn.add(CardUtils.resetCard(card));
      if (extraprop != null) {
        int index = extraprop["index"] ?? 5;
        BaseAbilityUtils.onAimMove(controller, index < 5, index, 1);
      }
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  // Down
  static onGrenade(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      if (extraprop != null) {
        int index = extraprop["index"] ?? -1;
        if (index != -1) {
          controller.actionDown[index] = card;
          controller.grenadeList[index] = 0;
        } else {
          controller.discardPile.add(card);
        }
      }
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  // Front
  static onArmor(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      BaseAbilityUtils.addCardToPetFront(controller, card, extraprop);
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  static onHide(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      card["prop"] = {
        "playerId": controller.playerData["id"],
      };
      BaseAbilityUtils.addCardToPetFront(controller, card, extraprop);
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  static onGoForward(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      if (extraprop != null) {
        int index = extraprop["index"] ?? 0;
        BaseAbilityUtils.onPetGo(controller, index > 0, index, -1);
      }
      controller.discardPilePerTurn.add(CardUtils.resetCard(card));
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  static onGoBackward(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      if (extraprop != null) {
        int index = extraprop["index"] ?? 5;
        int maxIndex = 5;
        if (maxIndex > (controller.petDeckNew.length - 1)) {
          maxIndex = controller.petDeckNew.length - 1;
        }
        BaseAbilityUtils.onPetGo(controller, index < maxIndex, index, 1);
      }
      controller.discardPilePerTurn.add(CardUtils.resetCard(card));
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  static onGetCover(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    // check if there is no player pet, do nothing TODO
    try {
      controller.discardPilePerTurn.add(CardUtils.resetCard(card));
      if (extraprop != null) {
        int index = extraprop["index"] ?? -1;
        bool hasTrap = (controller.petDeckNew[index].indexWhere(
              (card) => card["useSpecial"] == true && card["special"]?["name"] == Constant.TRAP,
            )) !=
            -1;
        if (index != -1 && !hasTrap) {
          final coverIndex = await Get.dialog(
            MasterHideDialog(
              cardList: controller.petLine(),
              index: index,
              onGetCover: true,
            ),
          );
          BaseAbilityUtils.onCover(controller, index, coverIndex);
        }
      }
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  //
  static onDoom(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      controller.discardPilePerTurn.add(CardUtils.resetCard(card));
      if (extraprop != null) {
        int index = extraprop["index"] ?? -1;
        if (index != -1) {
          if (controller.actionUp[index] != null) {
            // check if the card is two aim
            bool isTwoAim = controller.actionUp[index]?["name"] == Constant.ACTION["TwoAims"]?["name"] &&
                controller.actionUp[index]?["block"] == 2;
            if (isTwoAim && controller.aimList[index + 1] != null) {
              controller.actionUp[index]?["block"] = 1;
              controller.actionUp()[index + 1] = controller.actionUp[index];
              controller.actionUp()[index] = null;
            } else {
              controller.discardPilePerTurn.add(controller.actionUp[index]!);
              controller.actionUp()[index] = null;
            }
          } else {
            // two aim (virtual card)
            if (controller.aimList[index] != null) {
              bool isTwoAim = controller.actionUp[index - 1]?["name"] == Constant.ACTION["TwoAims"]?["name"] &&
                  controller.actionUp[index - 1]?["block"] == 2;
              if (isTwoAim && controller.aimList[index - 1] != null) {
                controller.actionUp[index - 1]?["block"] = 1;
              }
            }
          }
          controller.aimList[index] = null;
          BaseAbilityUtils.onDestroyPet(controller, index);
        }
      }
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  static onResurrect(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      controller.discardPilePerTurn.add(CardUtils.resetCard(card));
      if (GameUtils.onCheckResurrect(controller.playerObj())) {
        Map<String, dynamic> pet = controller.playerObj().defeatedPet.removeAt(0);
        controller.petDeckNew().add([pet]);
        controller.playerObj().life.value++;
      }
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  static onRunning(BaseGameFirebaseController controller, Map<String, dynamic> card,
      {Map<String, dynamic>? extraprop, bool discardCard = true}) async {
    try {
      controller.discardPilePerTurn.add(CardUtils.resetCard(card));
      List<Map<String, dynamic>> tempCard = [];
      var tempPetDeck = controller.petDeckNew();
      int runningIndex = 0;
      // TODO when there is trap
      bool hasTrap = (controller.petDeckNew[0].indexWhere(
            (card) => card["useSpecial"] == true && card["special"]?["name"] == Constant.TRAP,
          )) !=
          -1;
      if (hasTrap) {
        runningIndex = 1;
      }

      for (var i = 0; i < tempPetDeck[runningIndex].length; i++) {
        if (tempPetDeck[runningIndex][i].containsKey("ability")) {
          controller.discardPilePerTurn().add(tempPetDeck[runningIndex][i]);
        } else {
          if (i == (tempPetDeck[runningIndex].length - 1)) {
            tempCard.add(controller.petDeckNew()[runningIndex][i]);
          } else {
            controller.petDeckNew().add([tempPetDeck[runningIndex][i]]);
          }
        }
      }
      controller.petDeckNew()[runningIndex] = tempCard;
      var front = controller.petDeckNew().removeAt(0);
      controller.petDeckNew().add(front);
      int startIndex = runningIndex != 0 ? 1 : 0;
      for (var i = startIndex; i < controller.petLine.length - 1; i++) {
        int cardIndexTrap = (controller.petDeckNew[i].indexWhere(
          (card) => card["useSpecial"] == true && card["special"]?["name"] == Constant.TRAP,
        ));
        if (cardIndexTrap != -1) {
          int trapIndex = controller.petDeckNew[i][cardIndexTrap]["prop"]?["trapIndex"] ?? -1;
          if (trapIndex != -1 && trapIndex < controller.petLine.length) {
            var tempPet = controller.petDeckNew[i];
            controller.petDeckNew[i] = controller.petDeckNew[trapIndex];
            controller.petDeckNew[trapIndex] = tempPet;
          }
        }
      }
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  static onTyphoon(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      controller.discardPilePerTurn.add(CardUtils.resetCard(card));
      for (var i = 0; i < controller.petLine.length; i++) {
        List<Map<String, dynamic>> tempCard = [];
        for (var j = 0; j < controller.petDeckNew[i].length; j++) {
          if (controller.petDeckNew()[i][j].containsKey("ability")) {
            controller.discardPilePerTurn.add(controller.petDeckNew[i][j]);
          } else {
            if (tempCard.isNotEmpty) {
              controller.petDeckNew().add([controller.petDeckNew[i][j]]);
            } else {
              tempCard.add(controller.petDeckNew[i][j]);
            }
          }
        }
        controller.petDeckNew()[i] = tempCard;
      }
      controller.petDeckNew().shuffle();
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  static onMoveThePet(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      controller.discardPilePerTurn.add(CardUtils.resetCard(card));
      controller.isMoveThePet(true);
      controller.startTimer(10);
      await Future.delayed(const Duration(seconds: 10), () {
        controller.isMoveThePet(false);
      });
      controller.petDeckNew().replaceRange(0, controller.petLine().length, controller.petLine());
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  static onLunchTime(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      controller.discardPilePerTurn.add(CardUtils.resetCard(card));
      for (var i = 0; i < controller.actionUp.length; i++) {
        if (controller.actionUp[i] != null) {
          controller.discardPilePerTurn.add(controller.actionUp[i]!);
        }
      }
      GF.setListElementNull(controller.actionUp(), 6);
      GF.setListElementNull(controller.aimList(), 6);
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  // Special
  static onMasterHide(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      controller.discardPilePerTurn.add(CardUtils.resetCard(card));
      if (extraprop != null) {
        int index = extraprop["index"] ?? -1;
        bool hasTrap = (controller.petDeckNew[index].indexWhere(
              (card) => card["useSpecial"] == true && card["special"]?["name"] == Constant.TRAP,
            )) !=
            -1;
        if (index != -1 && !hasTrap) {
          final coverIndex = await Get.dialog(
            MasterHideDialog(cardList: controller.petLine(), index: index),
          );
          BaseAbilityUtils.onCover(controller, index, coverIndex);
        }
      }
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  static onShield(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      BaseAbilityUtils.addCardToPetFront(controller, card, extraprop);
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  static onMovingAim(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      controller.discardPilePerTurn.add(CardUtils.resetCard(card));
      controller.isMovingAim(true);
      controller.startTimer(5);
      await Future.delayed(const Duration(seconds: 5), () {
        controller.isMovingAim(false);
      });
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  static onTrap(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      card["prop"] = {"playerId": controller.playerData["id"], "trapIndex": extraprop?["index"] ?? -1};
      BaseAbilityUtils.addCardToPetFront(controller, card, extraprop);
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  static onDoubleResurrect(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      controller.discardPilePerTurn.add(CardUtils.resetCard(card));
      for (var i = 0; i < 2; i++) {
        if (GameUtils.onCheckResurrect(controller.playerObj())) {
          Map<String, dynamic> pet = controller.playerObj().defeatedPet.removeAt(0);
          controller.petDeckNew().add([pet]);
          controller.playerObj().life.value++;
        }
      }
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  static onGoAnyward(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      if (extraprop != null) {
        var index = extraprop["index"] ?? 5;
        var res = 0;
        if (index == 0 || index == controller.petLine.length - 1) {
          if (index == 0) {
            res = 1;
          } else {
            // controller.petLine.length
            res = -1;
          }
        } else {
          res = await GF.showLeftRightDialog();
        }
        int goIndex = res < 0 ? -2 : 2; // extraprop["goIndex"] ?? -1;
        bool condition = true;
        int petDeckLength = controller.petDeckNew.length;

        // Calculate the new position after applying goIndex
        var newPosition = index + goIndex;

        // Ensure the new position is within the valid range
        if (newPosition < 0) {
          newPosition = 0;
          condition = !(newPosition == index);
        } else if (newPosition > petDeckLength) {
          newPosition = petDeckLength;
          condition = !(newPosition == index);
        } else {
          if (newPosition > 5) {
            newPosition = 5;
          }
          condition = true;
        }
        BaseAbilityUtils.onPetGo(controller, condition, index, newPosition - index);
      }
      controller.discardPilePerTurn.add(CardUtils.resetCard(card));
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  static onOverShock(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    onDoom(controller, card, extraprop: extraprop);
  }

  static onDoubleRun(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      controller.discardPilePerTurn.add(CardUtils.resetCard(card));
      for (var i = 0; i < 2; i++) {
        int runningIndex = 0;
        // TODO when there is trap
        bool hasTrap = (controller.petDeckNew[0].indexWhere(
              (card) => card["useSpecial"] == true && card["special"]?["name"] == Constant.TRAP,
            )) !=
            -1;
        if (hasTrap) {
          runningIndex = 1;
        }
        List<Map<String, dynamic>> tempCard = [];
        var tempPetDeck = controller.petDeckNew();
        for (var i = 0; i < tempPetDeck[runningIndex].length; i++) {
          if (tempPetDeck[runningIndex][i].containsKey("ability")) {
            controller.discardPilePerTurn().add(tempPetDeck[runningIndex][i]);
          } else {
            if (i == (tempPetDeck[runningIndex].length - 1)) {
              tempCard.add(controller.petDeckNew()[runningIndex][i]);
            } else {
              controller.petDeckNew().add([tempPetDeck[runningIndex][i]]);
            }
          }
        }
        controller.petDeckNew()[runningIndex] = tempCard;
        var front = controller.petDeckNew().removeAt(0);
        controller.petDeckNew().add(front);

        int startIndex = runningIndex != 0 ? 1 : 0;
        for (var i = startIndex; i < controller.petLine.length - 1; i++) {
          int cardIndexTrap = (controller.petDeckNew[i].indexWhere(
            (card) => card["useSpecial"] == true && card["special"]?["name"] == Constant.TRAP,
          ));
          if (cardIndexTrap != -1) {
            int trapIndex = controller.petDeckNew[i][cardIndexTrap]["prop"]?["trapIndex"] ?? -1;
            if (trapIndex != -1 && trapIndex < controller.petLine.length) {
              var tempPet = controller.petDeckNew[i];
              controller.petDeckNew[i] = controller.petDeckNew[trapIndex];
              controller.petDeckNew[trapIndex] = tempPet;
            }
          }
        }
      }
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  static onEscape(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      controller.discardPilePerTurn.add(CardUtils.resetCard(card));
      if (extraprop != null) {
        int index = extraprop["index"] ?? -1;
        bool canEscape = (controller.petDeckNew[index].indexWhere(
              (card) => card["useSpecial"] == true && card["special"]?["name"] == Constant.TRAP,
            )) ==
            -1;
        if (index != -1 && controller.petDeckNew().length > 6 && canEscape) {
          const firstPetDeckIndex = 6;
          var petCard = controller.petDeckNew()[index];
          for (var i = 0; i < petCard.length; i++) {
            if (petCard[i].containsKey("ability")) {
              // if there is armor/shield/hide remove (action card) move to discardPile
              var actionCard = petCard[i];
              controller.discardPilePerTurn.add(CardUtils.resetCard(actionCard));
            } else {
              // if there is other pet add to petDeck too
              controller.petDeckNew().add([petCard[i]]);
            }
          }

          controller.petDeckNew.value = GF.shuffleRange(
            controller.petDeckNew(),
            firstPetDeckIndex,
            controller.petDeckNew().length,
          );

          // get first petDeck and put in the petCard oldIndex
          var newPet = controller.petDeckNew()[firstPetDeckIndex];
          // console.log(newPet[0].id)
          controller.petDeckNew()[index] = newPet;
          controller.petDeckNew().removeAt(firstPetDeckIndex);
        }
      }
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  static onMegaGrenade(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      if (extraprop != null) {
        int index = extraprop["index"] ?? -1;
        if (index != -1) {
          controller.actionDown[index] = card;
          controller.grenadeList[index] = 0;
          if (index + 1 <= 5) {
            controller.grenadeList[index + 1] = 0;
          }
          if (index - 1 >= 0) {
            controller.grenadeList[index - 1] = 0;
          }
        } else {
          controller.discardPile.add(card);
        }
      }
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  static onKamikaze(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      BaseAbilityUtils.addCardToPetFront(controller, card, extraprop);
    } catch (e) {
      e.printError(info: errorPrefix);
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }
}
