class CanvasRanger {
  String name;
  String description;
  String pet;
  String color;
  int cardNum;

  CanvasRanger({
    required this.name,
    this.description = "",
    required this.pet,
    this.color = "",
    this.cardNum = 1,
  });

  factory CanvasRanger.fromJson(Map<String, dynamic> data) {
    return CanvasRanger(
      name: data["name"],
      description: data["description"],
      pet: data["pet"],
      color: data["color"],
      cardNum: data["cardNum"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "pet": pet,
      "color": color,
      "cardNum": cardNum
    };
  }
}
