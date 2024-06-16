import 'package:flutter_pet_war/core/utils/circular_queue.dart';
import 'package:flutter_pet_war/core/utils/global_functions.dart';
import 'package:flutter_pet_war/core/values/constant.dart';
import 'package:flutter_pet_war/data/models/player.dart';

class GameUtils {
  static List<Map<String, dynamic>> initActionDeck({bool shuffle = true}) {
    List<Map<String, dynamic>> actionDeck = [];
    for (var action in Constant.ACTION_NEW.values) {
      var actionCard = Map<String, dynamic>.from(action);
      switch (actionCard["name"]) {
        case "Grenade":
        case "Grenade-Mega Grenade":
          actionCard["extraprop"] = {"turn": 0};
          break;
        case "Hide":
        case "Hide-Master Hide":
          actionCard["extraprop"] = {"playerId": -1};
          break;
        case "Shield":
          actionCard["extraprop"] = {"life": 2};
          break;
      }
      var size = 1; //action["cardNum"];
      for (var j = 0; j < size; j++) {
        String cardName = actionCard["name"];
        String normalName = actionCard["name"], specialName = "";
        actionCard["id"] = GF.generateId("action", actionCard);
        if (cardName.contains("-")) {
          normalName = cardName.split("-")[0];
          specialName = cardName.split("-")[1];

          if (actionCard["special"] != null) {
            var specialMap = Map<String, dynamic>.from(actionCard["special"]);
            if (!specialMap.containsKey("name")) {
              specialMap["name"] = specialName;
            }
            actionCard["special"] = specialMap;
          }
          actionCard["name"] = normalName;
        }
        actionCard["useSpecial"] = false;
        actionCard.remove("cardNum");
        actionDeck.add(actionCard);
      }
    }
    if (shuffle) {
      actionDeck.shuffle();
      return actionDeck; //GF.shuffle(actionDeck);
    }
    return actionDeck;
  }

  static CircularQueue<List<Map<String, dynamic>>> initPetDeck(
      List<RxPlayer> playerArr) {
    CircularQueue<List<Map<String, dynamic>>> petDeck = CircularQueue(data: []);
    var jungleSize = 1; //Constant.PET["Jungle"]?["cardNum"] ?? 0;
    for (var i = 0; i < jungleSize; i++) {
      var pet = Map<String, dynamic>.from(Constant.PET["Jungle"]!);
      petDeck.addElement([pet]);
    }
    for (var i = 0; i < playerArr.length; i++) {
      for (var j = 0; j < playerArr[i].maxLife(); j++) {
        var pet = Map<String, dynamic>.from(
            Constant.PET[playerArr[i].ranger["pet"]]!);
        petDeck.addElement([pet]);
      }
    }
    petDeck.shuffleAll();
    return petDeck;
  }

  static int getPlayerIndexByPet(String pet, List<RxPlayer> playerArr) {
    for (var i = 0; i < playerArr.length; i++) {
      if (playerArr[i].ranger["pet"] == pet) {
        return i;
      }
    }
    return -1;
  }

