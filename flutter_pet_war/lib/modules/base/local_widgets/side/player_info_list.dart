import 'package:flutter/material.dart';
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
              if (controller.playerInfoObj.entries.isNotEmpty)
                ...controller.playerInfoObj.entries.map(
                  (e) => SizedBox(
                    width: 200,
                    height: 75,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      isThreeLine: true,
                      tileColor: e.value["isDead"] == true
                          ? Colors.grey
                          : controller.nowTurnPlayerId() == e.value["id"]
                              ? GF.colorFromString(e.value["ranger"]["color"])
                              : Colors.white,
                      leading: CircleAvatar(
                        backgroundColor: GF.colorFromString(e.value["ranger"]["color"]),
                      ),
                      textColor: e.value["isDead"] == true ? Colors.red : null,
                      trailing: Text(
                        "${e.value["life"]}/${e.value["maxLife"]}",
                        style: TextStyle(
                          color: e.value["life"] < 3 ? Colors.red : null,
                        ),
                      ),
                      title: Text(
                        e.value["name"],
                        style: const TextStyle(fontSize: 14),
                      ),
                      subtitle: Text(
                        "${e.value["rangerName"]}\n${e.value["ranger"]["pet"]}",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
