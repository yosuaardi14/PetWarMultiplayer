import 'package:flutter/material.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/card_canvas.dart';
import 'package:flutter_pet_war/modules/base/views/base_view.dart';
import 'package:flutter_pet_war/modules/game/controllers/game_controller.dart';
import 'package:flutter_pet_war/modules/game/local_widgets/chat_history.dart';
import 'package:get/get.dart';

class GameView extends GetView<GameController> {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<GameController>(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: CardCanvas<GameController>(isSpectate: false),
        ),
        const Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(top: 325.0),
            child: ChatHistory(),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Obx(
            () => Visibility(
              visible: controller.timerTxt() > 0,
              child: Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.timer,
                    size: 100,
                    color: Colors.black,
                  ),
                  title: Text(
                    "${controller.timerTxt()}",
                    style: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
