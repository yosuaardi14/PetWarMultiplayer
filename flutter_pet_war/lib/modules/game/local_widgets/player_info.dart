import 'package:flutter/material.dart';
import 'package:flutter_pet_war/modules/base/controllers/base_game_firebase_controller.dart';
import 'package:flutter_pet_war/modules/game/controllers/game_controller.dart';
import 'package:flutter_pet_war/modules/game/local_widgets/player/player_canvas_ranger.dart';
import 'package:flutter_pet_war/modules/game/local_widgets/player/player_card_deck.dart';
import 'package:flutter_pet_war/modules/game/local_widgets/player/player_pet.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PlayerInfo extends GetView<BaseGameFirebaseController> {
  const PlayerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: controller.initPlayerFinish()
            ? [
                const PlayerCanvasRanger(),
                const PlayerCardDeck(),
                const PlayerPet(),
              ]
            : [],
      ),
    );
  }
}
