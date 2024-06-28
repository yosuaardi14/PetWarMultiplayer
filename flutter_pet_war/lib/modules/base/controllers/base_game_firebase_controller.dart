// ignore_for_file: avoid_print

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet_war/core/utils/ability_utils.dart';
import 'package:flutter_pet_war/core/utils/base_ability_utils.dart';
import 'package:flutter_pet_war/core/utils/card_utils.dart';
import 'package:flutter_pet_war/core/utils/circular_queue.dart';
import 'package:flutter_pet_war/core/utils/game_utils.dart';
import 'package:flutter_pet_war/core/utils/global_functions.dart';
import 'package:flutter_pet_war/core/values/constant.dart';
import 'package:flutter_pet_war/core/values/game_state.dart';
import 'package:flutter_pet_war/data/models/player.dart';
import 'package:flutter_pet_war/data/services/firestore_service.dart';
import 'package:flutter_pet_war/data/services/socket_service.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/catalog/card_catalog.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/dialog/info_dialog.dart';
import 'package:get/get.dart';

class BaseGameFirebaseController extends GetxController {
  final playerRoomList = <String, dynamic>{}.obs;
  final actionHistory = "".obs;
  final timerTxt = 0.obs;
  final ScrollController actionHistoryScrollController = ScrollController();
  final socketService = SocketService.instance;
  final firestoreService = FirestoreService();
  final playerData = <String, dynamic>{}.obs;

  final data = Rx<Map<String, dynamic>?>(null);

  // Game
  final aimList = <bool?>[null, null, null, null, null, null].obs;
  final actionUp = <Map<String, dynamic>?>[null, null, null, null, null, null].obs;
  final petLine = <List<Map<String, dynamic>>>[].obs;
  final grenadeList = <int?>[null, null, null, null, null, null].obs;
  final actionDown = <Map<String, dynamic>?>[null, null, null, null, null, null].obs;

  // NOT VISIBLE
  final actionDeck = <Map<String, dynamic>>[].obs;
  final actionDeckLength = 0.obs;
  final petDeck = CircularQueue<List<Map<String, dynamic>>>().obs;
  final petDeckNew = <List<Map<String, dynamic>>>[].obs;
  final petDeckLength = 0.obs;
  final discardPile = <Map<String, dynamic>>[].obs;

  final playerInfoList = <Map<String, dynamic>>[].obs;
  final playerInfoObj = <String, dynamic>{}.obs;
  final playerIdArr = <String>[].obs;
  final nowTurnPlayerName = "".obs;
  final nowTurnPlayerId = "".obs;
  final playerObj = RxPlayer().obs;

  //
  final initPlayerFinish = false.obs;
  final initActionDeckFinish = false.obs;
  final initPetDeckFinish = false.obs;
  final initDiscardPileFinish = false.obs;
  final initPlayerInfoFinish = false.obs;

  //
  final discardPileCurrentCard = <String, dynamic>{}.obs;

  //Drag Target Boolean
  final isMoveThePet = false.obs;
  final isMovingAim = false.obs;
  final isHaunted = false.obs;

  final isPlayerTurn = false.obs;
  final playerSelectedCard = <String, dynamic>{}.obs;

  final showHostPanel = false.obs;
  final isFinishGame = false.obs;

  //
  final gameLog = <String>[].obs;

  final roomId = "".obs;
  final hostId = "".obs;

