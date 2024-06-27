import 'package:flutter_pet_war/core/values/constant.dart';
import 'package:flutter_pet_war/modules/base/controllers/base_game_firebase_controller.dart';

class BaseAbilityUtils {
  static onAimMove(BaseGameFirebaseController controller, bool condition, int targetIndex, int indexVal) {
    // check is 0 < index < 5
    // check is empty
    if (condition) {
      // TWO AIM TAIL
      if (controller.actionUp[targetIndex] == null && controller.aimList[targetIndex] == true) {
        if ((targetIndex + indexVal - 1) < 0 || (targetIndex + indexVal) > 5) {
          return;
        }
        print("onAimMove");

        var aimCard = controller.actionUp[targetIndex - 1];
        var targetPosAim = targetIndex + indexVal - 1;
        var targetPosTail = targetIndex + indexVal;
        print("onAimMove(A,T): $targetPosAim,$targetPosTail");
        if (indexVal < 0) {
          // -1
          if (controller.actionUp[targetPosAim] == null && controller.aimList[targetPosAim] == null) {
            print("onAimMove");
            controller.aimList[targetIndex] = null;
            controller.actionUp[targetIndex - 1] = null;

            controller.aimList[targetPosAim] = true;
            controller.aimList[targetPosTail] = true;
            controller.actionUp[targetPosAim] = aimCard;
          }
        } else {
          // 1
          if (controller.actionUp[targetPosTail] == null && controller.aimList[targetPosTail] == null) {
            print("onAimMove");
            controller.aimList[targetIndex - 1] = null;
            controller.actionUp[targetIndex - 1] = null;
            controller.aimList[targetPosAim] = true;
            controller.aimList[targetPosTail] = true;
            controller.actionUp[targetPosAim] = aimCard;
          }
        }
      } else if (controller.actionUp[targetIndex] != null &&
          controller.actionUp[targetIndex]?["name"] == Constant.ACTION["TwoAims"]?["name"] &&
          controller.actionUp[targetIndex]?["block"] == 2) {
        var aimCard = controller.actionUp[targetIndex];
        var targetPosAim = targetIndex + indexVal;
        var targetPosTail = targetIndex + indexVal + 1;
        print("onAimMove(A,T): $targetPosAim,$targetPosTail");
        if (indexVal < 0) {
          // -1
          if (controller.actionUp[targetPosAim] == null && controller.aimList[targetPosAim] == null) {
            print("onAimMove");
            controller.aimList[targetIndex] = null;
            controller.aimList[targetIndex + 1] = null;
            controller.actionUp[targetIndex] = null;

            controller.aimList[targetPosAim] = true;
            controller.aimList[targetPosTail] = true;
            controller.actionUp[targetPosAim] = aimCard;
          }
        } else {
          // 1
          if (controller.actionUp[targetPosTail] == null && controller.aimList[targetPosTail] == null) {
            print("onAimMove");
            controller.aimList[targetIndex] = null;
            controller.actionUp[targetIndex] = null;
            controller.aimList[targetPosAim] = true;
            controller.aimList[targetPosTail] = true;
            controller.actionUp[targetPosAim] = aimCard;
          }
        }
      } else {
        if (controller.actionUp[targetIndex + indexVal] == null && controller.aimList[targetIndex + indexVal] == null) {
          // move
          var aimCard = controller.actionUp[targetIndex];
          controller.aimList[targetIndex] = null;
          controller.aimList[targetIndex + indexVal] = true;
          controller.actionUp[targetIndex] = null;
          controller.actionUp[targetIndex + indexVal] = aimCard;
        }
      }
    }
  }

  static addCardToPetFront(
    BaseGameFirebaseController controller,
    Map<String, dynamic> card,
    Map<String, dynamic>? extraprop,
  ) {
    if (extraprop != null) {
      var index = extraprop["index"] ?? -1;
      if (index != -1) {
        controller.petDeckNew()[index].insert(0, card);
      }
    } else {
      controller.discardPilePerTurn.add(card);
    }
  }

  static onPetGo(BaseGameFirebaseController controller, bool condition, int targetIndex, int indexVal) {
    var useSpecialAbility = controller.petDeckNew[targetIndex][0]["useSpecial"] == true;
    var isSpecialCard = controller.petDeckNew[targetIndex][0]["special"] != null;
    var specialCardName = isSpecialCard ? controller.petDeckNew[targetIndex][0]["special"]["name"] : "";
    var isTrap =
        useSpecialAbility && isSpecialCard && (specialCardName == Constant.ACTION["Aim-Trap"]?["special"]["name"]);

    if (isTrap) {
      print("Tidak bisa bergerak karena ada Trap");
      return;
    }
    // print("onPetGo condition:" + condition);
    if (condition) {
      var petCard = controller.petDeckNew[targetIndex]; //[targetIndex];

      var startIndex = -1;
      var endIndex = -1;
      // var selectedCard
      if ((targetIndex + indexVal) < targetIndex) {
        // Forward (-)
        startIndex = targetIndex;
        endIndex = targetIndex + indexVal;
        for (var i = startIndex; i > endIndex; i--) {
          var tempPet = controller.petDeckNew[i - 1];
          controller.petDeckNew[i] = tempPet;
        }
      } else {
        // Backward (+)
        startIndex = targetIndex; // 3
        endIndex = targetIndex + indexVal; // 5
        for (var i = startIndex; i < endIndex; i++) {
          var tempPet = controller.petDeckNew[i + 1];
          controller.petDeckNew[i] = tempPet;
        }
      }
      controller.petDeckNew[endIndex] = petCard;
    }
  }

  static onDestroyPet(BaseGameFirebaseController controller, int targetIndex) {}

  static onCover(BaseGameFirebaseController controller, int index, int targetIndex) {
    if (targetIndex != -1) {
      if (controller.petDeckNew()[targetIndex].first != Constant.PET["Forest"]?["name"]) {
        var tempPet = controller.petDeckNew()[index];
        controller.petDeckNew[targetIndex].addAll(tempPet);
        controller.petDeckNew().removeAt(index);
      }
    }
  }
}
