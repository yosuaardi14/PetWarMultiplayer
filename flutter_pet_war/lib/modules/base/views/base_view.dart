import 'package:flutter/material.dart';
import 'package:flutter_pet_war/modules/base/controllers/base_game_controller.dart';
import 'package:flutter_pet_war/modules/base/controllers/base_game_firebase_controller.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/game_background.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/side/action_history.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/side/player_info_list.dart';
import 'package:get/get.dart';

class BaseView<T extends BaseGameFirebaseController> extends GetView<T> {
  final List<Widget>? children;
  const BaseView({super.key, this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameBackground(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // SIDE
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: PlayerInfoList<T>(),
              ),
            ),
            // CHILDREN
            ...?children,
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: ActionHistory<T>(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
