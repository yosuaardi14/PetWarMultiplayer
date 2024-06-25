import 'package:flutter_pet_war/modules/base/controllers/base_game_firebase_controller.dart';
import 'package:flutter_pet_war/modules/game/controllers/game_controller.dart';
import 'package:flutter_pet_war/modules/game/controllers/game_firebase_controller.dart';
import 'package:get/get.dart';

class GameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GameController());
    Get.lazyPut(() => GameFirebaseController());
    Get.lazyPut(() => BaseGameFirebaseController());
  }
}