  // TEMP
  final discardPilePerTurn = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    data.close();
  }

  void loadData() async {
    Map<String, dynamic> player = await GF.loadPlayerData();
    playerData(player);
    if (Get.parameters["roomId"] != null) {
      roomId(Get.parameters["roomId"]);
    }
    listenToStream();
  }

  void listenToStream() {
    if (Get.parameters["roomId"] != null) {
      data.bindStream(firestoreService.getCollectionByDocIdStream("room", Get.parameters["roomId"]!).map((e) {
        print("bindStream ${e?["status"] ?? ""} - ${e?["state"]?["name"] ?? ""}");
        onGameStateCheck(e);
        return e;
      }));
    }
  }

  void resetInitStatus() {
    initActionDeckFinish(false);
    initPetDeckFinish(false);
    initDiscardPileFinish(false);
    initPlayerFinish(false);
    initPlayerInfoFinish(false);
  }

  void onGameStateCheck(Map<String, dynamic>? e) async {
    print("onGameStateCheck");
    updateLineAndDeck(e);
    if (e?["status"] == GameState.waiting.name) {
      print(GameState.waiting.name);
      showHostPanel(e?["host"] == playerData["id"]);
      resetInitStatus();
      //TODO if player == room MaxNum automatic initGame
    } else if (e?["status"] == GameState.ready.name) {
      print(GameState.ready.name);
      showHostPanel(false);
      // print(playerData()["id"]);
      if (e?["host"] == playerData()["id"]) {
        Map<String, dynamic> data = {
          "status": GameState.start.name,
          "state": {
            "name": GameState.initGame.name,
            "turn": null,
            "card": {},
            "extraprop": {
              "line": -1,
              "index": -1,
              "type": null,
            }
          },
        };
        await firestoreService.updateData("room", Get.parameters["roomId"]!, data);
      }
    } else if (e?["status"] == GameState.start.name) {
      print(GameState.start.name);
      showHostPanel(false);
      if (e?["state"] != null) {
        // print(e?["state"]);
        if (e?["state"]["name"] == GameState.initGame.name) {
          print(GameState.initGame.name);
          playerInfoObj(e?["playerInfoList"]);
          onInitGameFinish(e);
        } else if (e?["state"]["name"] == GameState.playerTurn.name) {
          print(GameState.playerTurn.name);
          nowTurnPlayerId(e?["state"]?["turn"]);

          if (e?["state"]?["turn"] == playerData["id"]) {
            onPlayerTurn(e);
          }
          // }
          // else if (e?["state"]["name"] == GameState.sendAction.name) {
          //   print(GameState.sendAction.name);
          //   onSendAction(e);
        } else if (e?["state"]["name"] == GameState.confirmAction.name) {
          print(GameState.confirmAction.name);

          if (e?["state"]?["turn"] == playerData["id"]) {
            onConfirmAction(e);
          }
        } else if (e?["state"]["name"] == GameState.finishAction.name) {
          print(GameState.finishAction.name);

          if (e?["state"]?["turn"] == playerData["id"]) {
            onFinishAction(e);
          }
        } else if (e?["state"]["name"] == GameState.nextTurn.name) {
          print(GameState.nextTurn.name);

          if (e?["state"]?["turn"] == playerData["id"]) {
            onNextTurn(e);
          }
        }
        // else if (e?["state"]["name"] == GameState.gameFinish.name) {
        //   print(GameState.gameFinish.name);
        // }
      }
    } else if (e?["status"] == GameState.finish.name) {
      print(GameState.finish.name);
      isFinishGame(true);
      showHostPanel(e?["host"] == playerData["id"]);
      String winner = "${e?["winner"]} adalah Sang PET WAR MASTER";
      notifyWinner(winner);
    }
    // print(e);
  }

  void fetchCardDatabase() async {
    // Check if there is data in Local Storage

    // Fetch Card from Firestore make it local (every player when join room) Local Storage
    await firestoreService.getCollection("card");
    // Save to Local Storage
  }

  // on Host click Start Button
  void onInitGame() async {
    // Init Deck
    // Set the actionDeck: [] -> list of string (actionCard id)
    // Set the petDeck: [] -> list of string (petCard id)
    // "aimList": [], "actionUp": [] -> fill with null,
    // "grenadeList": [], "actionDown": [] -> fill with null,
    // "discardPile": [] -> empty
    var rangerList = GameUtils.initCanvasRanger();
    Map<String, dynamic> playerInfo = {};
    for (var player in playerInfoObj.entries) {
      var rand = GF.genRandomNumber(rangerList.length);
      Map<String, dynamic> data = {
        "rangerName": rangerList[rand]["name"],
        "ranger": rangerList[rand],
        "maxLife": 5,
        "life": 5,
        "cardDeck": [],
        "isDead": false,
        "defeatedPet": []
      };
      // print(data["ranger"]["pet"]);
      playerInfo[player.key] = data;
      rangerList.remove(rangerList[rand]);
    }
    var tempActionDeck = GameUtils.initActionDeck();
    var listActionId = List<String>.from(tempActionDeck.map((e) => (e["id"] ?? "")).toList());

    var tempPetDeck = GameUtils.initPetDeckObject(playerInfo);

    // deal Action Card
    (listActionId, playerInfo) = dealActionCard(listActionId, playerInfo);

    List<String> playerIdArr = getFirstTurn(tempPetDeck, playerInfo);
    Map<String, dynamic> data = {
      "status": GameState.ready.name,
      "playerInfoList": playerInfo,
      "game": {
        "actionDeck": listActionId,
        "petDeck": tempPetDeck,
        "aimList": [null, null, null, null, null, null],
        "actionUp": [null, null, null, null, null, null],
        "grenadeList": [null, null, null, null, null, null],
        "actionDown": [null, null, null, null, null, null],
        "discardPile": [],
        "playerIdArr": playerIdArr,
        "turn": 0,
        "totalTurn": 0,
      }
    };
    // print(data);
    await firestoreService.updateData("room", Get.parameters["roomId"]!, data);
    showHostPanel(false);
  }

  void onInitGameFinish(Map<String, dynamic>? e) async {
    List<String> playerIdArr = List<String>.from(e?["game"]?["playerIdArr"] ?? []);
    Map<String, dynamic> playerInfo = Map<String, dynamic>.from(e?["playerInfoList"]);
    Map<String, dynamic> data = {
      "log": FieldValue.arrayUnion(["Giliran ${playerInfo[playerIdArr[0]]["name"]}"]),
      "state": {
        "name": GameState.playerTurn.name,
        "turn": playerIdArr[0],
        "card": {},
        "extraprop": {
          "line": -1,
          "index": -1,
          "type": null,
        }
      },
    };
    // print(data);
    updateLineAndDeck(e);
    await firestoreService.updateData("room", Get.parameters["roomId"]!, data);
  }

  void onPlayerTurn(Map<String, dynamic>? e) {
    notifyTurn();
    isPlayerTurn(true);
    if (playerObj().cardDeck.length < 3) {
      playerObj().cardDeck.add(CardUtils.getActionCardById(List<String>.from(e?["game"]["actionDeck"])[0]));
      actionDeck.removeAt(0);
    }
  }

  void onConfirmAction(Map<String, dynamic>? e) async {
    // TODO
    Map<String, dynamic> data = {
      "state": {
        "name": GameState.finishAction.name,
      }
    };
    await firestoreService.updateData("room", Get.parameters["roomId"]!, data);
  }

  void onFinishAction(Map<String, dynamic>? e) async {
    playerSelectedCard({});
    isPlayerTurn(false);
    try {
      Map<String, dynamic> copyData = Map<String, dynamic>.from(e ?? {});
      if (copyData["game"]["actionDeck"].length <= 0) {
        copyData["game"]["actionDeck"] =
            List<Map<String, dynamic>>.from(copyData["game"]["discardPile"]).map((e) => (e["id"] ?? "")).toList();
        copyData["game"]["discardPile"] = [];
      }
      // getCard
      (List<String>, Map<String, dynamic>) playerGetCard = getCard(
        List<String>.from(copyData["game"]["actionDeck"]),
        copyData["playerInfoList"],
      );
      copyData["game"]["actionDeck"] = playerGetCard.$1;
      copyData["playerInfoList"] = playerGetCard.$2;

      // cbeckGameFinish
      Map<String, dynamic> data = checkGameFinish(copyData);
      await firestoreService.updateData("room", Get.parameters["roomId"]!, data);
    } catch (e) {
      e.printError();
    }
  }

  void onNextTurn(Map<String, dynamic>? e) async {
    // checkHideAndTrapTurn(nextTurnId); update the data
    // Next Turn
    try {
      var turn = (e?["game"]?["turn"] + 1) ?? 0;
      var playerIdArr = List<String>.from(e?["game"]?["playerIdArr"]);
      Map<String, dynamic> playerInfo = e?["playerInfoList"] ?? {};
      var nextTurnId = playerIdArr[turn % playerIdArr.length];
      for (var i = 0; i < playerIdArr.length; i++) {
        nextTurnId = playerIdArr[turn % playerIdArr.length];
        // print(playerInfo);
        checkHideAndTrapTurn(nextTurnId);
        if (playerInfo[nextTurnId]["isDead"] == false) {
          break;
        }
        turn += 1;
      }

      Map<String, dynamic> data = {
        "log": FieldValue.arrayUnion(["Giliran ${playerInfo[nextTurnId]["name"]}"]),
        "game": {
          "petDeck": GF.convertListofListMapToListMap(petDeckNew()),
          if (discardPilePerTurn.isNotEmpty) "discardPile": FieldValue.arrayUnion(discardPilePerTurn()),
          "turn": turn,
          "totalTurn": FieldValue.increment(1),
        },
        "state": {
          "name": GameState.playerTurn.name,
          "turn": nextTurnId,
          "card": {},
          "extraprop": {
            "line": -1,
            "index": -1,
            "type": null,
          },
        }
      };
      await firestoreService.updateData("room", Get.parameters["roomId"]!, data);
    } catch (e) {
      e.printError();
    } finally {
      discardPilePerTurn.clear();
    }
  }

  ///////////////////////////////////////////////   INITGAME FUNCTION  ///////////////////////////////////////////////
  (List<String>, Map<String, dynamic>) dealActionCard(List<String> actionDeck, Map<String, dynamic> playerInfo) {
    for (var i = 0; i < 3; i++) {
      for (var player in playerInfo.entries) {
        player.value["cardDeck"].add(CardUtils.getActionCardById(actionDeck[0]));
        actionDeck.removeAt(0);
      }
    }
    return (actionDeck, playerInfo);
  }

  List<String> getFirstTurn(
    List<Map<String, Map<String, dynamic>>> petLine,
    Map<String, dynamic> playerInfo,
  ) {
    Map<String, dynamic>? firstPet; // = petLine[0]["0"];

    for (int i = 0; i < petLine.length; i++) {
      firstPet = petLine[i]["0"]!;
      // print(firstPet);
      if (firstPet["name"] != Constant.PET['Forest']?["name"]) {
        break;
      }
    }

    String nowTurnId = "";
    List<String> playerIdArr = [];

    playerInfo.forEach((playerId, player) {
      if (player["ranger"]["pet"] == firstPet!["name"]) {
        nowTurnId = playerId;
      }
    });

    playerInfo.forEach((playerId, player) {
      playerIdArr.add(playerId);
    });

    // print(playerIdArr);

    int firstPlayerIndex = playerIdArr.indexOf(nowTurnId);
    if (firstPlayerIndex != 0) {
      String temp = playerIdArr[0];
      playerIdArr[0] = playerIdArr[firstPlayerIndex];
      playerIdArr[firstPlayerIndex] = temp;

      // print(playerIdArr);
    }
    return playerIdArr;
  }

  /////////////////////////////////////////  PLAYERTURN FUNCTION  /////////////////////////////////////////

  void updateCard(Map<String, dynamic> json) {
    try {
      playerObj().updateLife(json);
      var cardDeck = List<Map<String, dynamic>>.from(
        json["cardDeck"].map((e) => e),
      );
      // print(cardDeck);
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
    // print(playerObj().cardDeck());
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
    // print(playerObj().cardDeck());
  }

  void onStartDragCard(Map<String, dynamic> value) {
    playerSelectedCard(value);
    print("onStartDragCard: ${playerSelectedCard()}");
  }

  void onCanceledDrag() {
    playerSelectedCard({});
    print("onCanceledDrag: ${playerSelectedCard()}");
  }

  void sendAction(
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) {
    isPlayerTurn(false);
    AbilityUtils.onAbilityAction(this, card, extraprop: extraprop);
  }

  void needConfirmation() async {
    Map<String, dynamic> data = {
      "state": {
        "name": GameState.confirmAction.name,
      }
    };
    await firestoreService.updateData("room", Get.parameters["roomId"]!, data);
  }

  void playerfinishAction(Map<String, dynamic> card, Map<String, dynamic>? extraprop) async {
    await updateCardTurn();
    List<Map<String, dynamic>> discardCard = [
      ...discardPilePerTurn(),
    ];
    // Player Data
    List<Map<String, dynamic>> cardDeck = playerObj().cardDeck();
    List<Map<String, dynamic>> defeatedPet = playerObj().defeatedPet();
    cardDeck.remove(card);

    // Send Data
    Map<String, dynamic> data = {
      "playerInfoList": {
        playerData["id"]: {
          "life": playerObj().life(),
          "cardDeck": cardDeck, //FieldValue.arrayRemove([card]),
          "defeatedPet": defeatedPet,
        }
      },
      "game": {
        "aimList": aimList(), //[null, null, null, null, null, null],
        "actionUp": actionUp(),
        "grenadeList": grenadeList(),
        "actionDown": actionDown(),
        "petDeck": GF.convertListofListMapToListMap(petDeckNew()),
        if (discardCard.isNotEmpty) "discardPile": FieldValue.arrayUnion(discardCard),
      },
      "state": {
        "name": GameState.finishAction.name,
        "card": card,
        "extraprop": {
          "line": extraprop?["line"] ?? -1,
          "index": extraprop?["index"] ?? -1,
          "type": null,
        },
      }
    };
    await firestoreService.updateData("room", Get.parameters["roomId"]!, data);
    discardPilePerTurn().clear();
  }

  /////////////////////////////////////////  CONFIRMACTION FUNCTION  /////////////////////////////////////////

  void moveCardToDiscardPile(Map<String, dynamic> data) {}

  /////////////////////////////////////////  FINISHACTION FUNCTION  /////////////////////////////////////////

  (List<String>, Map<String, dynamic>) getCard(List<String> actionDeck, Map<String, dynamic> playerInfo) {
    playerInfo[playerData["id"]]["cardDeck"].add(CardUtils.getActionCardById(actionDeck[0]));
    actionDeck.removeAt(0);
    return (actionDeck, playerInfo);
  }

  Future<void> updateCardTurn() async {
    // Grenande
    for (var i = 0; i < grenadeList().length; i++) {
      if (grenadeList[i] == null) {
        continue;
      }
      grenadeList[i] = (grenadeList()[i] ?? 0) + 1;
      if (grenadeList[i] == Constant.GRENADE_TURN) {
        grenadeList[i] = null;
        // explode grenade
        // need to add check if there is grenade, megagrenada, grenade -> will it explode or add checking in UI
        await BaseAbilityUtils.explodeGrenadeMine(this, i);
      }
    }
  }

  void updateLineAndDeck(Map<String, dynamic>? e) {
    hostId(e?["host"] ?? "");
    updatePlayerUI(e);
    if (e?["game"]?["petDeck"] != null) {
      petLine.clear();
      petDeckNew.clear();
      for (var pet in e?["game"]["petDeck"]) {
        List<Map<String, dynamic>> petListObj = Map<String, Map<String, dynamic>>.from(pet)
            .entries
            .map(
              (e) => e.value,
            )
            .toList();
        // print(petLine);
        // if (petLine.length < 6) {
        //   petLine.add(petListObj);
        // }
        petDeckNew.add(petListObj);
      }
      petLine.value = petDeckNew.getRange(0, 6).toList();
      petDeckLength(e?["game"]?["petDeck"]?.length ?? 0);
      initPetDeckFinish(true);
    }
    if (e?["game"]?["actionUp"] != null) {
      try {
        actionUp(List<Map<String, dynamic>?>.from(e?["game"]?["actionUp"]));
        aimList(List<bool?>.from(e?["game"]?["aimList"]));
        actionDeckLength(e?["game"]?["actionDeck"]?.length ?? 0);
        initActionDeckFinish(true);
      } catch (e) {
        e.printError();
      }
    }
    if (e?["game"]?["discardPile"] != null) {
      try {
        actionDown(List<Map<String, dynamic>?>.from(e?["game"]?["actionDown"]));
        grenadeList(List<int?>.from(e?["game"]?["grenadeList"]));
        discardPile(List<Map<String, dynamic>>.from(e?["game"]?["discardPile"] ?? []));
        initDiscardPileFinish(true);
        if (discardPile.isNotEmpty) {
          discardPileCurrentCard(discardPile.last);
        }
      } catch (e) {
        e.printError();
      }
    }
    if (e?["log"] != null) {
      actionHistory(e?["log"].join("\n"));
    }

    if (e?["playerInfoList"] != null) {
      playerInfoObj(e?["playerInfoList"] ?? {});
    }

    if (e?["game"]?["playerIdArr"] != null) {
      playerIdArr(List<String>.from(e?["game"]?["playerIdArr"]));
    }
  }

  void updatePlayerUI(Map<String, dynamic>? e) {
    try {
      playerObj().setFromJson(Map<String, dynamic>.from(
        e?["playerInfoList"][playerData["id"]],
      ));
      playerObj().setRanger(e?["playerInfoList"]?[playerData["id"]]["ranger"]);
      playerObj().setCardDeck(
        List<Map<String, dynamic>>.from(
          e?["playerInfoList"]?[playerData["id"]]["cardDeck"].map((e) => e),
        ),
      );
      initPlayerFinish(true);
      initPlayerInfoFinish(true);
    } catch (e) {
      e.printError();
    }
  }

  Map<String, dynamic> checkGameFinish(Map<String, dynamic>? e) {
    Map<String, dynamic> room = Map<String, dynamic>.from(e ?? {});
    Map<String, dynamic> playerInfo = e?["playerInfo"] ?? {};
    String winner = "";
    var totalDefeated = 0;
    for (var player in playerInfo.entries) {
      if (player.value["life"] == 0) {
        totalDefeated += 1;
        if (player.value["isDead"]) {
          continue;
        }
        room = onDead(room, player);
      } else {
        winner = player.value["name"];
      }
    }
    if (totalDefeated > 0 && (totalDefeated == playerInfo.length - 1)) {
      room["status"] = GameState.finish.name;
      room["state"] = {
        "name": GameState.gameFinish.name,
        "turn": "",
        "card": {},
        "extraprop": {
          "line": -1,
          "index": -1,
          "type": null,
        },
      };
      room["winner"] = winner;
      return room;
    }
    room["state"]["name"] = GameState.nextTurn.name;
    return room;
  }

  Map<String, dynamic> onDead(Map<String, dynamic> roomData, MapEntry<String, dynamic> player) {
    List<Map<String, dynamic>> discardPile = List<Map<String, dynamic>>.from(roomData["game"]["discardPile"]);
    List<Map<String, dynamic>> playerDeck = List<Map<String, dynamic>>.from(player.value["cardDeck"]);
    discardPile.addAll(playerDeck);
    player.value["isDead"] = true;
    player.value["cardDeck"] = [];
    Map<String, dynamic> data = {
      "playerInfoList": {
        player.key: player.value,
      },
      "game": {
        "discardPile": discardPile,
      }
    };
    return data;
  }

  /////////////////////////////////////////  NEXTURN FUNCTION  /////////////////////////////////////////
  void checkHideAndTrapTurn(String playerId) {
    // Remove Hide or Trap
    for (var i = 0; i < petLine().length; i++) {
      List<Map<String, dynamic>> tempCard = [];
      // Find and Remove Hide and Trap that Player Use one turn before
      for (var j = 0; j < petDeckNew()[i].length; j++) {
        if (petDeckNew[i][j]["name"] == Constant.HIDE || petDeckNew[i][j]["special"]?["name"] == Constant.TRAP) {
          if (petDeckNew[i][j]["prop"]?["playerId"] == playerId) {
            discardPilePerTurn.add(CardUtils.resetCard(petDeckNew[i][j]));
          } else {
            tempCard.add(petDeckNew[i][j]);
          }
        } else {
          tempCard.add(petDeckNew[i][j]);
        }
      }
      petDeckNew[i] = tempCard;
    }
  }

  /////////////////////////////////////////  GAMEFINISH FUNCTION  /////////////////////////////////////////

  // OLD

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
    actionUp.value = List<Map<String, dynamic>?>.from(initialData["actionUp"].map((e) => e));
    aimList.value = List<bool?>.from(initialData["aimList"].map((e) => e));
    actionDown.value = List<Map<String, dynamic>?>.from(initialData["actionDown"].map((e) => e));
    if (initialData["discardPile"].isNotEmpty) {
      discardPile.value = List<Map<String, dynamic>>.from(initialData["discardPile"].map((e) => e));
    } else {
      discardPile.value = [];
    }
    playerInfoList.value = List<Map<String, dynamic>>.from(initialData["playerInfoList"].map((e) => e));

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
      actionUp.value = List<Map<String, dynamic>?>.from(data["actionUp"].map((e) => e));
      aimList.value = List<bool?>.from(data["aimList"].map((e) => e));

      actionDown.value = List<Map<String, dynamic>?>.from(data["actionDown"].map((e) => e));
      discardPile.value = List<Map<String, dynamic>>.from(data["discardPile"].map((e) => e));
      initActionDeckFinish(true);
      if (discardPile.isNotEmpty) {
        discardPileCurrentCard(discardPile[discardPile.length - 1]);
      }
      List<List<Map<String, dynamic>>> temp =
          (data["petLine"] as List).map((e) => (e as List).map((e) => e as Map<String, dynamic>).toList()).toList();

      petDeckLength(data["petDeckLength"] ?? 0);
      petLine.value = temp;
      initPetDeckFinish(true);
      playerInfoList.value = List<Map<String, dynamic>>.from(data["playerInfoList"].map((e) => e));

      if (data["grenadeList"].isNotEmpty) {
        grenadeList.value = List<int?>.from(data["grenadeList"].map((e) => e));
      }
      initDiscardPileFinish(true);
    } catch (e) {
      // print("Error OOO");
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