  static bool checkAvailableCardOnPetLine(
      String name, List<List<Map<String, dynamic>>> petLine, int cardPosition) {
    try {
      for (var i = 0; i < petLine[cardPosition].length; i++) {
        if (name == petLine[cardPosition][i]["name"] ||
            (petLine[cardPosition][i]["useSpecial"] == true &&
                name == petLine[cardPosition][i]["special"]["name"])) {
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  static bool checkPlayerNowPet(RxPlayer? player,
      List<List<Map<String, dynamic>>> petLine, int cardPosition) {
    if (player == null) {
      return false;
    }
    return checkAvailableCardOnPetLine(
        player.ranger["pet"], petLine, cardPosition);
    // for (var i = 0; i < petLine[cardPosition].length; i++) {
    //   if (player.ranger["pet"] == petLine[cardPosition][i]["name"]) {
    //     return true;
    //   }
    // }
    // return false;
  }

  static bool petLineHasPet(List<List<Map<String, dynamic>>> petLine) {
    try {
      for (var i = 0; i < petLine.length; i++) {
        for (var j = 0; j < petLine[i].length; j++) {
          if (Constant.PET["Jungle"]?["name"] != petLine[i][j]["name"]) {
            return true;
          }
        }
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static bool petLineHasPlayerNowPet(
      RxPlayer player, List<List<Map<String, dynamic>>> petLine) {
    try {
      for (var i = 0; i < petLine.length; i++) {
        for (var j = 0; j < petLine[i].length; j++) {
          if (player.ranger["pet"] == petLine[i][j]["name"]) {
            return true;
          }
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  static bool checkIsJungle(
      List<List<Map<String, dynamic>>> petLine, int cardPosition) {
    try {
      if (Constant.PET["Jungle"]?["name"] == petLine[cardPosition][0]["name"]) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // static bool checkDiscardPileCard(
  //     Map<String, dynamic> data, List actionUp, List actionDown) {
  //   if (data["name"].contains("Aim") && GF.isListFull(actionUp)) {
  //     return false;
  //   }
  //   if (data["name"].contains("Grenade") && GF.isListFull(actionDown)) {
  //     return false;
  //   }
  //   return true;
  // }

  // static Future<bool> useSpecialAbility(
  //     Map<String, dynamic> data, List actionUp, List actionDown) async {
  //   if (data["special"] != null) {
  //     return await Get.dialog(const SpecialDialog());
  //   }
  //   return false;
  // }

  static WidgetMode onActionDeckTypeCard(controller, int cardIndex) {
    var cardName = controller.playerSelectedCard()["useSpecial"] == true
        ? controller.playerSelectedCard()["special"]["name"]
        : controller.playerSelectedCard()["name"];
    var dragTargetCardList = [
      "Bump Left",
      "Bump Right",
      //
      "Boom",
      "Two Boom",
      "Miss",
      // JS
      "Air Shield"
    ];
    // TODO check
    if (dragTargetCardList.contains(cardName) &&
        controller.aimList[cardIndex] != null) {
      return WidgetMode.dragTarget;
    }
    return WidgetMode.normal;
  }

  static WidgetMode onActionDeckTypeCardEmpty(controller, int cardIndex) {
    var cardName = controller.playerSelectedCard()["useSpecial"] == true
        ? controller.playerSelectedCard()["special"]["name"]
        : controller.playerSelectedCard()["name"];
    var dragTargetCardList = [
      "Aim",
      "Two Aim",
    ];
    if (dragTargetCardList.contains(cardName) &&
        controller.aimList[cardIndex] == null) {
      return WidgetMode.dragTarget;
    }
    return WidgetMode.normal;
  }

  static WidgetMode onDiscardPileLineTypeCard(controller) {
    var cardName = controller.playerSelectedCard()["useSpecial"] == true
        ? controller.playerSelectedCard()["special"]["name"]
        : controller.playerSelectedCard()["name"];
    var dragTargetCardList = [
      "Grenade",
      //Special
      "Mega Grenade",

      "Mine",
      //
      "Mega Mine",
    ];
    if (dragTargetCardList.contains(cardName)) {
      return WidgetMode.dragTarget;
    }
    return WidgetMode.normal;
  }

  static WidgetMode onPetLineTypeCard(controller, int cardIndex) {
    var cardName = controller.playerSelectedCard()["useSpecial"] == true
        ? controller.playerSelectedCard()["special"]["name"]
        : controller.playerSelectedCard()["name"];

    if (!controller.initPlayerFinish()) {
      return WidgetMode.normal;
    }

    var needKamikaze = [
      "Boom",
      "Doom",
    ];

    if (checkAvailableCardOnPetLine(
            "Kamikaze", controller.petLine(), cardIndex) &&
        needKamikaze.contains(cardName)) {
      return WidgetMode.dragTarget;
    }

    var needPetList = [
      "Armor",
      "Hide",

      //Special
      "Shield",
      "Trap",

      // Special II
      "Vampiric Bite", // Need Aim too

      // CA
      "Hypnotize",
    ];

    if (!checkIsJungle(controller.petLine(), cardIndex) &&
        needPetList.contains(cardName)) {
      return WidgetMode.dragTarget;
    }

    var needPlayerPetList = [
      "Go Forward",
      "Go Backward",
      "Get Cover",

      //Special
      "Kamikaze",
      "Escape",
      "Master Hide",
      "Go Anyward",

      //Special II
      "Haunted",
      "Charge",
      "Banzai",
      "Water Bulb"
    ];

    if (checkPlayerNowPet(
            controller.playerObj(), controller.petLine(), cardIndex) &&
        needPlayerPetList.contains(cardName)) {
      return WidgetMode.dragTarget;
    }

    // //check if there is kamikaze boom can be added
    // var dragTargetCardList = [
    //   // "Armor",
    //   "Doom",
    //   // "Hide",

    //   //Special
    //   // "Kamikaze",
    //   // "Escape",
    //   // "Master Hide",
    //   "Over Shock",
    //   // "Shield",
    //   // "Trap",
    //   // "Go Anyward",
    // ];
    // if (dragTargetCardList.contains(cardName)) {
    //   return WidgetMode.dragTarget;
    // }
    var dragTargetCardList = [
      "Air Compressor",
      "Poison Darts", // But the effect pet only
    ];

    if (dragTargetCardList.contains(cardName)) {
      print("onPetDeckTypeCard dragTargetCardList: $cardName");
      return WidgetMode.dragTarget;
    }
    return WidgetMode.normal;
  }

  static WidgetMode onDiscardPileTypeCard(controller) {
    var cardName = controller.playerSelectedCard()["useSpecial"] == true
        ? controller.playerSelectedCard()["special"]["name"]
        : controller.playerSelectedCard()["name"];
    var actionUpList = [
      "Aim",
      "Two Aim",
    ];

    if (GF.isListFull(controller.aimList) && actionUpList.contains(cardName)) {
      return WidgetMode.dragTarget;
    }

    var actionDownList = [
      "Grenade",
      //Special
      "Mega Grenade",
      
      //
      "Mine",
      //
      "Mega Mine"
    ];

    if (GF.isListFull(controller.actionDown) &&
        actionDownList.contains(cardName)) {
      return WidgetMode.dragTarget;
    }

    var needAimList = [
      "Bump Left",
      "Bump Right",
      "Boom",
      // JS
      "Air Shield",
    ];
    if (GF.isListNull(controller.actionUp) && needAimList.contains(cardName)) {
      print("onDiscardPileTypeCard needAimList: $cardName");
      return WidgetMode.dragTarget;
    }

    var needPetList = [
      //   "Hide",
      //   "Armor",
      //   "Shield",
      "Doom",
      // Special
      "Over Shock",
      // Special II
      "Vampiric Bite",
    ];

    if (!petLineHasPet(controller.petLine()) &&
        needPetList.contains(cardName)) {
      print("onPetDeckTypeCard needPetList: $cardName");
      return WidgetMode.dragTarget;
    }

    var needPlayerPetList = [
      "Go Forward",
      "Go Backward",
      "Get Cover",
      //
      "Kamikaze",
      "Master Hide"
          //
          "Charge",
      "Banzai",
      "Water Bulb"
    ];

    if (!petLineHasPlayerNowPet(controller.playerObj(), controller.petLine()) &&
        needPlayerPetList.contains(cardName)) {
      return WidgetMode.dragTarget;
    }

    var dragTargetCardList = [
      "Running",
      "Typhoon",
      "Lunch Time",
      "Move The Pet",
      "Ressurect",
      //Special
      "Double Run",
      "Double Resurrect",

      "Moving Aim",

      // Special II
      "Boo",
      "Avoid",
      "Steal", // ? PetLine
      "Scavenge",
      "Corpse Cover", // ? need check has pet player pet in BackEnd
      "Vampiric Move",

      // US
      "Apocalypse",
      "Voodoo",

      //
      "Illusion",

      //CA
      "Fogging",
      "Machine Gun",
      "Wild", // change the card to be special card immediately - get special card after use card
    ];
    if (dragTargetCardList.contains(cardName)) {
      return WidgetMode.dragTarget;
    }
    return WidgetMode.normal;
  }

  static bool onCheckRessurect(RxPlayer player) {
    return player.life() < player.maxLife();
  }

  static Map<String, dynamic> getRessurectPet(RxPlayer player) {
    return Map<String, dynamic>.from(Constant.PET[player.ranger["pet"]]!);
  }
}
