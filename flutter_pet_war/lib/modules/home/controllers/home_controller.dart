import 'package:flutter/material.dart';
import 'package:flutter_pet_war/modules/home/local_widgets/create_room_dialog.dart';
import 'package:flutter_pet_war/modules/home/local_widgets/room_list_dialog.dart';
// import 'package:flutter_pet_war/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final statusTxt = "".obs;
  final roomId = "".obs;
  final playerNum = 2.obs;
  final teamMode = false.obs;
  final TextEditingController roomTextController = TextEditingController();

  void showCreateRoomDialog() {
    Get.dialog(const CreateRoomDialog(), barrierDismissible: false);
  }

  void showRoomListDialog() {
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
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
    roomId(room);
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
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }

    switch (type) {
      case "spectate":
        // Get.toNamed(Routes.SPECTATOR);
        break;
      case "join":
        // Get.toNamed(Routes.GAME);
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
}
