import 'package:flutter/material.dart';
import 'package:flutter_pet_war/core/values/constant.dart';
import 'package:flutter_pet_war/data/models/card/pet.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/card/pet_card.dart';
import 'package:flutter_pet_war/modules/game/controllers/game_controller.dart';
import 'package:get/get.dart';

class PlayerPet extends GetView<GameController> {
  const PlayerPet({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          SizedBox(
            child: Stack(
              children: [
                PetCard(
                  pet: Pet.fromJson(
                    Constant.PET[controller.playerObj().ranger["pet"]]!,
                  ),
                  playerCard: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 5),
                  child: Text(
                    "${controller.playerObj().life}/${controller.playerObj().maxLife}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
