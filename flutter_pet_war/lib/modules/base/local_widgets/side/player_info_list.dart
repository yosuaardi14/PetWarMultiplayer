import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pet_war/core/utils/global_functions.dart';
import 'package:flutter_pet_war/modules/base/controllers/base_game_controller.dart';
import 'package:flutter_pet_war/modules/base/controllers/base_game_firebase_controller.dart';
import 'package:get/get.dart';

class PlayerInfoList<T extends BaseGameFirebaseController> extends GetView<T> {
  const PlayerInfoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 5,
      color: Colors.grey,
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.all(3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (controller.playerInfoObj.entries.isNotEmpty &&
                  controller.initPlayerInfoFinish() &&
                  controller.playerIdArr.isNotEmpty)
                for (var playerId in controller.playerIdArr())
                  SizedBox(
                    width: 200,
                    height: 75,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      isThreeLine: true,
                      tileColor: controller.playerInfoObj[playerId]["isDead"] == true
                          ? Colors.grey
                          : controller.nowTurnPlayerId() == controller.playerInfoObj[playerId]["id"]
                              ? GF.colorFromString(controller.playerInfoObj[playerId]["ranger"]["color"])
                              : Colors.white,
                      // leading: CircleAvatar(
                      //   backgroundColor: GF.colorFromString(controller.playerInfoObj[playerId]["ranger"]["color"]),
                      // ),
                      textColor: controller.playerInfoObj[playerId]["isDead"] == true ? Colors.red : null,
                      // trailing: Text(
                      //   "${controller.playerInfoObj[playerId]["life"]}/${controller.playerInfoObj[playerId]["maxLife"]}",
                      //   style: TextStyle(
                      //     color: controller.playerInfoObj[playerId]["life"] < 3 ? Colors.red : null,
                      //   ),
                      // ),
                      title: Text(
                        controller.playerInfoObj[playerId]["name"] + (controller.hostId() == playerId ? " (Host)" : ""),
                        style: const TextStyle(fontSize: 14),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${controller.playerInfoObj[playerId]["rangerName"]} - ${controller.playerInfoObj[playerId]["ranger"]["pet"]}",
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: List.generate(
                              controller.playerInfoObj[playerId]["maxLife"],
                              (index) => Container(
                                decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                                child: index <= (controller.playerInfoObj[playerId]["life"] - 1)
                                    ? Icon(
                                        Icons.circle,
                                        color: GF.colorFromString(
                                          controller.playerInfoObj[playerId]["ranger"]["color"],
                                        ),
                                      )
                                    : const Icon(
                                        Icons.close,
                                      ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
              // ...controller.playerInfoObj.entries.map(
              //   (e) => SizedBox(
              //     width: 200,
              //     height: 75,
              //     child: ListTile(
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(6),
              //       ),
              //       isThreeLine: true,
              //       tileColor: e.value["isDead"] == true
              //           ? Colors.grey
              //           : controller.nowTurnPlayerId() == e.value["id"]
              //               ? GF.colorFromString(e.value["ranger"]["color"])
              //               : Colors.white,
              //       leading: CircleAvatar(
              //         backgroundColor: GF.colorFromString(e.value["ranger"]["color"]),
              //       ),
              //       textColor: e.value["isDead"] == true ? Colors.red : null,
              //       trailing: Text(
              //         "${e.value["life"]}/${e.value["maxLife"]}",
              //         style: TextStyle(
              //           color: e.value["life"] < 3 ? Colors.red : null,
              //         ),
              //       ),
              //       title: Text(
              //         e.value["name"],
              //         style: const TextStyle(fontSize: 14),
              //       ),
              //       subtitle: Text(
              //         "${e.value["rangerName"]}\n${e.value["ranger"]["pet"]}",
              //         style: const TextStyle(
              //           fontSize: 12,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
