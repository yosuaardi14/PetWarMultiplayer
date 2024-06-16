import 'package:flutter_pet_war/modules/spectator/controllers/spectator_controller.dart';
import 'package:get/get.dart';

class SpectatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SpectatorController());
  }
}
