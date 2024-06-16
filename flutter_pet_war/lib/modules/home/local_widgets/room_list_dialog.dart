import 'package:flutter/material.dart';
import 'package:flutter_pet_war/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class RoomListDialog extends GetView<HomeController> {
  // final Map<String, dynamic> roomList;
  const RoomListDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white.withAlpha(225),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Daftar Room"),
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      content: SizedBox(
        width: Get.width,
        child: Obx(
          () => Column(
            children: [
              ElevatedButton(
                onPressed: controller.onRefreshRoom,
                child: const Text("Refresh"),
              ),
              ...controller.roomList().entries.map(
                    (e) => roomWidget(e.value),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  Widget roomWidget(Map<String, dynamic> roomData) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(roomData["id"] ?? "Test"),
        subtitle: Text(
          "${roomData["num"] ?? 0}/${roomData["maxNum"] ?? 6}",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if ((roomData["num"] ?? 0) < (roomData["maxNum"] ?? 6))
              Container(
                width: 100,
                height: 50,
                color: Colors.blue,
                child: ElevatedButton(
                  onPressed: () {
                    controller.onJoinRoom(roomData["id"] ?? "");
                  },
                  child: const Text("Gabung"),
                ),
              ),
            const SizedBox(width: 10),
            Container(
              width: 100,
              height: 50,
              color: Colors.blue,
              child: ElevatedButton(
                onPressed: () {
                  controller.onSpectateRoom(roomData["id"] ?? "");
                },
                child: const Text("Tonton"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
