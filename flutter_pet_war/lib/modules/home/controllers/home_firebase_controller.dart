import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet_war/core/utils/global_functions.dart';
import 'package:flutter_pet_war/core/utils/storage_utils.dart';
import 'package:flutter_pet_war/core/values/constant.dart';
import 'package:flutter_pet_war/core/values/dto.dart';
import 'package:flutter_pet_war/data/services/firestore_service.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/dialog/info_dialog.dart';
import 'package:flutter_pet_war/modules/home/local_widgets/create_room_dialog.dart';
import 'package:flutter_pet_war/modules/home/local_widgets/room_list_dialog.dart';
import 'package:flutter_pet_war/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeFirebaseController extends GetxController {
  // final socketService = SocketService.instance;
  final firestoreService = FirestoreService();
  // Create Room
  final statusTxt = "".obs;
  final roomId = "".obs;
  final playerNum = 2.obs;
  final teamMode = false.obs;
  final TextEditingController roomTextController = TextEditingController();
  final playerData = <String, dynamic>{}.obs;

  // Room List
  final roomList = <String, dynamic>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void transferData() async {
    Map<String, dynamic> data = {};
    for (var i = 0; i < Constant.CANVAS_RANGER.length; i++) {
      data[Constant.CANVAS_RANGER[i]["name"]] = Constant.CANVAS_RANGER[i];
    }
    await firestoreService.addData("card", "canvas_ranger", data);
  }

  void loadData() async {
    Map<String, dynamic> player = await GF.loadPlayerData();
    playerData(player);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void showCreateRoomDialog() {
    Get.dialog(const CreateRoomDialog(), barrierDismissible: false);
  }

  void showRoomListDialog() {
    onRefreshRoom();
    Get.dialog(const RoomListDialog(), barrierDismissible: false);
  }

  void onCreateRoom() async {
    statusTxt.value = "";
    if (roomTextController.text.isEmpty) {
      statusTxt.value = "Room ID tidak boleh kosong";
      return;
    }

    String room = roomTextController.text;
    if (room.length > 14) {
      room = room.substring(0, 13);
    }
    roomId(room);
    Map<String, dynamic> data = {
      "id": roomId(),
      "host": playerData()["id"],
      "maxNum": playerNum(),
      "status": "WAITING",
      "teammode": teamMode(),
      "playerInfoList": {
        playerData()["id"]: {
          "id": playerData()["id"],
          "name": playerData()["name"],
        }
      }
    };

    await firestoreService.addData("room", roomId(), data);
    // socketService.onCreateRoom(roomId(), playerNum(), teamMode());
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }

  void onRefreshRoom() async {
    // socketService.socket.emit("roomList", "");
    final rooms = await firestoreService.getCollection("room");
    for (var room in rooms) {
      if (room != null) {
        roomList[room["id"]] = room;
      }
    }

    roomList();
  }

  void onChangePlayerNum(int? value) {
    if (value != null) {
      playerNum(value);
    }
  }

  void onChangeMode(bool? value) {
    if (value != null) {
      teamMode(value);
      playerNum(4);
    }
  }

  void onSelectRoom(String roomId, String type) async {
    this.roomId(roomId);
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }

    switch (type) {
      case "spectate":
        // Get.toNamed(Routes.SPECTATOR);
        // socketService.socket.emit("spectateRoom", roomId);
        Get.dialog(const InfoDialog(text: "Under Development"));
        break;
      case "join":
        // Get.toNamed(Routes.GAME);
        // socketService.socket.emit("joinRoom", roomId);
        Map<String, dynamic> data = DTO.joinRoomData(playerData());
        try {
          await firestoreService.updateData("room", roomId, data);
          Get.toNamed(Routes.GAME, parameters: {"roomId": roomId});
        } catch (e) {
          print("Error when Join");
        }
        break;
      default:
        print("Not Found");
    }
  }

  void onSpectateRoom(String roomId) {
    onSelectRoom(roomId, "spectate");
  }

  void onJoinRoom(String roomId) {
    onSelectRoom(roomId, "join");
  }

  void navigateToGame([String data = ""]) {
    Get.offNamed(
      Routes.GAME,
      arguments: data == "Created",
      parameters: {
        "roomid": roomId(),
      },
    );
  }

  void navigateToSpectate() {
    Get.offNamed(
      Routes.SPECTATOR,
      parameters: {
        "roomid": roomId(),
      },
    );
  }
}
