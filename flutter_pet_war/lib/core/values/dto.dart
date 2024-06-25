import 'package:cloud_firestore/cloud_firestore.dart';

class DTO {
  static Map<String, dynamic> joinRoomData(Map<String, dynamic> playerData) {
    return {
      "log": FieldValue.arrayUnion(["${playerData["name"]} bergabung"]),
      "playerInfoList": {
        playerData["id"]: {
          "id": playerData["id"],
          "name": playerData["name"],
        }
      }
    };
  }

  static Map<String, dynamic> changeGameState(
    Map<String, dynamic> playerData,
    Map<String, dynamic> gameState,
  ) {
    return {
      "state": {
        "name": "confirmAction",
        "turn": playerData["id"],
        "card": {}, //"cardId",
        "extraprop": {
          "line": 0,
          "index": 0,
          "type": "",
        }
      },
    };
  }
}
