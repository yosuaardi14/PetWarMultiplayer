import 'package:flutter_pet_war/core/values/constant.dart';

class CardUtils {
  static Map<String, dynamic> resetCard(Map<String, dynamic> card) {
    return card;
  }

  static Map<String, dynamic> getActionCardById(String id) {
    print(id);
    var ability = id.split("_")[1];
    print(ability);
    Map<String, dynamic> card = Map<String, dynamic>.from(Constant.ACTION[ability]!);
    card["id"] = id;
    card["useSpecial"] = false;
    return card;
  }

  // static Map<String, dynamic> getPetCardById(String id) {
  //   print(id);
  //   var ability = id.split("_")[1];
  //   print(ability);
  //   Map<String, dynamic> card =
  //       Map<String, dynamic>.from(Constant.CANVAS_RANGER[ability]!);
  //   return card;
  // }
}
