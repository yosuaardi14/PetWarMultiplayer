class SpecialAbility {
  String name;
  String description;
  String color;
  String ranger;
  String ability;

  SpecialAbility({
    required this.name,
    this.description = "",
    this.color = "",
    required this.ranger,
    required this.ability,
  });

  factory SpecialAbility.fromJson(Map<String, dynamic> data) {
    return SpecialAbility(
      name: data["name"],
      description: data["description"],
      color: data["color"],
      ranger: data["ranger"],
      ability: data["ability"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "color": color,
      "ranger": ranger,
      "ability": ability
    };
  }
}
