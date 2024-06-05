import 'package:get/get.dart';

class Player {
  String id;
  String name;
  Map<String, dynamic> ranger;
  late List<Map<String, dynamic>> cardDeck;
  int maxLife;
  late int life;
  late bool isDead;
  late String rangerName;

  Player({
    required this.id,
    required this.name,
    required this.ranger,
    required this.maxLife,
  }) {
    rangerName = ranger["name"];
    life = maxLife;
    isDead = false;
    cardDeck = [];
  }

  void setCardDeck(List<Map<String, dynamic>> cardDeck) {
    this.cardDeck = cardDeck;
  }

  void setRanger(Map<String, dynamic> data) {
    ranger = data;
    rangerName = ranger["name"];
  }

  factory Player.fromJson(Map<String, dynamic> data) {
    return Player(
      id: data["id"],
      name: data["name"],
      ranger: data["ranger"],
      maxLife: data["maxLife"],
    );
  }
}

class RxPlayer {
  final name = "".obs;
  final ranger = <String, dynamic>{}.obs;
  final cardDeck = <Map<String, dynamic>>[].obs;
  final maxLife = 0.obs;
  final life = 0.obs;
  final isDead = false.obs;
  final rangerName = "".obs;

  RxPlayer();

  RxPlayer copy(Player player) {
    name.value = player.name;
    ranger.value = player.ranger;
    cardDeck.value = player.cardDeck;
    maxLife.value = player.maxLife;
    life.value = player.life;
    isDead.value = player.isDead;
    rangerName.value = player.rangerName;
    return this;
  }

  void setCardDeck(List<Map<String, dynamic>> cardDeck) {
    this.cardDeck.value = cardDeck;
  }

  void setRanger(Map<String, dynamic> data) {
    ranger.value = data;
    rangerName.value = ranger()["name"];
  }

  void updateLife(Map<String, dynamic> data) {
    maxLife.value = data["maxLife"];
    life.value = data["life"];
    isDead.value = data["isDead"];
  }

  void setFromJson(Map<String, dynamic> data) {
    name.value = data["name"];
    ranger.value = data["ranger"] ?? {};
    cardDeck.value = data["cardDeck"] ?? [];
    maxLife.value = data["maxLife"];
    life.value = data["life"];
    isDead.value = data["isDead"];
    rangerName.value = data["rangerName"] ?? "";
  }

  factory RxPlayer.fromJson(Map<String, dynamic> data) {
    var instance = RxPlayer();
    instance.name.value = data["name"];
    instance.maxLife.value = data["maxLife"];
    instance.life.value = data["life"];
    instance.isDead.value = data["isDead"];
    return instance;
  }
}
