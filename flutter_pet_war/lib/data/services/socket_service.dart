// ignore_for_file: library_prefixes, avoid_print, avoid_web_libraries_in_flutter

import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_pet_war/core/utils/storage_utils.dart';
import 'package:flutter_pet_war/modules/base/controllers/base_game_controller.dart';
import 'package:flutter_pet_war/modules/game/controllers/game_controller.dart';
import 'package:flutter_pet_war/modules/home/controllers/home_controller.dart';
import 'package:flutter_pet_war/modules/spectator/controllers/spectator_controller.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  // Private constructor
  SocketService._internal();

  // Single instance
  static final SocketService _instance = SocketService._internal();

  // Factory constructor
  factory SocketService() {
    return _instance;
  }

  late IO.Socket _socket;

  String host = const String.fromEnvironment("wss"); // "http://localhost:3000";
  String? _sessionId;
  // String? _sessionId;

  GetxController? controller;

  Future<void> _loadSession() async {
    _sessionId = await StorageUtils.read("session_id");
  }

  Future<void> _saveSession() async {
    await StorageUtils.write("session_id", _sessionId!);
  }

  static SocketService get instance => _instance;

  static bool isInit = false;

  // Initialize and connect the Socket.IO client
  void initSocket() async {
    await _loadSession();

    _socket = IO.io(host, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      if (_sessionId != null) 'query': {'sessionId': _sessionId}
    });

    _socket.on('connect', (_) {
      print('Connected to Socket.IO server');
      if (_sessionId == null) {
        _sessionId = _socket.id;
        _saveSession();
      }
    });

    _socket.on('roomList', (data) {
      print('roomList $data');
      if (controller is HomeController || Get.currentRoute == "/home") {
        var controller = Get.find<HomeController>();
        controller.roomList(data);
      }
    });

    _socket.on('createRoom', (data) async {
      print('createRoom $data');
      if (data["status"] == "Created" || data["status"] == "Joined") {
        if (controller is HomeController) {
          // Navigate to Game
          socket.emit("joinRoom", data["roomId"]);
          (controller as HomeController).navigateToGame(data["status"]);
        }
      } else {}
    });

    _socket.on('leaveRoom', (data) {
      print('Connected to Socket.IO server');
    });

    _socket.on('joinRoom', (data) async {
      print('joinRoom $data');
      if (data == "Room not Found" || data == "Room is Full") {
        // if (controller is HomeController) {
        //   // Navigate to Game
        //   (controller as HomeController).navigateToGame(data);
        // }
      } else {
        var name = await StorageUtils.read("playerName");
        print("playerName: $name");
        _socket.emit("setPlayerName", name);
      }
    });

    _socket.on("playerRoomList", (data) {
      print("playerRoomList: $data");
      if (controller is BaseGameController) {
        (controller as BaseGameController).playerRoomList(data);
      }
      // print(jsonDecode(data));
    });

    _socket.on('setPlayerName', (data) {
      print('setPlayerName $data');
      _sessionId = data;
      _saveSession();
      if (controller is HomeController || Get.currentRoute == "/home") {
        var controller = Get.find<HomeController>();
        // Navigate to Game
        controller.navigateToGame();
      }
    });

    _socket.on('spectateRoom', (data) {
      print('spectateRoom $data');
      if (data == "Room not Found") {
      } else {
        if (controller is HomeController || Get.currentRoute == "/home") {
          var controller = Get.find<HomeController>();
          // Navigate to Game
          controller.navigateToSpectate();
        }
      }
    });

    _socket.on('onGameInit', (data) {
      print(data.runtimeType);
      // initialData(jsonDecode(data));
      if (controller is BaseGameController) {
        (controller as BaseGameController).initGame(jsonDecode(data));
      }
      socket.emit('onGameInit', "ready");
    });

    _socket.on('onGameReady', (data) {
      Map<String, dynamic> temp = jsonDecode(data);
      temp["ranger"] = jsonDecode(temp["ranger"]);
      if (controller is BaseGameController) {
        (controller as BaseGameController).initPlayer(temp);
      }
    });

    _socket.on('getCard', (data) {
      Map<String, dynamic> temp = jsonDecode(data);
      temp["ranger"] = jsonDecode(temp["ranger"]);
      if (controller is GameController) {
        (controller as GameController).updateCard(temp);
      }
    });

    socket.on("infoAction", (data) async {
      print("infoAction: $data");
      if (!data.contains("Giliran")) {
        Get.snackbar(
          data,
          "",
          backgroundColor: Colors.black,
          borderRadius: 10.0,
          // colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 1),
          snackStyle: SnackStyle.GROUNDED,
          titleText: Text(
            data,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        );
      }
      if (controller is BaseGameController) {
        (controller as BaseGameController).actionHistory.value += "$data\n";
        (controller as BaseGameController).actionHistoryScrollController.jumpTo(
              (controller as BaseGameController).actionHistoryScrollController.position.maxScrollExtent,
            );
      }
    });

    _socket.on("confirmAction", (data) async {
      print("confirmAction: $data");
      if (data.isNotEmpty) {
        data = jsonDecode(data);
      }

      if (controller is GameController) {
        final res = await (controller as GameController).confirmAction(data);
        _socket.emit("confirmAction", res);
      }
    });

    _socket.on("finishAction", (data) {
      print("finishAction: $data");
      if (controller is SpectatorController) {
        (controller as SpectatorController).finishAction(jsonDecode(data));
      } else if (controller is GameController) {
        (controller as GameController).finishAction(jsonDecode(data));
      }
    });

    _socket.on("spectatorData", (data) {
      print("spectatorData");
      if (controller is SpectatorController) {
        (controller as SpectatorController).finishAction(data);
      }
    });

    _socket.on("nextTurn", (data) {
      if (controller is BaseGameController) {
        (controller as BaseGameController).nowTurnPlayerId(data);
      }
      if (_sessionId == data) {
        if (controller is BaseGameController) {
          (controller as BaseGameController).isPlayerTurn(true);
          (controller as BaseGameController).notifyTurn();
          print("nextTurn: my turn");
        }
      } else {
        if (controller is BaseGameController) {
          (controller as BaseGameController).isPlayerTurn(false);
          print("nextTurn: not my turn");
        }
      }
    });

    _socket.on("nextTurnName", (data) {
      // gameController.nowTurnPlayerName(data);
      if (controller is BaseGameController) {
        (controller as BaseGameController).nowTurnPlayerName(data);
      }
    });

    _socket.on('onPlayerDefeated', (data) {
      print(data);
      // gameController.notifyDefeated();
      if (controller is BaseGameController) {
        (controller as BaseGameController).notifyDefeated();
      }
    });

    _socket.on('onGameFinish', (data) {
      print(data);
      // gameController.notifyWinner(data);
      if (controller is BaseGameController) {
        (controller as BaseGameController).notifyWinner(data);
      }
    });

    _socket.on('disconnect', (_) {
      print('Disconnected from Socket.IO server');
    });

    _socket.on('message', (data) {
      print('Message from server: $data');
      if (controller is GameController) {
        (controller as GameController).chatHistory.value += "$data\n";
        (controller as GameController).chatHistoryScrollController.jumpTo(
              (controller as GameController).chatHistoryScrollController.position.maxScrollExtent,
            );
      }
    });

    _socket.connect();
    isInit = true;

    html.window.onBeforeUnload.listen((event) {
      // socket.disconnect();
    });
  }

  // Getter for the socket
  IO.Socket get socket => _socket;

  // Method to send a message
  void sendMessage(String message) {
    if (_sessionId == null) {
      initSocket();
    } else {
      print("sendMessage $message");
      _socket.emit('message', message);
    }
  }

  void setController(GetxController? controller) {
    this.controller = controller;
  }

  // HomeController
  void onCreateRoom(String roomId, int playerNum, bool mode) {
    Map<String, dynamic> data = {
      "roomId": roomId,
      "playerNum": playerNum,
      "mode": mode,
    };
    _socket.emit("createRoom", data);
  }

  // BaseGameController

  // GameController
  void sendCommand(
    Map<String, dynamic> card, {
    Map<String, dynamic>? extraprop,
  }) {
    socket.emit('sendAction', {"card": card, "extraprop": extraprop});
  }

  // SpectatorController
}
