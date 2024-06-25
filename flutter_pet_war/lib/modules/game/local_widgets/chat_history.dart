import 'package:flutter/material.dart';
import 'package:flutter_pet_war/modules/game/controllers/game_controller.dart';
import 'package:get/get.dart';

class ChatHistory extends GetView<GameController> {
  const ChatHistory({super.key});

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
            () => Column(
              // controller: controller.chatHistoryScrollController,
              children: [
                const Text(
                  "Chat",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                ),
                Expanded(
                  child: ListView(
                    controller: controller.chatHistoryScrollController,
                    children: [
                      ...controller.chatHistory().split("\n").map(
                            (e) => Text(
                              e,
                              style: const TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: controller.chatTextController,
                    onSubmitted: (_) {
                      controller.sendMessage();
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: controller.sendMessage,
                        icon: const Icon(Icons.send),
                      ),
                    ),
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
