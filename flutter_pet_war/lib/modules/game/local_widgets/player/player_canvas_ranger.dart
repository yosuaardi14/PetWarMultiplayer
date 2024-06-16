import 'package:flutter/material.dart';
import 'package:flutter_pet_war/data/models/card/canvas_ranger.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/card/canvas_ranger_card.dart';
import 'package:flutter_pet_war/modules/game/controllers/game_controller.dart';
import 'package:get/get.dart';

class PlayerCanvasRanger extends GetView<GameController> {
  const PlayerCanvasRanger({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CanvasRangerCard(
          playerCard: true,
          canvasRanger: CanvasRanger.fromJson(controller.playerObj().ranger),
        ),
      ],
    );
  }
}
