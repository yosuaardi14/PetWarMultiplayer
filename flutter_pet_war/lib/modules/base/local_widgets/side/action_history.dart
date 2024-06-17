import 'package:flutter/material.dart';
import 'package:flutter_pet_war/modules/base/controllers/base_game_controller.dart';
import 'package:get/get.dart';

class ActionHistory<T extends BaseGameController> extends GetView<T> {
  const ActionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0.0),
      child: Card(
        // elevation: 5,
        color: Colors.grey.withOpacity(0.5),
        child: SizedBox(
          width: 200,
          height: 75 * 3,
          child: Obx(
            () => ListView(
              controller: controller.actionHistoryScrollController,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("object");
                    controller.showCatalog();
                  },
                  child: const Text("Katalog Kartu"),
                ),
                const Text(
                  "History",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                ...controller.playerRoomList().entries.map(
                      (e) => Text(
                        e.value + " bergabung",
                        style:
                            const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                const Divider(),
                ...controller.actionHistory().split("\n").map(
                      (e) => Text(
                        e,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
