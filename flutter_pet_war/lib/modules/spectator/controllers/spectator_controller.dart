import 'package:flutter_pet_war/data/services/socket_service.dart';
import 'package:flutter_pet_war/modules/base/controllers/base_game_controller.dart';
import 'package:get/get.dart';

class SpectatorController extends BaseGameController {
  final playerSelectedCard = <String, dynamic>{}.obs;
  @override
  void onInit() {
    super.onInit();
    socketService.setController(this);
    checkSocketStatus();
  }

  checkSocketStatus() {
    if (!SocketService.isInit) {
      socketService.initSocket();
    } else {
      socketService.socket.emit("spectatorData", Get.parameters["roomid"]);
    }
  }
}
