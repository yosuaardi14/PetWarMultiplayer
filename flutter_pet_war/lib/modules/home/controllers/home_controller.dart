import 'package:flutter/material.dart';
import 'package:flutter_pet_war/data/services/socket_service.dart';
import 'package:flutter_pet_war/modules/home/local_widgets/create_room_dialog.dart';
import 'package:flutter_pet_war/modules/home/local_widgets/room_list_dialog.dart';
import 'package:flutter_pet_war/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final socketService = SocketService.instance;
  // Create Room
  final statusTxt = "".obs;
  final roomId = "".obs;
  final playerNum = 2.obs;
  final teamMode = false.obs;
  final TextEditingController roomTextController = TextEditingController();

  // Room List
  final roomList = <String, dynamic>{}.obs;

  @override
  void onInit() {
    super.onInit();
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

  void showCreateRoomDialog() {
    Get.dialog(const CreateRoomDialog(), barrierDismissible: false);
  }

  void showRoomListDialog() {
    onRefreshRoom();
    Get.dialog(const RoomListDialog(), barrierDismissible: false);
  }

  void onCreateRoom() {
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
    socketService.onCreateRoom(roomId(), playerNum(), teamMode());
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }

  void onRefreshRoom() {
    socketService.socket.emit("roomList", "");
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

  void onSelectRoom(String roomId, String type) {
    this.roomId(roomId);
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }

    switch (type) {
      case "spectate":
        // Get.toNamed(Routes.SPECTATOR);
        socketService.socket.emit("spectateRoom", roomId);
        break;
      case "join":
        // Get.toNamed(Routes.GAME);
        socketService.socket.emit("joinRoom", roomId);
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
