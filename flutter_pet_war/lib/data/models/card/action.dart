import 'package:flutter_pet_war/data/models/card/special_ability.dart';

class ActionModel {
  String id;
  String name;
  String description;
  String color;
  String ability;
  int cardNum;
  int block;
  bool useSpecial;
  SpecialAbility? special;
  Map<String, dynamic>? extraprop;

  ActionModel({
    required this.id,
    required this.name,
    this.description = "",
    this.color = "",
    required this.ability,
    this.cardNum = 1,
    this.block = 1,
    this.special,
    this.useSpecial = false,
  });

  void setExtraProp(extraprop) {
    this.extraprop = extraprop;
  }

  void clearExtraProp() {
    extraprop = null;
  }

  factory ActionModel.fromJson(Map<String, dynamic> data) {
    SpecialAbility? specialAbility;
    if (data["special"] != null) {
      specialAbility = SpecialAbility.fromJson(data["special"]);
    }
    return ActionModel(
      id: data["id"] ?? "",
      name: data["name"], //normalName,
      description: data["description"],
      color: data["color"],
      ability: data["ability"],
      cardNum: data["cardNum"] ?? 1,
      block: data["block"] ?? 1,
      special: specialAbility,
      useSpecial: data["useSpecial"] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "color": color,
      "cardNum": cardNum,
      "block": block,
      "ability": ability,
      "special": special?.toJson(),
      "useSpecial": useSpecial,
    };
  }
}
