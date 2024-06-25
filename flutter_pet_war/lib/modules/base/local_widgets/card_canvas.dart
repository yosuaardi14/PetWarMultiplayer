import 'package:flutter/material.dart';
import 'package:flutter_pet_war/modules/base/controllers/base_game_controller.dart';
import 'package:flutter_pet_war/modules/base/controllers/base_game_firebase_controller.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/line/action_deck_line.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/line/discard_pile_line.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/line/pet_deck_line.dart';
import 'package:flutter_pet_war/modules/game/local_widgets/player_info.dart';
import 'package:get/get.dart';

class CardCanvas<T extends BaseGameFirebaseController> extends GetView<T> {
  final bool isSpectate;
  final ScrollController? scrollController;
  const CardCanvas({super.key, this.scrollController, this.isSpectate = false});

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        ActionDeckLine<T>(),
        const SizedBox(height: 10),
        PetDeckLine<T>(),
        DiscardPileLine<T>(),
        if (!isSpectate) const PlayerInfo(),
      ],
    );
  }
}
