import 'package:flutter/material.dart';
import 'package:flutter_pet_war/data/services/socket_service.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/card_canvas.dart';
import 'package:flutter_pet_war/modules/base/views/base_view.dart';
import 'package:flutter_pet_war/modules/spectator/controllers/spectator_controller.dart';
import 'package:get/get.dart';

class SpectatorView extends GetView<SpectatorController> {
  const SpectatorView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.checkSocketStatus();
    return BaseView<SpectatorController>(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: CardCanvas<SpectatorController>(isSpectate: true),
        ),
      ],
    );
  }
}
