import 'package:flutter_pet_war/data/services/socket_service.dart';
import 'package:flutter_pet_war/modules/base/controllers/base_game_controller.dart';

class SpectatorController extends BaseGameController {
  @override
  void onInit() {
    super.onInit();
    socketService.setController(this);
    checkSocketStatus();
  }

  checkSocketStatus() {
    if (!SocketService.isInit) {
      socketService.initSocket();
    }
    socketService.socket.emit("spectatorData", "");
  }
}
