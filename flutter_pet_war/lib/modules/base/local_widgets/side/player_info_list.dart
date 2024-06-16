import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pet_war/core/utils/global_functions.dart';
import 'package:flutter_pet_war/modules/base/controllers/base_game_controller.dart';
import 'package:get/get.dart';

class PlayerInfoList<T extends BaseGameController> extends GetView<T> {
  const PlayerInfoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 5,
      color: Colors.black,
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.all(3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (controller.playerInfoList().isNotEmpty)
                ...controller.playerInfoList().map(
                      (e) => SizedBox(
                        width: 200,
                        height: 75,
                        child: Obx(
                          () => ListTile(
                            // contentPadding:
                            //     const EdgeInsets.symmetric(horizontal: 5),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 5,
                                color: controller.nowTurnPlayerId() == e["id"]
                                    ? Colors.yellow
                                    : Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            isThreeLine: true,
                            tileColor: e["isDead"] == true
                                ? Colors.grey
                                : Colors.white,
                            // textColor:
                            //     controller.nowTurnPlayerName() == e["name"]
                            //         ? Colors.white
                            //         : null,
                            leading: CircleAvatar(
                              backgroundColor: GF.colorFromString(
                                  jsonDecode(e["ranger"])["color"]),
                            ),
                            trailing: Text(
                              "${e["life"]}/${e["maxLife"]}",
                              style: TextStyle(
                                color: e["life"] < 3 ? Colors.red : null,
                              ),
                            ),
                            title: Text(
                              e["name"],
                              style: const TextStyle(fontSize: 14),
                            ),
                            subtitle: Text(
                              "${e["rangerName"]}\n${jsonDecode(e["ranger"])["pet"]}",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
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
