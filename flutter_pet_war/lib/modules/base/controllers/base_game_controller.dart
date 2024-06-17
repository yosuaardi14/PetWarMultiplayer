import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pet_war/core/utils/circular_queue.dart';
import 'package:flutter_pet_war/data/models/player.dart';
import 'package:flutter_pet_war/data/services/socket_service.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/catalog/card_catalog.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/dialog/info_dialog.dart';
import 'package:get/get.dart';

class BaseGameController extends GetxController {
  final playerRoomList = <String, dynamic>{}.obs;
  final actionHistory = "".obs;
  final timerTxt = 0.obs;
  final ScrollController actionHistoryScrollController = ScrollController();
  final socketService = SocketService.instance;

  // Game
  final aimList = <bool?>[null, null, null, null, null, null].obs;
  final actionUp =
      <Map<String, dynamic>?>[null, null, null, null, null, null].obs;
  final petLine = <List<Map<String, dynamic>>>[].obs;
  final grenadeList = <int?>[null, null, null, null, null, null].obs;
  final actionDown =
      <Map<String, dynamic>?>[null, null, null, null, null, null].obs;

  // NOT VISIBLE
  final actionDeck = <Map<String, dynamic>>[].obs;
  final actionDeckLength = 0.obs;
  final petDeck = CircularQueue<List<Map<String, dynamic>>>().obs;
  final petDeckLength = 0.obs;
  final discardPile = <Map<String, dynamic>>[].obs;

  final playerInfoList = <Map<String, dynamic>>[].obs;
  final nowTurnPlayerName = "".obs;
  final nowTurnPlayerId = "".obs;
  final playerObj = RxPlayer().obs;

  //
  final initPlayerFinish = false.obs;
  final initActionDeckFinish = false.obs;
  final initPetDeckFinish = false.obs;
  final initDiscardPileFinish = false.obs;

  //
  final discardPileCurrentCard = <String, dynamic>{}.obs;

  //Drag Target Boolean
  final isMoveThePet = false.obs;
  final isMovingAim = false.obs;
  final isHaunted = false.obs;

  final isPlayerTurn = false.obs;

  void notifyTurn() {
    Get.dialog(const InfoDialog());
  }

  void notifyDefeated() {
    Get.dialog(const InfoDialog(text: "Kamu Kalah"));
  }

  void notifyWinner(data) {
    Get.dialog(InfoDialog(text: data));
  }

  void startTimer(int initVal) {
    timerTxt(initVal);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerTxt() == 0) {
        timer.cancel();
      } else {
        timerTxt.value--;
      }
    });
  }

  void initGame(Map<String, dynamic> initialData) {
    initAction(initialData);
    initPet(initialData);
  }

  void setPlayer(Map<String, dynamic> json) {
    try {
      playerObj().setFromJson(json);
      playerObj().setRanger(json["ranger"]);
      playerObj().setCardDeck(
        List<Map<String, dynamic>>.from(
          json["cardDeck"].map((e) => e),
        ),
      );
      initPlayerFinish(true);
    } catch (e) {
      printError();
    }
  }

  void initPlayer(Map<String, dynamic> json) {
    var player = RxPlayer.fromJson(json);
    player.setRanger(json["ranger"]);

    try {
      var cardDeck = List<Map<String, dynamic>>.from(
        json["cardDeck"].map((e) => e),
      );
      player.setCardDeck(cardDeck);
      playerObj(player);

      initPlayerFinish(true);
    } catch (e) {
      printError();
    }
  }

  void initAction(Map<String, dynamic> initialData) {
    actionDeckLength(initialData["actionDeckLength"] ?? 0);
    actionUp.value =
        List<Map<String, dynamic>?>.from(initialData["actionUp"].map((e) => e));
    aimList.value = List<bool?>.from(initialData["aimList"].map((e) => e));
    actionDown.value = List<Map<String, dynamic>?>.from(
        initialData["actionDown"].map((e) => e));
    if (initialData["discardPile"].isNotEmpty) {
      discardPile.value = List<Map<String, dynamic>>.from(
          initialData["discardPile"].map((e) => e));
    } else {
      discardPile.value = [];
    }
    playerInfoList.value = List<Map<String, dynamic>>.from(
        initialData["playerInfoList"].map((e) => e));

    initActionDeckFinish(true);
    initDiscardPileFinish(true);
  }

  void initPet(Map<String, dynamic> initialData) {
    // List<List<Map<String, dynamic>>> temp = (initialData["petDeck"] as List)
    //     .map((e) => (e as List).map((e) => e as Map<String, dynamic>).toList())
    //     .toList();
    petDeckLength(initialData["petDeckLength"] ?? 0);
    // petDeck.value.data = temp;
    List<List<Map<String, dynamic>>> temp = (initialData["petLine"] as List)
        .map((e) => (e as List).map((e) => e as Map<String, dynamic>).toList())
        .toList();
    petLine.value = temp;
    initPetDeckFinish(true);
  }

  void onUpdateLineDeck(Map<String, dynamic> data) {
    try {
      actionDeckLength(data["actionDeckLength"] ?? 0);
      actionUp.value =
          List<Map<String, dynamic>?>.from(data["actionUp"].map((e) => e));
      aimList.value = List<bool?>.from(data["aimList"].map((e) => e));

      actionDown.value =
          List<Map<String, dynamic>?>.from(data["actionDown"].map((e) => e));
      discardPile.value =
          List<Map<String, dynamic>>.from(data["discardPile"].map((e) => e));
      initActionDeckFinish(true);
      if (discardPile.isNotEmpty) {
        discardPileCurrentCard(discardPile[discardPile.length - 1]);
      }
      List<List<Map<String, dynamic>>> temp = (data["petLine"] as List)
          .map(
              (e) => (e as List).map((e) => e as Map<String, dynamic>).toList())
          .toList();

      petDeckLength(data["petDeckLength"] ?? 0);
      petLine.value = temp;
      initPetDeckFinish(true);
      playerInfoList.value =
          List<Map<String, dynamic>>.from(data["playerInfoList"].map((e) => e));

      if (data["grenadeList"].isNotEmpty) {
        grenadeList.value = List<int?>.from(data["grenadeList"].map((e) => e));
      }
      initDiscardPileFinish(true);
    } catch (e) {
      print("Error OOO");
      // e.printError();
    }
  }

  void finishAction(Map<String, dynamic> data) {
    // update deck and line
    onUpdateLineDeck(data);
  }

  void sendCommand(
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) {
    isPlayerTurn(false);
    socketService.sendCommand(card, extraprop: extraprop);
    // socketController.sendCommand(card, extraprop: extraprop);
  }

  void onReorderPet(int oldIndex, int newIndex) {
    print("onReorderPet");
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    // CHECK TRAP
    if (newIndex < petLine.length) {
      final pet = petLine.removeAt(oldIndex);
      petLine.insert(newIndex, pet);
    }
  }

  void onReorderAim(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = actionUp.removeAt(oldIndex);
    actionUp.insert(newIndex, item);
    updateAimListAfterMovingAim();
    isMovingAim(false);
  }

  void updateAimListAfterMovingAim() {
    aimList.value = [null, null, null, null, null, null];
    for (var i = 0; i < actionUp.length; i++) {
      if (actionUp[i] == null) {
        continue;
      }

      aimList[i] = true;
      if (actionUp[i]?["block"] == 2 && (i + 1 < 6)) {
        aimList[i + 1] = true;
      }
    }
  }

  void showCatalog() {
    Get.dialog(const CardCatalog());
  }
}
