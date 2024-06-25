import 'package:flutter/material.dart';
import 'package:flutter_pet_war/core/utils/global_functions.dart';
import 'package:flutter_pet_war/data/services/socket_service.dart';
import 'package:flutter_pet_war/modules/base/controllers/base_game_controller.dart';
import 'package:flutter_pet_war/modules/game/local_widgets/dialog/master_hide_dialog.dart';
import 'package:get/get.dart';

class GameController extends BaseGameController {
  final playerSelectedCard = <String, dynamic>{}.obs;
  final isFinishGame = false.obs;
  final chatHistory = "".obs;
  final isHost = false.obs;
  final ScrollController chatHistoryScrollController = ScrollController();
  final TextEditingController chatTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    initArguments();
    if (!SocketService.isInit) {
      socketService.initSocket();
    }
    socketService.setController(this);
  }

  @override
  void dispose() {
    super.dispose();
    socketService.setController(null);
  }

  void initArguments() {
    if (Get.arguments != null && Get.arguments == true) {
      isHost(true);
    }
  }

  void sendMessage() {
    if (chatTextController.text.isEmpty) {
      return;
    }
    socketService.sendMessage(chatTextController.text);
    chatTextController.clear();
  }

  Future confirmAction(data) async {
    // Show Dialog if there is need choose target
    print(data);
    if (data.isEmpty) {
      return "Ok";
    }
    switch (data["type"] ?? "") {
      case "aimList":
        // aim - actionUp
        isMovingAim(true);
        startTimer(6);
        await Future.delayed(const Duration(seconds: 6));
        updateAimListAfterMovingAim();
        return {
          "card": playerSelectedCard(),
          "extraprop": {"aimList": aimList(), "actionUp": actionUp(), ...?data["extraprop"]}
        };
      case "petLine":
        // pet line
        isMoveThePet(true);
        startTimer(10);
        await Future.delayed(
          const Duration(seconds: 10),
          () => isMoveThePet(false),
        );
        return {
          "card": playerSelectedCard(),
          "extraprop": {
            "petLine": petLine(),
            ...?data["extraprop"],
          }
        };
      case "masterHideIndex":
        final res = await Get.dialog(
          MasterHideDialog(
            cardList: petLine(),
            index: data["extraprop"]["index"] ?? 0,
          ),
          barrierDismissible: false,
        );
        return {
          "card": playerSelectedCard(),
          "extraprop": {
            "masterHideIndex": res,
            ...?data["extraprop"],
          },
        };
      case "targetIndex":
        // left right dialog
        final res = await GF.showLeftRightDialog();
        return {
          "card": playerSelectedCard(),
          "extraprop": {"targetIndex": res < 0 ? "left" : "right", ...?data["extraprop"]},
        };
      default:
        return "Ok";
    }
  }

  @override
  void finishAction(Map<String, dynamic> data) {
    // update deck and line
    playerSelectedCard({});
    super.finishAction(data);
  }

  void updateCard(Map<String, dynamic> json) {
    try {
      playerObj().updateLife(json);
      var cardDeck = List<Map<String, dynamic>>.from(
        json["cardDeck"].map((e) => e),
      );
      print(cardDeck);
      playerObj().setCardDeck(cardDeck);
    } catch (e) {
      printError();
    }
  }

  void flipCard(int index) {
    playerObj()
        .cardDeck()[index]
        .update("useSpecial", (value) => !(playerObj().cardDeck[index]["useSpecial"] ?? false));
    playerObj.refresh();
    print(playerObj().cardDeck());
  }

  void rotateCard(int index) {
    // var tempCardDeck = playerObj.cardDeck();
    playerObj().cardDeck()[index].update("block", (value) {
      if (playerObj().cardDeck()[index]["block"] == 2) {
        return 1;
      }
      return 2;
    });
    playerObj.refresh();
    print(playerObj().cardDeck());
  }

  void onStartDragCard(Map<String, dynamic> value) {
    playerSelectedCard(value);
    print("onStartDragCard: ${playerSelectedCard()}");
  }

  void onCanceledDrag() {
    playerSelectedCard({});
    print("onCanceledDrag: ${playerSelectedCard()}");
  }
}
