import 'package:flutter_pet_war/core/utils/game_utils.dart';
import 'package:flutter_pet_war/core/utils/global_functions.dart';
import 'package:flutter_pet_war/core/values/constant.dart';
import 'package:flutter_pet_war/core/values/game_state.dart';
import 'package:flutter_pet_war/modules/base/controllers/base_game_firebase_controller.dart';
import 'package:get/get.dart';

class AbilityUtils {
  static onAbilityAction(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    bool isNotFound = false;
    var cardAbility = card["useSpecial"] == true ? card["special"]["ability"] : card["ability"];
    switch (cardAbility) {
//       case "BumpLeft":
//         await onBumpLeft(controller, card, extraprop: extraprop);
//         break;
//       case "BumpRight":
//         await onBumpRight(controller, card, extraprop: extraprop);
//         break;
//       case "TwoAims":
//         await onTwoAim(controller, card, extraprop: extraprop);
//         break;
      case "Aim":
        await onAim(controller, card, extraprop: extraprop);
        break;
//       case "TwoBooms":
//         await onTwoBoom(controller, card, extraprop: extraprop);
//         break;
//       case "Boom":
//         await onBoom(controller, card, extraprop: extraprop);
//         break;
//       case "Doom":
//         await onDoom(controller, card, extraprop: extraprop);
//         break;
//       case "Miss":
//         await onMiss(controller, card, extraprop: extraprop);
//         break;
//       case "GoForward":
//         await onGoForward(controller, card, extraprop: extraprop);
//         break;
//       case "GoBackward":
//         await onGoBackward(controller, card, extraprop: extraprop);
//         break;
      case "MoveThePet":
        await onMoveThePet(controller, card, extraprop: extraprop);
        break;
//       case "Typhoon":
//         await onTyphoon(controller, card, extraprop: extraprop);
//         controller.discardPile.add(card);
//         break;
//       case "GetCover":
//         await onGetCover(controller, card, extraprop: extraprop);
//         break;
      case "Armor":
        await onArmor(controller, card, extraprop: extraprop);
        break;
//       case "Kamikaze":
//         await onKamikaze(controller, card, extraprop: extraprop);
//         break;
//       case "GoAnyward":
//         await onGoAnyward(controller, card, extraprop: extraprop);
//         break;
//       case "OverShock":
//         await onOverShock(controller, card, extraprop: extraprop);
//         break;
//       case "Shield":
//         await onShield(controller, card, extraprop: extraprop);
//         break;
      case "Hide":
        await onHide(controller, card, extraprop: extraprop);
        break;
//       case "MasterHide":
//         await onMasterHide(controller, card, extraprop: extraprop);
//         break;
//       case "Trap":
//         await onTrap(controller, card, extraprop: extraprop);
//         break;
//       case "MovingAim":
//         await onMovingAim(controller, card, extraprop: extraprop);
//         break;
//       case "Grenade":
//         await onGrenade(controller, card, extraprop: extraprop);
//         break;
//       case "MegaGrenade":
//         await onMegaGrenade(controller, card, extraprop: extraprop);
//         break;
//       case "DoubleResurrect":
//         await onDoubleResurrect(controller, card, extraprop: extraprop);
//         controller.discardPile.add(card);
//         break;
//       case "Resurrect":
//         await onResurrect(controller, card, extraprop: extraprop);
//         controller.discardPile.add(card);
//         break;
      case "LunchTime": // DONE
        await onLunchTime(controller, card, extraprop: extraprop);
        break;
//       case "Escape":
//         await onEscape(controller, card, extraprop: extraprop);
//         break;
//       case "DoubleRun":
//         await onDoubleRun(controller, card, extraprop: extraprop);
//         controller.discardPile.add(card);
//         break;
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
          controller.discardPilePerTurn.add(card);
        }
      }
    } catch (e) {
      e.printError();
    } finally {
      controller.playerfinishAction(card, extraprop);
    }

    // controller.onUpdateLineAndDeck();
  }

  static onTwoAim(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    if (extraprop != null) {
      int index = extraprop["index"] ?? -1;
      if (index != -1) {
        controller.aimList[index] = true;
        if (index + 1 < 6) {
          controller.aimList[index + 1] = true;
        }
        controller.actionUp[index] = card;
      } else {
        controller.discardPile.add(card);
      }
    }
    // controller.onUpdateLineAndDeck();
  }

  static onBoom(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    // if (extraprop != null) {
    //   int index = extraprop["index"] ?? -1;

    //   if (index != -1) {
    //     if (extraprop["line"] == 0) {
    //       controller.discardPile.add(controller.actionUp[index]!);
    //       controller.aimList[index] = null;
    //       controller.actionUp[index] = null;
    //       if (index < controller.petDeck().data.length) {
    //         if (controller.petDeck().getAt(index).first["name"] != Constant.PET["Forest"]?["name"]) {
    //           if (controller.petDeck().getAt(index).length > 1) {
    //             var card = controller.petDeck().getAt(index).first;
    //             if (card["name"] == "Shield") {
    //               // check shield life (armor 2x)
    //               controller.discardPile.add(card);
    //               controller.petDeck().getAt(index).removeAt(0);
    //             } else if (card["name"] == "Armor") {
    //               controller.discardPile.add(card);
    //               controller.petDeck().getAt(index).removeAt(0);
    //             } else if (card["name"] == "Hide") {
    //               // do nothing
    //             } else {
    //               // jika pet
    //               var indexPlayerPet = GameUtils.getPlayerIndexByPet(
    //                   controller.petDeck().getAt(index).first["name"], controller.playerArr());
    //               if (indexPlayerPet != -1) {
    //                 controller.playerArr()[indexPlayerPet].life.value--;
    //               }
    //               controller.petDeck().getAt(index).removeAt(0);
    //             }
    //           } else {
    //             var indexPlayerPet = GameUtils.getPlayerIndexByPet(
    //                 controller.petDeck().getAt(index).first["name"], controller.playerArr());
    //             if (indexPlayerPet != -1) {
    //               controller.playerArr()[indexPlayerPet].life.value--;
    //             }
    //             controller.petDeck().removeAt(index);
    //           }
    //         }
    //       }
    //     } else {
    //       // Kamikaze
    //       if (GameUtils.checkAvailableCardOnPetLine("Kamikaze", controller.petLine(), index)) {
    //         var start = index == 0 ? 0 : index - 1;
    //         var end = index == 5 ? index : index + 1;
    //         for (var i = start; i < end; i++) {
    //           // TODO discard pile the lpg zord and kamikaze
    //           if (i < controller.petDeck().data.length) {
    //             if (controller.petDeck().getAt(i).first["name"] != Constant.PET["Forest"]?["name"]) {
    //               if (controller.petDeck().getAt(i).length > 1) {
    //                 var card = controller.petDeck().getAt(i).first;
    //                 if (card["name"] == "Shield") {
    //                   // check shield life (armor 2x)
    //                   controller.discardPile.add(card);
    //                   controller.petDeck().getAt(i).removeAt(0);
    //                 } else if (card["name"] == "Armor") {
    //                   controller.discardPile.add(card);
    //                   controller.petDeck().getAt(i).removeAt(0);
    //                 } else if (card["name"] == "Hide") {
    //                   // do nothing
    //                 } else {
    //                   // jika pet
    //                   var indexPlayerPet = GameUtils.getPlayerIndexByPet(
    //                       controller.petDeck().getAt(i).first["name"], controller.playerArr());
    //                   if (indexPlayerPet != -1) {
    //                     controller.playerArr()[indexPlayerPet].life.value--;
    //                   }
    //                   controller.petDeck().getAt(i).removeAt(0);
    //                 }
    //               } else {
    //                 var indexPlayerPet = GameUtils.getPlayerIndexByPet(
    //                     controller.petDeck().getAt(i).first["name"], controller.playerArr());
    //                 if (indexPlayerPet != -1) {
    //                   controller.playerArr()[indexPlayerPet].life.value--;
    //                 }
    //                 controller.petDeck().removeAt(i);
    //               }
    //             }
    //           }
    //         }
    //       }
    //     }
    //   }
    // }
    controller.discardPile.add(card);
    // controller.onUpdateLineAndDeck();
  }

  static onTwoBoom(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    if (extraprop != null) {
      int index = extraprop["index"] ?? -1;
      if (index != -1) {
        controller.discardPile.add(controller.actionUp[index]!);
        controller.aimList[index] = null;
        controller.actionUp[index] = null;
      }
    }
    controller.discardPile.add(card);
    // controller.onUpdateLineAndDeck();
  }

  static onMiss(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    // if (extraprop != null) {
    //   int index = extraprop["index"] ?? -1;
    //   if (index != -1) {
    //     controller.discardPile.add(controller.actionUp[index]!);
    //     controller.aimList[index] = null;
    //     controller.actionUp[index] = null;
    //     var missIndex = 0;
    //     if (index == 0 || index == 5) {
    //       //
    //       missIndex = index == 0 ? index + 1 : index - 1;
    //     } else {
    //       // Show DIalog left or right
    //       missIndex = index + await GF.showLeftRightDialog();
    //     }

    //     if (missIndex < controller.petDeck().data.length) {
    //       if (controller.petDeck().getAt(missIndex).first["name"] != Constant.PET["Forest"]?["name"]) {
    //         if (controller.petDeck().getAt(missIndex).length > 1) {
    //           var card = controller.petDeck().getAt(missIndex).first;
    //           if (card["name"] == "Shield") {
    //             // check shield life (armor 2x)
    //             controller.discardPile.add(card);
    //             controller.petDeck().getAt(missIndex).removeAt(0);
    //           } else if (card["name"] == "Armor") {
    //             controller.discardPile.add(card);
    //             controller.petDeck().getAt(missIndex).removeAt(0);
    //           } else if (card["name"] == "Hide") {
    //             // do nothing
    //           } else {
    //             // jika pet
    //             var indexPlayerPet = GameUtils.getPlayerIndexByPet(
    //                 controller.petDeck().getAt(missIndex).first["name"], controller.playerArr());
    //             if (indexPlayerPet != -1) {
    //               controller.playerArr()[indexPlayerPet].life.value--;
    //             }
    //             controller.petDeck().getAt(missIndex).removeAt(0);
    //           }
    //         } else {
    //           var indexPlayerPet = GameUtils.getPlayerIndexByPet(
    //               controller.petDeck().getAt(missIndex).first["name"], controller.playerArr());
    //           if (indexPlayerPet != -1) {
    //             controller.playerArr()[indexPlayerPet].life.value--;
    //           }
    //           controller.petDeck().removeAt(missIndex);
    //         }
    //       }
    //     }
    //   }
    // }
    controller.discardPile.add(card);
    // controller.onUpdateLineAndDeck();
  }

  static onBumpLeft(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    if (extraprop != null) {
      int index = extraprop["index"] ?? 0;
      if (index > 0) {
        if (controller.actionUp[index - 1] == null) {
          var action = controller.actionUp[index];
          controller.aimList[index] = null;
          controller.aimList[index - 1] = true;
          controller.actionUp[index] = null;
          controller.actionUp[index - 1] = action;
        }
      }
    }
    controller.discardPile.add(card);
    // controller.onUpdateLineAndDeck();
  }

  static onBumpRight(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    if (extraprop != null) {
      int index = extraprop["index"] ?? 5;
      if (index < 5) {
        if (controller.actionUp[index + 1] == null) {
          var action = controller.actionUp[index];
          controller.aimList[index] = null;
          controller.aimList[index + 1] = true;
          controller.actionUp[index] = null;
          controller.actionUp[index + 1] = action;
        }
      }
    }
    controller.discardPile.add(card);
    // controller.onUpdateLineAndDeck();
  }

  // Down
  static onGrenade(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    if (extraprop != null) {
      int index = extraprop["index"] ?? -1;
      if (index != -1) {
        controller.actionDown[index] = card;
      } else {
        controller.discardPile.add(card);
      }
    }
    // controller.onUpdateLineAndDeck();
  }

  // Front
  static onArmor(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      if (extraprop != null) {
        controller.petDeckNew()[extraprop["index"]].insert(0, card);
        print("onArmor: ${controller.petDeck().data[extraprop["index"]]}");
      }
    } catch (e) {
      e.printError();
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
    // controller.onUpdateLineAndDeck();
  }

  static onHide(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    // TODO Set hide card to the top
    try {
      if (extraprop != null) {
        controller.petDeckNew()[extraprop["index"]].insert(0, card);
        print("onHide: ${controller.petDeck().data[extraprop["index"]]}");
      }
    } catch (e) {
      e.printError();
    } finally {
      controller.playerfinishAction(card, extraprop);
    }

    // controller.onUpdateLineAndDeck();
  }

  static onGoForward(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    // check if there is no player pet, do nothing TODO
    if (extraprop != null) {
      int index = extraprop["index"] ?? 0;
      if (index > 0) {
        var pet = controller.petDeck().data[index];
        var forwardPet = controller.petDeck().data[index - 1];
        controller.petDeck().data[index] = forwardPet;
        controller.petDeck().data[index - 1] = pet;
      }
    }
    controller.discardPile.add(card);
    // controller.onUpdateLineAndDeck();
  }

  static onGoBackward(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    // check if there is no player pet, do nothing TODO
    if (extraprop != null) {
      int index = extraprop["index"] ?? 5;
      int maxIndex = 5;
      if (maxIndex > controller.petDeck().data.length - 1) {
        maxIndex = controller.petDeck().data.length - 1;
      }
      if (index < maxIndex) {
        var pet = controller.petDeck().data[index];
        var backWardPet = controller.petDeck().data[index + 1];
        controller.petDeck().data[index] = backWardPet;
        controller.petDeck().data[index + 1] = pet;
      }
    }
    controller.discardPile.add(card);
    // controller.onUpdateLineAndDeck();
  }

  static onGetCover(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    // check if there is no player pet, do nothing TODO
    if (extraprop != null) {
      const minIndex = 0;
      var maxIndex = 5;
      if (maxIndex > controller.petLine.length) {
        maxIndex = controller.petLine.length - 1;
      }
      int index = extraprop["index"] ?? -1;
      var coverIndex = -1;
      if (index == minIndex || index == maxIndex) {
        coverIndex = index == 0 ? index + 1 : index - 1;
        if (controller.petDeck().getAt(coverIndex)[0]["name"] != Constant.PET["Forest"]?["name"]) {
          controller.petDeck().getAt(coverIndex).addAll(controller.petDeck().removeAt(index));
        }
      } else {
        // TODO
        //show Dialog choose want to cover front or back
        if (controller.petDeck().getAt(index + 1)[0]["name"] != Constant.PET["Forest"]?["name"] &&
            controller.petDeck().getAt(index - 1)[0]["name"] != Constant.PET["Forest"]?["name"]) {
          coverIndex = index + await GF.showLeftRightDialog();
          if (coverIndex < controller.petLine.length) {
            controller.petDeck().getAt(coverIndex).addAll(controller.petDeck().removeAt(index));
          }
        } else if (controller.petDeck().getAt(index + 1)[0]["name"] != Constant.PET["Forest"]?["name"]) {
          coverIndex = index + 1;
          if (coverIndex < controller.petLine.length) {
            controller.petDeck().getAt(coverIndex).addAll(controller.petDeck().removeAt(index));
          }
        } else if (controller.petDeck().getAt(index + 1)[0]["name"] != Constant.PET["Forest"]?["name"]) {
          coverIndex = index - 1;
          if (coverIndex < controller.petLine.length) {
            controller.petDeck().getAt(coverIndex).addAll(controller.petDeck().removeAt(index));
          }
        } else {
          // do nothing
        }
      }
    }
    controller.discardPile.add(card);
    // controller.onUpdateLineAndDeck();
  }

  //
  static onDoom(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    // // TODO ERROR null value

    // if (extraprop != null) {
    //   int index = extraprop["index"] ?? -1;
    //   if (index != -1) {
    //     // Remove Aim if there is Aim Above
    //     if (controller.actionUp[index] != null && controller.actionUp[index]?["name"] == "Aim") {
    //       controller.discardPile.add(controller.actionUp[index]!);
    //       controller.aimList[index] = null;
    //       controller.actionUp[index] = null;
    //     }
    //     if (controller.petDeck().getAt(index).first["name"] != Constant.PET["Forest"]?["name"]) {
    //       if (controller.petDeck().getAt(index).length > 1) {
    //         var card = controller.petDeck().getAt(index).first;
    //         if (card["name"] == "Shield") {
    //           // check shield life (armor 2x)
    //           controller.discardPile.add(card);
    //           controller.petDeck().getAt(index).removeAt(0);
    //         } else if (card["name"] == "Armor") {
    //           controller.discardPile.add(card);
    //           controller.petDeck().getAt(index).removeAt(0);
    //         } else if (card["name"] == "Hide") {
    //           // do nothing
    //         } else {
    //           // jika pet
    //           var indexPlayerPet = GameUtils.getPlayerIndexByPet(
    //               controller.petDeck().getAt(index).first["name"], controller.playerArr());
    //           if (indexPlayerPet != -1) {
    //             //substract the player life (attacked pet)
    //             controller.playerArr()[indexPlayerPet].life.value--;
    //           }
    //           controller.petDeck().getAt(index).removeAt(0);
    //         }
    //       } else {
    //         var indexPlayerPet =
    //             GameUtils.getPlayerIndexByPet(controller.petDeck().getAt(index).first["name"], controller.playerArr());
    //         if (indexPlayerPet != -1) {
    //           //substract the player life (attacked pet)
    //           controller.playerArr()[indexPlayerPet].life.value--;
    //         }
    //         controller.petDeck().removeAt(index);
    //       }
    //     }
    //     // TODO Kamikaze copy from Boom after finish
    //   }

    //   controller.discardPile.add(card);
    // }

    // controller
    //     .petDeck()
    //     .data[extraprop?["index"]]
    //     .insert(0, card);
    // controller.onUpdateLineAndDeck();
  }

  static onResurrect(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    // if (GameUtils.onCheckResurrect(controller.pl[controller.nowTurn()])) {
    //   controller.petDeck().addElement([GameUtils.getResurrectPet(controller.playerArr[controller.nowTurn()])]);
    //   controller.playerArr[controller.nowTurn()].life.value++;
    // }
  }

  static onRunning(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      List<Map<String, dynamic>> tempCard = [];
      var tempPetDeck = controller.petDeckNew();
      for (var i = 0; i < tempPetDeck[0].length; i++) {
        if (tempPetDeck[0][i].containsKey("ability")) {
          controller.discardPilePerTurn().add(tempPetDeck[0][i]);
        } else {
          tempCard.add(tempPetDeck[0][i]);
        }
      }
      controller.petDeckNew()[0] = tempCard;
      var front = controller.petDeckNew().removeAt(0);
      controller.petDeckNew().add(front);
    } catch (e) {
      e.printError();
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  static onTyphoon(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    for (var i = 0; i < controller.petLine.length; i++) {
      List<Map<String, dynamic>> tempCard = [];
      for (var j = 0; j < controller.petDeck().getAt(i).length; j++) {
        if (controller.petDeck().data[i][j].containsKey("ability")) {
          controller.discardPile.add(controller.petDeck().getAt(i)[j]);
        } else {
          tempCard.add(controller.petDeck().getAt(i)[j]);
        }
      }
      controller.petDeck().setAt(i, tempCard);
    }
    controller.petDeck().shuffleAll();
    // controller.onUpdateLineAndDeck();
  }

  static onMoveThePet(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    try {
      controller.isMoveThePet(true);
      controller.startTimer(10);
      await Future.delayed(const Duration(seconds: 10), () {
        controller.isMoveThePet(false);
      });
      controller.petDeckNew().replaceRange(0, controller.petLine().length, controller.petLine());
    } catch (e) {
      e.printError();
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
      for (var i = 0; i < controller.actionUp.length; i++) {
        if (controller.actionUp[i] != null) {
          controller.discardPilePerTurn.add(controller.actionUp[i]!);
        }
      }
      GF.setListElementNull(controller.actionUp(), 6);
      GF.setListElementNull(controller.aimList(), 6);
    } catch (e) {
      e.printError();
    } finally {
      controller.playerfinishAction(card, extraprop);
    }
  }

  // Special
  static onMasterHide(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {}
  static onShield(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    // apakah perlu menambahkan kartu shield menjadi 2 atau menambah extraprop TODO
    for (var i = 0; i < 2; i++) {
      onArmor(controller, card, extraprop: extraprop);
    }
  }

  static onMovingAim(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    if (!GF.isListNull(controller.actionUp)) {
      controller.isMovingAim(true);
      Future.delayed(const Duration(seconds: 5), () {
        controller.isMovingAim(false);
      });
    } else {
      print("onMovingAim: no AIM");
    }
  }

  static onTrap(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {}

  static onDoubleResurrect(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    for (var i = 0; i < 2; i++) {
      onResurrect(controller, card, extraprop: extraprop);
    }
  }

  static onGoAnyward(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {}

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
    for (var i = 0; i < 2; i++) {
      onRunning(controller, card, extraprop: extraprop);
    }
  }

  static onEscape(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {}

  static onMegaGrenade(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    if (extraprop != null) {
      int index = extraprop["index"] ?? -1;
      if (index != -1) {
        controller.actionDown[index] = card;
      } else {
        controller.discardPile.add(card);
      }
    }
    // controller.onUpdateLineAndDeck();
  }

  static onKamikaze(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) async {
    if (extraprop != null) {
      int index = extraprop["index"] ?? -1;
      if (index != -1) {
        controller.petDeck().data[extraprop["index"]].insert(0, card);
      } else {
        controller.discardPile.add(card);
      }
    }
    // controller.discardPile.add(card);
  }
}
