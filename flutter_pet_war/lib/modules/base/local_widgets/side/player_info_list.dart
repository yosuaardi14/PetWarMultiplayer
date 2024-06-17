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
      color: Colors.grey,
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
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            isThreeLine: true,
                            tileColor: e["isDead"] == true
                                ? Colors.grey
                                : controller.nowTurnPlayerId() == e["id"]
                                    ? GF.colorFromString(
                                        jsonDecode(e["ranger"])["color"])
                                    : Colors.white,
                            leading: CircleAvatar(
                              backgroundColor: GF.colorFromString(
                                  jsonDecode(e["ranger"])["color"]),
                            ),
                            textColor: e["isDead"] == true ? Colors.red : null,
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
