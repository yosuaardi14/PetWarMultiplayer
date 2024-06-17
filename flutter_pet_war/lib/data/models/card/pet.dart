class Pet {
  String name;
  String description;
  String color;
  String ranger;
  int life;
  int cardNum;
  Map<String, dynamic>? extraprop;

  Pet({
    required this.name,
    this.description = "",
    this.color = "",
    this.life = 0,
    required this.ranger,
    this.cardNum = 1,
  });

  void setExtraProp(extraprop) {
    this.extraprop = extraprop;
  }

  void clearExtraProp() {
    extraprop = null;
  }

  factory Pet.fromJson(Map<String, dynamic> data) {
    return Pet(
      name: data["name"],
      description: data["description"],
      color: data["color"],
      ranger: data["ranger"],
      life: data["life"],
      cardNum: data["cardNum"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "color": color,
      "ranger": ranger,
      "life": life,
      "cardNum": cardNum
    };
  }
}
