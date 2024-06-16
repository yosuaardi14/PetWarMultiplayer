import 'package:flutter_pet_war/modules/game/controllers/game_controller.dart';
import 'package:get/get.dart';

class GameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GameController());
  }
}