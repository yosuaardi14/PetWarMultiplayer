// ignore_for_file: constant_identifier_names

enum WidgetMode { normal, draggable, dragTarget }

class Constant {
  static const double CARD_WIDTH = 116.0; //150.0;
  static const double PET_CARD_HEIGHT = 176.0;
  static const double CARD_HEIGHT = 176.0; //180.0;
  static const double FONT_SIZE = 12.0;

  static const double ACTION_FONT_SIZE = 11.0;

  static const double PLAYER_FONT_SIZE = 11.0;
  static const double PLAYER_CARD_WIDTH = 110.0;
  static const double PLAYER_CARD_HEIGHT = 120.0;

  static const int DEFAULT_MAX_LIFE = 5;
  static const int GRENADE_TURN = 4;
  static const int KING_MAX_TOKEN = 4;
  static const int POISON_DART_TURNS = 3;
  static const int ACTIVATION_CANVAS_COST = 2;

  static const String MENEJEUR = "Menejeur";
  static const String JUNGLE = "Jungle";
  static const String FOREST = "Forest";
  static const String ENCHANTED_FOREST = "Enchanted Forest";
  static const String MAZE_FOREST = "Maze Forest";
  static const String THORN_FOREST = "Thorn Forest";
  static const String CURSED_FOREST = "Cursed Forest";
  static const String CATAPULT_FOREST = "Catapult Forest";
  static const String HIDE = "Hide";
  static const String ARMOR = "Armor";
  static const String TRAP = "Trap";
  static const String SHIELD = "Shield";
  static const String KAMIKAZE = "Kamikaze";
  static const String CHARGE = "Charge";
  static const String WATER_BULB = "Water Bulb";

  static const List<String> CANVAS_TEXT = ["CANVAS", "RANGER", "PETWAR"];
  static const List<String> DECK_TEXT = ["Action\nDeck", "Pet\nDeck", "Discard\nPile"];

  static const List<String> DISCARD_PILE_TYPE_CARD = [
    "Running",
    "Typhoon",
    "Lunch Time",
    "Move The Pet",
    "Resurrect",
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

    // JS
    "Illusion",

    // CA
    "Fogging",
    "Machine Gun",
    "Wild",
  ];

  static const List<Map<String, dynamic>> CANVAS_RANGER = [
    {
      "name": "Dobel",
      "description":
          "Ixora & Ixano, (known as \"Dobel\") are the owner of \"Sharpnell\" that has the ability of speed. They'll reach the safety zone in no time.",
      "pet": "Sharpnell",
      "color": "orange",
      "cardNum": 1,
      "type": "Pet War"
    },
    {
      "name": "Tsunaryo",
      "description":
          "\"Tsuna\" is the owner of \"LPG-Zord\" that has the ability of explosion. It/he can kill more than one pet in one action.",
      "pet": "LPG-Zord",
      "color": "yellowgreen",
      "cardNum": 1,
      "type": "Pet War"
    },
    {
      "name": "Vonstaire",
      "description":
          "\"Vonstaire\" is the owner of \"Sunge\" that has the abilities to escape and resurrect. Prepare to face them again, and again, and again...",
      "pet": "Sunge",
      "color": "deeppink",
      "cardNum": 1,
      "type": "Pet War"
    },
    {
      "name": "Ashtray",
      "description":
          "\"Ashtray\" is the owner of \"Minion\" that has the ability to disturb the other pet(s). Minion is the most annoying pet in this game.",
      "pet": "Minion",
      "color": "red",
      "cardNum": 1,
      "type": "Pet War"
    },
    {
      "name": "Bonci",
      "description":
          "\"Bonci\" is the owner of \"Waung\" that has the ability to survive. One attack is not enough to get rid of them.",
      "pet": "Waung",
      "color": "deepblue",
      "cardNum": 1,
      "type": "Pet War"
    },
    {
      "name": "Neo",
      "description":
          "\"Neo\" is the owner of \"Paleo\" that has the ability to kill another pet with its/his super power!",
      "pet": "Paleo",
      "color": "deeppurple",
      "cardNum": 1,
      "type": "Pet War"
    },
    {
      "name": "Daiya",
      "description":
          "\"Daiya\" is the owner of \"Soeharti\", their ability is to manipulate the pet line to create the worst scenario of their opponent.",
      "pet": "Soeharti",
      "color": "yellow",
      "cardNum": 1,
      "type": "Pet War II"
    },
    {
      "name": "Elliot",
      "description":
          "\"Elliot\" is the owner of \"Marmar\", their abilities are to steal other pet's protection and discard aims.",
      "pet": "Marmar",
      "color": "lightgreen",
      "cardNum": 1,
      "type": "Pet War II"
    },
    {
      "name": "Rei",
      "description":
          "\"Rei\" is the owner of \"Giro\", their ability is gear charge. They can use charge to kill more than one pet in one action.",
      "pet": "Giro",
      "color": "green",
      "cardNum": 1,
      "type": "Pet War II"
    },
    {
      "name": "Javelin",
      "description":
          "\"Javelin\" is the owner of \"Vulcan\", their abilities are to scavenge the discard pile and the dead pet.",
      "pet": "Vulcan",
      "color": "brown",
      "cardNum": 1,
      "type": "Pet War II"
    },
    {
      "name": "Louise",
      "description":
          "\"Louise\" is the owner of \'King\", their ability is to jump over. King has a dead penalty after three rounds, however he can flee and kill with ease.",
      "pet": "King",
      "color": "blue",
      "cardNum": 1,
      "type": "Pet War II"
    },
    {
      "name": "Bracula",
      "description":
          "\"Bracula\" is the owner of \"Bratz\", their ability is vampiric skill that allows him to absorb other pet's life.",
      "pet": "Bratz",
      "color": "lightpurple",
      "cardNum": 1,
      "type": "Pet War II"
    },
    {
      "name": "Gaoh",
      "description":
          "\"Gaoh\" is the leader of villains and owner of \"Vao\". Their ability is to spread fear with voodoo magic.",
      "pet": "Vao",
      "color": "black",
      "cardNum": 1,
      "type": "Pet War Leader"
    },
    {
      "name": "Mazo",
      "description":
          "\"Mazo\" is the leader of heroes and owner of \"Menejeur\". Strong with 2 lives and special area attacks. Menejeur will be stucked at the end of the pet line. Use Typhoon card to return it to deck.",
      "pet": "Menejeur",
      "color": "silver",
      "cardNum": 1,
      "type": "Pet War Leader"
    },
    {
      "name": "Visca",
      "description":
          "\"Visca\" is the owner of \"Lavu\". Their ability is to use and manipulate air as the source of their power.",
      "pet": "Lavu",
      "color": "deeporange",
      "cardNum": 1,
      "type": "Pet War Navi Battle"
    },
    {
      "name": "Lynn",
      "description": "\"Lynn\" is the owner of \"Raven\". Their ability is to control poison darts as their weapons.",
      "pet": "Raven",
      "color": "purple",
      "cardNum": 1,
      "type": "Pet War Navi Battle"
    },
    {
      "name": "Double",
      "description":
          "Ixora & Ixano, (known as \"Double\") are the owner of \"Sharpnell\" that has the ability of speed. They'll reach the safety zone in no time.",
      "pet": "Sharpnell",
      "color": "orange",
      "cardNum": 1,
      "type": "Pet War Canvas Activation"
    },
    {
      "name": "Kobong",
      "description":
          "\"Kobong\" is the owner of \"LPG-Zord\" that has the ability of explosion. It/he can kill more than one pet in one action.",
      "pet": "LPG-Zord",
      "color": "yellowgreen",
      "cardNum": 1,
      "type": "Pet War Canvas Activation"
    },
    {
      "name": "Soulbender R",
      "description":
          "\"Soulbender R\" is the owner of \"Sunge\" that has the abilities to escape and resurrect. Prepare to face them again, and again, and again...",
      "pet": "Sunge",
      "color": "deeppink",
      "cardNum": 1,
      "type": "Pet War Canvas Activation"
    },
    {
      "name": "Ashtranger",
      "description":
          "\"Ashtranger\" is the owner of \"Minion\" that has the ability to disturb the other pet(s). Minion is the most annoying pet in this game.",
      "pet": "Minion",
      "color": "red",
      "cardNum": 1,
      "type": "Pet War Canvas Activation"
    },
    {
      "name": "Roxxeon Kaizer",
      "description":
          "\"Roxxeon Kaizer\" is the owner of \"Waung\" that has the ability to survive. One attack is not enough to get rid of them.",
      "pet": "Waung",
      "color": "deepblue",
      "cardNum": 1,
      "type": "Pet War Canvas Activation"
    },
    {
      "name": "Electrode",
      "description":
          "\"Electrode\" is the owner of \"Paleo\" that has the ability to kill another pet with its/his super power!",
      "pet": "Paleo",
      "color": "purple",
      "cardNum": 1,
      "type": "Pet War Canvas Activation"
    },
    {
      "name": "Dewi Ruh Bengi",
      "description":
          "\"Dewi Ruh Bengi\" is the owner of \"Soeharti\", their ability is to manipulate the pet line to create the worst scenario of their opponent.",
      "pet": "Soeharti",
      "color": "yellow",
      "cardNum": 1,
      "type": "Pet War Canvas Activation II"
    },
    {
      "name": "Archetype",
      "description":
          "\"Archetype\" is the owner of \"Marmar\", their abilities are to steal other pet's protection and discard aims.",
      "pet": "Marmar",
      "color": "lightgreen",
      "cardNum": 1,
      "type": "Pet War Canvas Activation II"
    },
    {
      "name": "G.R.",
      "description":
          "\"G.R.\" is the owner of \"Giro\", their ability is gear charge. They can use charge to kill more than one pet in one action.",
      "pet": "Giro",
      "color": "green",
      "cardNum": 1,
      "type": "Pet War Canvas Activation II"
    },
    {
      "name": "Zero-Arms",
      "description":
          "\"Zero-Arms\" is the owner of \"Vulcan\", their abilities are to scavenge the discard pile and the dead pet.",
      "pet": "Vulcan",
      "color": "brown",
      "cardNum": 1,
      "type": "Pet War Canvas Activation II"
    },
    {
      "name": "Camiere",
      "description":
          "\"Camiere\" is the owner of \'King\", their ability is to jump over. King has a dead penalty after three rounds, however he can flee and kill with ease.",
      "pet": "King",
      "color": "blue",
      "cardNum": 1,
      "type": "Pet War Canvas Activation II"
    },
    {
      "name": "Braculla",
      "description":
          "\"Braculla\" is the owner of \"Bratz\", their ability is vampiric skill that allows him to absorb other pet's life.",
      "pet": "Bratz",
      "color": "lightpurple",
      "cardNum": 1,
      "type": "Pet War Canvas Activation II"
    }
  ];

  static const Map<String, Map<String, dynamic>> PET = {
    "Forest": {"name": "Forest", "description": "", "color": "grey", "ranger": "", "life": 0, "cardNum": 5},
    "Sharpnell": {
      "name": "Sharpnell",
      "description": "",
      "color": "orange",
      "ranger": "Dobel",
      "life": 1,
      "cardNum": 5
    },
    "LPG-Zord": {
      "name": "LPG-Zord",
      "description": "",
      "color": "yellowgreen",
      "ranger": "Tsunaryo",
      "life": 1,
      "cardNum": 5
    },
    "Sunge": {
      "name": "Sunge",
      "description": "",
      "color": "deeppink",
      "ranger": "Vonstaire",
      "life": 1,
      "cardNum": 5,
    },
    "Minion": {
      "name": "Minion",
      "description": "",
      "color": "red",
      "ranger": "Ashtray",
      "life": 1,
      "cardNum": 5,
    },
    "Waung": {
      "name": "Waung",
      "description": "",
      "color": "deepblue",
      "ranger": "Bonci",
      "life": 1,
      "cardNum": 5,
    },
    "Paleo": {
      "name": "Paleo",
      "description": "",
      "color": "deeppurple",
      "ranger": "Neo",
      "life": 1,
      "cardNum": 5,
    },
    "Soeharti": {
      "name": "Soeharti",
      "description": "",
      "color": "yellow",
      "ranger": "Daiya",
      "life": 1,
      "cardNum": 5,
    },
    "Marmar": {
      "name": "Marmar",
      "description": "",
      "color": "lightgreen",
      "ranger": "Elliot",
      "life": 1,
      "cardNum": 5,
    },
    "Giro": {
      "name": "Giro",
      "description": "",
      "color": "green",
      "ranger": "Rei",
      "life": 1,
      "cardNum": 5,
    },
    "Vulcan": {
      "name": "Vulcan",
      "description": "",
      "color": "brown",
      "ranger": "Javelin",
      "life": 1,
      "cardNum": 5,
    },
    "King": {
      "name": "King",
      "description": "",
      "color": "blue",
      "ranger": "Louise",
      "life": 1,
      "cardNum": 5,
    },
    "Bratz": {
      "name": "Bratz",
      "description": "",
      "color": "lightpurple",
      "ranger": "Bracula",
      "life": 1,
      "cardNum": 5,
    },
    "Vao": {
      "name": "Vao",
      "description": "",
      "color": "black",
      "ranger": "Gaoh",
      "life": 1,
      "cardNum": 5,
    },
    "Menejeur": {
      "name": "Menejeur",
      "description": "",
      "color": "silver",
      "ranger": "Mazo",
      "life": 2,
      "cardNum": 5,
    },
    "Lavu": {
      "name": "Lavu",
      "description": "",
      "color": "deeporange",
      "ranger": "Visca",
      "life": 1,
      "cardNum": 5,
    },
    "Raven": {
      "name": "Raven",
      "description": "",
      "color": "purple",
      "ranger": "Lynn",
      "life": 1,
      "cardNum": 5,
    },
    "EnchantedForest": {
      "name": "Enchanted Forest",
      "description":
          "If any pet swaps with this forest, that player take one aim card in the discard pile and put in pet line in any order",
      "color": "grey",
      "ranger": "",
      "life": 0,
      "cardNum": 1
    },
    "MazeForest": {
      "name": "Maze Forest",
      "description":
          "If any pet swaps with this forest, take all cards on the pet line, shuffle and deal again into the pet line",
      "color": "grey",
      "ranger": "",
      "life": 0,
      "cardNum": 1
    },
    "ThornForest": {
      "name": "Thorn Forest",
      "description": "No pet can go through this forest, unless King while using \"banzai\"",
      "color": "grey",
      "ranger": "",
      "life": 0,
      "cardNum": 1
    },
    "CursedForest": {
      "name": "Cursed Forest",
      "description": "If any pet swaps with this forest, that pet dies instantly",
      "color": "grey",
      "ranger": "",
      "life": 0,
      "cardNum": 1
    },
    "CatapultForest": {
      "name": "Catapult Forest",
      "description": "If any pet swaps with this forest, deal one damage to one targeted pet you choose",
      "color": "grey",
      "ranger": "",
      "life": 0,
      "cardNum": 1
    },
  };

  static const Map<String, Map<String, dynamic>> ACTION = {
    "Aim": {
      "name": "Aim",
      "type": "Pet War",
      "block": 1,
      "description": "Put this card above the pet you want to be targeted in the \"Pet Line\"",
      "color": "gold",
      "cardNum": 8, //5,
      "ability": "Aim",
      "special": null
    },
    "Boom": {
      "name": "Boom",
      "type": "Pet War",
      "block": 1,
      "description": "Use this card to destroy the targeted pet. Remove the aim card",
      "color": "gold",
      "cardNum": 8, //6,
      "ability": "Boom",
      "special": null
    },
    "Doom": {
      "name": "Doom",
      "type": "Pet War",
      "block": 1,
      "description": "Destroying target whether it was aimed or not. If the card was aimed, remove the aim card also",
      "color": "gold",
      "cardNum": 1,
      "ability": "Doom",
      "special": null
    },
    "TwoAims": {
      "name": "Two Aims",
      "type": "Pet War",
      "block": 2,
      "description":
          "Put TWO AIMS card sideways above any adjacent pets, tilt back to the normal position if one of them was destroyed",
      "color": "gold",
      "cardNum": 2, //1,
      "ability": "TwoAims",
      "special": null
    },
    "TwoBooms": {
      "name": "Two Booms",
      "type": "Pet War",
      "block": 2,
      "description":
          "Destory any two adjacent targeted pets, both with aim cards above them. Remove the aim cards. If there's no any adjacent aim card if become single boom",
      "color": "gold",
      "cardNum": 1,
      "ability": "TwoBooms",
      "special": null
    },
    "Miss": {
      "name": "Miss",
      "type": "Pet War",
      "block": 1,
      "description": "Destroy the pet next to the targeted pet (left or right) and the remove the used aim card",
      "color": "gold",
      "cardNum": 1,
      "ability": "Miss",
      "special": null
    },
    "Hide": {
      "name": "Hide",
      "type": "Pet War",
      "block": 1,
      "description":
          "Cover your chosen pet with this card. The covered pet can't be destroyed until this card removed after one round",
      "color": "gold",
      "cardNum": 1,
      "ability": "Hide",
      "special": null
    },
    "Running": {
      "name": "Running",
      "type": "Pet War",
      "block": 1,
      "description":
          "Move forward all cards in the \"pet line\" remove the card in the very from of the line to the bottom of the deck, replace the blank spot with new card from deck",
      "color": "gold",
      "cardNum": 3,
      "ability": "Running",
      "special": null
    },
    "GoForward": {
      "name": "Go Forward",
      "type": "Pet War",
      "block": 1,
      "description": "Swap YOUR pet with any card on the left side",
      "color": "gold",
      "cardNum": 2, //1,
      "ability": "GoForward",
      "special": null
    },
    "GoBackward": {
      "name": "Go Backward",
      "type": "Pet War",
      "block": 1,
      "description": "Swap YOUR pet with any card on the right side",
      "color": "gold",
      "cardNum": 2,
      "ability": "GoBackward",
      "special": null
    },
    "MoveThePet": {
      "name": "Move The Pet",
      "type": "Pet War",
      "block": 1,
      "description": "Rearrange all pet cards in the \"Pet Line\" anyway you like. Aim cards don't move",
      "color": "gold",
      "cardNum": 2, //1,
      "ability": "MoveThePet",
      "special": null
    },
    "Typhoon": {
      "name": "Typhoon",
      "type": "Pet War",
      "block": 1,
      "description":
          "Reshuffle all the pet cards in the \"Pet Line\" and the pet deck. Draw six new pet cards into the line",
      "color": "gold",
      "cardNum": 1,
      "ability": "Typhoon",
      "special": null
    },
    "GetCover": {
      "name": "Get Cover",
      "type": "Pet War",
      "block": 1,
      "description":
          "Put YOUR pet underneath the nearest pet. Your pet moves along with the covering pet, and remain hidden until the covering is destroyed",
      "color": "gold",
      "cardNum": 2,
      "ability": "GetCover",
      "special": null
    },
    "Armor": {
      "name": "Armor",
      "type": "Pet War",
      "block": 1,
      "description": "Cover your chosen pet to get additional life +1",
      "color": "gold",
      "cardNum": 3, //1,
      "ability": "Armor",
      "special": null
    },
    "LunchTime": {
      "name": "Lunch Time",
      "type": "Pet War",
      "block": 1,
      "description": "Remove all aim cards in the \"Pet Line\"",
      "color": "gold",
      "cardNum": 2, //1,
      "ability": "LunchTime",
      "special": null
    },
    "Grenade-MegaGrenade": {
      "name": "Grenade",
      "type": "Pet War",
      "block": 1,
      "description":
          "Put this card below any pet card in the \"Pet Line\". When the third player ends their turn after this card was placed, remove the grenade card and the pet above it. (has no effect to the forest card)",
      "color": "gold",
      "cardNum": 2,
      "ability": "Grenade",
      "special": {
        "name": "Mega Grenade",
        "description":
            "Put this card below any pet card in the \"Pet Line\". When the third player ends their turn after this card was placed, remove the grenade card and three pet above it. (has no effect to the forest card), if u are Tsuna",
        "color": "yellowgreen",
        "ranger": "Tsunaryo",
        "ability": "MegaGrenade"
      }
    },
    "Aim-Kamikaze": {
      "name": "Aim",
      "type": "Pet War",
      "block": 1,
      "description": "Put this card above the pet you want to be targeted in the \"Pet Line\"",
      "color": "gold",
      "cardNum": 3,
      "ability": "Aim",
      "special": {
        "name": "Kamikaze",
        "description":
            "Cover LPG-Zord with this card. If LPG-Zord was destroyed, it and its both sides including all attached to the are destroyed, if u are Tsuna",
        "color": "yellowgreen",
        "ranger": "Tsunaryo",
        "ability": "Kamikaze"
      }
    },
    "Resurrect-DoubleResurrect": {
      "name": "Resurrect",
      "type": "Pet War",
      "block": 1,
      "description": "Revive one of your pet that has been removed from the game to the bottom of the pet deck",
      "color": "gold",
      "cardNum": 2,
      "ability": "Resurrect",
      "special": {
        "name": "Double Resurrect",
        "description":
            "Put two 'Sunge' that has been removed from the game to the bottom of the pet deck, if u are Vonstaire",
        "color": "deeppink",
        "ranger": "Vonstaire",
        "ability": "DoubleResurrect"
      }
    },
    "GoForward-GoAnyward": {
      "name": "Go Forward",
      "type": "Pet War",
      "block": 1,
      "description": "Swap YOUR pet with any card on the left side",
      "color": "gold",
      "cardNum": 2,
      "ability": "GoForward",
      "special": {
        "name": "Go Anyward",
        "description": "Swap 'Sunge' to any direction within two steps ahead if u are Vonstaire",
        "color": "deeppink",
        "ranger": "Vonstaire",
        "ability": "GoAnyward"
      }
    },
    "GoBackward-GoAnyward": {
      "name": "Go Backward",
      "type": "Pet War",
      "block": 1,
      "description": "Swap YOUR pet with any card on the right side",
      "color": "gold",
      "cardNum": 1,
      "ability": "GoBackward",
      "special": {
        "name": "Go Anyward",
        "description": "Swap 'Sunge' to any direction within two steps ahead if u are Vonstaire",
        "color": "deeppink",
        "ranger": "Vonstaire",
        "ability": "GoAnyward"
      }
    },
    "Boom-OverShock": {
      "name": "Boom",
      "type": "Pet War",
      "block": 1,
      "description": "Use this card to destroy the targeted pet. Remove the aim card",
      "color": "gold",
      "cardNum": 3,
      "ability": "Boom",
      "special": {
        "name": "Over Shock",
        "description":
            "Destroying target whether it was aimed or not. If the card was aimed, remove the aim card also, if u are Neo",
        "color": "deeppurple",
        "ranger": "Neo",
        "ability": "OverShock"
      }
    },
    "Armor-Shield": {
      "name": "Armor",
      "type": "Pet War",
      "block": 1,
      "description": "Cover your chosen pet to get additional life +1",
      "color": "gold",
      "cardNum": 1,
      "ability": "Armor",
      "special": {
        "name": "Shield",
        "description": "Cover 'Waung' to get additional life +2, if u are Bonci",
        "color": "deepblue",
        "ranger": "Bonci",
        "ability": "Shield"
      }
    },
    "Hide-MasterHide": {
      "name": "Hide",
      "type": "Pet War",
      "block": 1,
      "description":
          "Cover your chosen pet with this card. The covered pet can't be destroyed until this card removed after one round",
      "color": "gold",
      "cardNum": 2,
      "ability": "Hide",
      "special": {
        "name": "Master Hide",
        "description":
            "Put \"Waung\" underneath any pet. It moves along with the covering and remains hidden until the pet that cover it is removed, if u are Bonci",
        "color": "deepblue",
        "ranger": "Bonci",
        "ability": "MasterHide"
      }
    },
    "Aim-Trap": {
      "name": "Aim",
      "type": "Pet War",
      "block": 1,
      "description": "Put this card above the pet you want to be targeted in the \"Pet Line\"",
      "color": "gold",
      "cardNum": 4,
      "ability": "Aim",
      "special": {
        "name": "Trap",
        "description":
            "Cover your targeted pet with this card, the pet can't be moved by any action cards until the end of the Ashtray's next turn, if u are Ashtray",
        "color": "red",
        "ranger": "Ashtray",
        "ability": "Trap"
      }
    },
    "BumpLeft-MovingAim": {
      "name": "Bump Left",
      "type": "Pet War",
      "block": 1,
      "description":
          "Move any aim card one step to the left. If there is another aim card on the position, nothing happens",
      "color": "gold",
      "cardNum": 2,
      "ability": "BumpLeft",
      "special": {
        "name": "Moving Aim",
        "description": "You can move one aim card anywhere you like, if u are Ashtray",
        "color": "red",
        "ranger": "Ashtray",
        "ability": "MovingAim"
      }
    },
    "BumpRight-MovingAim": {
      "name": "Bump Right",
      "type": "Pet War",
      "block": 1,
      "description":
          "Move any aim card one step to the right. If there is another aim card on the position, nothing happens",
      "color": "gold",
      "cardNum": 2,
      "ability": "BumpRight",
      "special": {
        "name": "Moving Aim",
        "description": "You can move one aim card anywhere you like, if u are Ashtray",
        "color": "red",
        "ranger": "Ashtray",
        "ability": "MovingAim"
      }
    },
    "Running-Escape": {
      "name": "Running",
      "type": "Pet War",
      "block": 1,
      "description":
          "Move forward all cards in the \"pet line\" remove the card in the very from of the line to the bottom of the deck, replace the blank spot with new card from deck",
      "color": "gold",
      "cardNum": 3,
      "ability": "Running",
      "special": {
        "name": "Escape",
        "description":
            "Take \"Sharpnell\" from the \"Pet Line\" put it in the pet deck and reshuffle, take one card from the pet deck to fill the blank spot, if u are Dobel",
        "color": "orange",
        "ranger": "Dobel",
        "ability": "Escape"
      }
    },
    "Running-DoubleRun": {
      "name": "Running",
      "type": "Pet War",
      "block": 1,
      "description":
          "Move forward all cards in the \"pet line\" remove the card in the very from of the line to the bottom of the deck, replace the blank spot with new card from deck",
      "color": "gold",
      "cardNum": 2,
      "ability": "Running",
      "special": {
        "name": "Double Run",
        "description":
            "Move forward all cards in the \"pet line\" remove two cards in the very front of the line to the bottom of the deck, replace the blank spot with two new card from deck, if u are Dobel",
        "color": "orange",
        "ranger": "Dobel",
        "ability": "DoubleRun"
      }
    },
    // II
    // "Doom": {
    //   "name": "Doom",
    //   "block": 1,
    //   "description":
    //       "Destroying target whether it was aimed or not. If the card was aimed, remove the aim card also",
    //   "color": "gold",
    //   "cardNum": 1,
    //   "ability": "Doom",
    //   "special": null
    // },
    // "Two Booms": {
    //   "name": "Two Booms",
    //   "block": 2,
    //   "description":
    //       "Destory any two adjacent targeted pets, both with aim cards above them. Remove the aim cards. If there's no any adjacent aim card if become single boom",
    //   "color": "gold",
    //   "cardNum": 1,
    //   "ability": "TwoBoom",
    //   "special": null
    // },
    "MissFire": {
      "name": "Miss Fire",
      "type": "Pet War II",
      "block": 1,
      "description": "Destroy the pet next to the aimed pet (left or right). Remove the used aim card",
      "color": "gold",
      "cardNum": 1,
      "ability": "Miss",
      "special": null
    },
    // "Hide": {
    //   "name": "Hide",
    //   "block": 1,
    //   "description":
    //       "Cover your chosen pet with this card. The covered pet can't be destroyed until this card removed after one round",
    //   "color": "gold",
    //   "cardNum": 1,
    //   "ability": "Hide",
    //   "special": null
    // },
    // "Typhoon": {
    //   "name": "Typhoon",
    //   "block": 1,
    //   "description":
    //       "Reshuffle all the pet cards in the \"Pet Line\" and the pet deck. Draw six new pet cards into the line",
    //   "color": "gold",
    //   "cardNum": 1,
    //   "ability": "Typhoon",
    //   "special": null
    // },
    // "Lunch Time": {
    //   "name": "Lunch Time",
    //   "block": 1,
    //   "description": "Remove all aim cards in the \"Pet Line\"",
    //   "color": "gold",
    //   "cardNum": 1,
    //   "ability": "LunchTime",
    //   "special": null
    // },
    "ReshuffleHand": {
      "name": "Reshuffle Hand",
      "type": "Pet War II",
      "block": 1,
      "description":
          "Collect all action card in hands from all players and shuffle it (action deck not included) and deal the action cards",
      "color": "gold",
      "cardNum": 1,
      "ability": "ReshuffleHand",
      "special": null
    },
    "SwitchRanger": {
      "name": "Switch Ranger",
      "type": "Pet War II",
      "block": 1,
      "description": "Switch your character with another player of your choice",
      "color": "gold",
      "cardNum": 1,
      "ability": "SwitchRanger",
      "special": null
    },
    "Resurrect": {
      "name": "Resurrect",
      "type": "Pet War II",
      "block": 1,
      "description": "Revive one of your pet that has been removed from the game to the bottom of the pet deck",
      "color": "gold",
      "cardNum": 2,
      "ability": "Resurrect",
      "special": null,
    },
    // "Running": {
    //   "name": "Running",
    //   "block": 1,
    //   "description":
    //       "Move forward all cards in the \"pet line\" remove the card in the very from of the line to the bottom of the deck, replace the blank spot with new card from deck",
    //   "color": "gold",
    //   "cardNum": 3,
    //   "ability": "Running",
    //   "special": null
    // },
    "GoForward-Banzai": {
      "name": "Go Forward",
      "type": "Pet War II",
      "block": 1,
      "description": "Swap YOUR pet with any card on the left side",
      "color": "gold",
      "cardNum": 3,
      "ability": "GoForward",
      "special": {
        "name": "Banzai",
        "description":
            "King can jump 2 steps forward (If it's pet, the second card it passes destroyed). If King jump over the Pet Line, he'll return to the bottom of the pet deck, if u are Louise",
        "color": "blue",
        "ranger": "Louise",
        "ability": "Banzai"
      }
    },
    "GoBackward-Banzai": {
      "name": "Go Backward",
      "type": "Pet War II",
      "block": 1,
      "description": "Swap YOUR pet with any card on the right side",
      "color": "gold",
      "cardNum": 2,
      "ability": "GoBackward",
      "special": {
        "name": "Banzai",
        "description":
            "King can jump 2 steps forward (If it's pet, the second card it passes destroyed). If King jump over the Pet Line, he'll return to the bottom of the pet deck, if u are Louise",
        "color": "blue",
        "ranger": "Louise",
        "ability": "Banzai"
      }
    },
    "Boom-Banzai": {
      "name": "Boom",
      "type": "Pet War II",
      "block": 1,
      "description": "Use this card to destroy the targeted pet. Remove the aim card",
      "color": "gold",
      "cardNum": 5,
      "ability": "Boom",
      "special": {
        "name": "Banzai",
        "description":
            "King can jump 2 steps forward (If it's pet, the second card it passes destroyed). If King jump over the Pet Line, he'll return to the bottom of the pet deck, if u are Louise",
        "color": "blue",
        "ranger": "Louise",
        "ability": "Banzai"
      }
    },
    "GetCover-WaterBulb": {
      "name": "Get Cover",
      "type": "Pet War II",
      "block": 1,
      "description":
          "Put YOUR pet underneath the nearest pet. Your pet moves along with the covering pet, and remain hidden until the covering is destroyed",
      "color": "gold",
      "cardNum": 2,
      "ability": "GetCover",
      "special": {
        "name": "Water Bulb",
        "description": "Cover King with this card to nullify the 3 rounds death, if u are Louise",
        "color": "blue",
        "ranger": "Louise",
        "ability": "WaterBulb"
      }
    },
    "Armor-VampiricMove": {
      "name": "Armor",
      "type": "Pet War II",
      "block": 1,
      "description": "Cover your chosen pet to get additional life +1",
      "color": "gold",
      "cardNum": 2,
      "ability": "Armor",
      "special": {
        "name": "Vampiric Move",
        "description":
            "Draw two cards from the Action Deck and play an extra action card from your hand, if u are Bracula",
        "color": "lightpurple",
        "ranger": "Bracula",
        "ability": "VampiricMove"
      }
    },
    "Boom-VampiricBite": {
      "name": "Boom",
      "type": "Pet War II",
      "block": 1,
      "description": "Use this card to destroy the targeted pet. Remove the aim card",
      "color": "gold",
      "cardNum": 5,
      "ability": "Boom",
      "special": {
        "name": "Vampiric Bite",
        "description":
            "Use this card to destroy the pet below the aim card. Put one destroyed Bratz to replace the targeted pet, if u are Bracula",
        "color": "lightpurple",
        "ranger": "Bracula",
        "ability": "VampiricBite"
      }
    },
    "Hide-CorpseCover": {
      "name": "Hide",
      "type": "Pet War II",
      "block": 1,
      "description":
          "Cover your chosen pet with this card. The covered pet can't be destroyed until this card removed after one round",
      "color": "gold",
      "cardNum": 2,
      "ability": "Hide",
      "special": {
        "name": "Corpse Cover",
        "description":
            "Cover Vulcan with any discarded pet from your opponent's graveyard, put it faced down. The used pet corpse is removed from game, it can't be resurrected, if u are Javelin",
        "color": "brown",
        "ranger": "Javelin",
        "ability": "CorpseCover"
      }
    },
    "Aim-Scavenge": {
      "name": "Aim",
      "type": "Pet War II",
      "block": 1,
      "description": "Put this card above the pet you want to be targeted in the \"Pet Line\"",
      "color": "gold",
      "cardNum": 3,
      "ability": "Aim",
      "special": {
        "name": "Scavenge",
        "description":
            "Take ALL aim cards from discard pile, and place them all on the pet line in any way you like. Discard the rest if the slot is full, if you are Javelin",
        "color": "brown",
        "ranger": "Javelin",
        "ability": "Scavenge"
      }
    },
    "Aim-Avoid": {
      "name": "Aim",
      "type": "Pet War II",
      "block": 1,
      "description": "Put this card above the pet you want to be targeted in the \"Pet Line\"",
      "color": "gold",
      "cardNum": 6,
      "ability": "Aim",
      "special": {
        "name": "Avoid",
        "description": "Remove up to 6 aim cards, if u are Elliot",
        "color": "lightgreen",
        "ranger": "Elliot",
        "ability": "Avoid"
      }
    },
    "BumpLeft-Steal": {
      "name": "Bump Left",
      "type": "Pet War II",
      "block": 1,
      "description":
          "Move any aim card one step to the left. If there is another aim card on the position, nothing happens",
      "color": "gold",
      "cardNum": 2,
      "ability": "BumpLeft",
      "special": {
        "name": "Steal",
        "description": "Steal any hide or armor card or even a pet that covers other pet, if u are Elliot",
        "color": "lightgreen",
        "ranger": "Elliot",
        "ability": "Steal"
      }
    },
    "BumpRight-Charge": {
      "name": "Bump Right",
      "type": "Pet War II",
      "block": 1,
      "description":
          "Move any aim card one step to the right. If there is another aim card on the position, nothing happens",
      "color": "gold",
      "cardNum": 2,
      "ability": "BumpRight",
      "special": {
        "name": "Charge",
        "description":
            "Cover Giro with this card and it is considered to have an AIM on top of it. If Giro survives one whole turn, Giro moves two steps forward and destroy all pets that passed by Giro, if u are Rei",
        "color": "green",
        "ranger": "Rei",
        "ability": "Charge"
      }
    },
    "Mine-MegaMine": {
      "name": "Mine",
      "type": "Pet War II",
      "block": 1,
      "description":
          "Put this card under any pet card on the Pet Line. When a Running or Boo card played, destroy the pet above the mine card",
      "color": "gold",
      "cardNum": 2,
      "ability": "Mine",
      "special": {
        "name": "Mega Mine",
        "description":
            "Put this card under any pet card on the Pet Line. When a Running or Boo card played, destroy the pet above the mine card along with adjacent pets, if u are Rei",
        "color": "green",
        "ranger": "Rei",
        "ability": "MegaMine"
      }
    },
    "Aim-Haunted": {
      "name": "Aim",
      "type": "Pet War II",
      "block": 1,
      "description": "Put this card above the pet you want to be targeted in the \"Pet Line\"",
      "color": "gold",
      "cardNum": 3,
      "ability": "Aim",
      "special": {
        "name": "Haunted",
        "description": "Swap Soeharti with any pet you like, if u are Daiya",
        "color": "yellow",
        "ranger": "Daiya",
        "ability": "Haunted"
      }
    },
    "Running-Boo": {
      "name": "Running",
      "type": "Pet War II",
      "block": 1,
      "description":
          "Move forward all cards in the \"pet line\" remove the card in the very from of the line to the bottom of the deck, replace the blank spot with new card from deck",
      "color": "gold",
      "cardNum": 3,
      "ability": "Running",
      "special": {
        "name": "Boo",
        "description":
            "Move all cards on the pet line backward. Move the card in the back of the line to the top of the deck. Take the card from the bottom of the deck and put back in the front of the line, if u are Daiya",
        "color": "yellow",
        "ranger": "Daiya",
        "ability": "Boo"
      }
    },
    // Leader
    "Aim-Voodoo": {
      "name": "Aim",
      "type": "Pet War Leader",
      "block": 1,
      "description": "Put this card above the pet you want to be targeted in the \"Pet Line\"",
      "color": "gold",
      "cardNum": 4,
      "ability": "Aim",
      "special": {
        "name": "Voodoo",
        "description":
            "Take three cards at the top of pet deck and choose one pet among them to die immediately. You have to use this skill if u are Gaoh",
        "color": "black",
        "ranger": "Gaoh",
        "ability": "Voodoo"
      }
    },
    "Boom-Apocalypse": {
      "name": "Boom",
      "type": "Pet War Leader",
      "block": 1,
      "description": "Use this card to destroy the targeted pet. Remove the aim card",
      "color": "gold",
      "cardNum": 3,
      "ability": "Boom",
      "special": {
        "name": "Apocalypse",
        "description":
            "Give one damage to all pet in the pet line. Remove all aim cards in the pet line, if u are Mazo",
        "color": "silver",
        "ranger": "Mazo",
        "ability": "Apocalypse"
      }
    },
    // Navi Battle
    "Illusion": {
      "name": "Illusion",
      "type": "Pet War Navi Battle",
      "block": 1,
      "description":
          "Take all forest cards in the pet line, reshuffle it with the pet deck. Put the new cards in the blank areas",
      "color": "gold",
      "cardNum": 2,
      "ability": "Illusion",
      "special": null
    },
    "Boom-PoisonDarts": {
      "name": "Boom",
      "type": "Pet War Navi Battle",
      "block": 1,
      "description": "Use this card to destroy the targeted pet. Remove the aim card",
      "color": "gold",
      "cardNum": 3,
      "ability": "Boom",
      "special": {
        "name": "Poison Darts",
        "description":
            "Put 1 token on top of a pet that is on 3 of your chosen area which are side by side. Add 1 token every round. The pet dies when it receives a 4th token, if u are Lynn",
        "color": "purple",
        "ranger": "Lynn",
        "ability": "PoisonDarts"
      }
    },
    "Running-AirShield": {
      "name": "Running",
      "type": "Pet War Navi Battle",
      "block": 1,
      "description":
          "Move forward all cards in the \"pet line\" remove the card in the very from of the line to the bottom of the deck, replace the blank spot with new card from deck",
      "color": "gold",
      "cardNum": 2,
      "ability": "Running",
      "special": {
        "name": "Air Shield",
        "description":
            "Destroy the pet next to targeted pet (you can choose left or right) and the remove the used aim card, if u are Visca",
        "color": "deeporange",
        "ranger": "Visca",
        "ability": "AirShield"
      }
    },
    "Running-AirCompressor": {
      "name": "Running",
      "type": "Pet War Navi Battle",
      "block": 1,
      "description":
          "Move forward all cards in the \"pet line\" remove the card in the very from of the line to the bottom of the deck, replace the blank spot with new card from deck",
      "color": "gold",
      "cardNum": 3,
      "ability": "Running",
      "special": {
        "name": "Air Compressor",
        "description":
            "Reshuffle 3 card of your chosen area which are side by side that side by side in the pet line with the pet deck. Put 3 new cards in the blank area, if u are Visca",
        "color": "deeporange",
        "ranger": "Visca",
        "ability": "AirCompressor"
      }
    },
    // Expansion
    "Fogging": {
      "name": "Fogging",
      "type": "Pet War Canvas Activation",
      "block": 1,
      "description":
          "Collect all pet cards that are in the \"Pet Line\" (not including pet deck), reshuffle, and place the back in the \"Pet Line\" facing down",
      "color": "gold",
      "cardNum": 1,
      "ability": "Fogging",
      "special": null
    },
    "MachineGun": {
      "name": "Machine Gun",
      "type": "Pet War Canvas Activation",
      "block": 1,
      "description": "Boom all aim cards on the pet line",
      "color": "gold",
      "cardNum": 1,
      "ability": "MachineGun",
      "special": null
    },
    "Wild": {
      "name": "Wild",
      "type": "Pet War Canvas Activation",
      "block": 1,
      "description": "This card acts as your special skill",
      "color": "gold",
      "cardNum": 1,
      "ability": "Wild",
      "special": null
    },
    "Hypnotize": {
      "name": "Hypnotize",
      "type": "Pet War Canvas Activation",
      "block": 1,
      "description": "Move any pet you choose one step forward or backward",
      "color": "gold",
      "cardNum": 1,
      "ability": "Hypnotize",
      "special": null
    },
  };

  static const Map<String, Map<String, dynamic>> CANVAS_ACTIVATION = {
    "InstantEscape": {
      "name": "Instant Escape",
      "block": 1,
      "description": "",
      "color": "orange",
      "cardNum": 1,
      "ranger": "Double",
      "ability": "InstantEscape"
    },
    "Deflect": {
      "name": "Deflect",
      "block": 1,
      "description": "",
      "color": "deepblue",
      "cardNum": 1,
      "ranger": "Roxxeon Kaizer",
      "ability": "Deflect"
    },
    "Outbreak": {
      "name": "Outbreak",
      "block": 1,
      "description": "",
      "color": "deeppink",
      "cardNum": 1,
      "ranger": "Soulbender R",
      "ability": "Outbreak"
    },
    "Vortex": {
      "name": "Vortex",
      "block": 1,
      "description": "",
      "color": "yellowgreen",
      "cardNum": 1,
      "ranger": "Kobong",
      "ability": "Vortex"
    },
    "Copycat": {
      "name": "Copycat",
      "block": 1,
      "description": "",
      "color": "red",
      "cardNum": 1,
      "ranger": "Ashtranger",
      "ability": "Copycat"
    },
    "Multishock": {
      "name": "Multishock",
      "block": 1,
      "description": "",
      "color": "deeppurple",
      "cardNum": 1,
      "ranger": "Electrode",
      "ability": "MultiShock"
    },
    // II
    "Thievery": {
      "name": "Thievery",
      "block": 1,
      "description": "",
      "color": "lightgreen",
      "cardNum": 1,
      "ranger": "Archetype",
      "ability": "Thievery"
    },
    "MegaCharge": {
      "name": "Mega Charge",
      "block": 1,
      "description": "",
      "color": "green",
      "cardNum": 1,
      "ranger": "G.R.",
      "ability": "MegaCharge"
    },
    "JunkYardMaster": {
      "name": "Junk Yard Master",
      "block": 1,
      "description": "",
      "color": "brown",
      "cardNum": 1,
      "ranger": "Zero-Arms",
      "ability": "JunkYardMaster"
    },
    "Manipulation": {
      "name": "Manipulation",
      "block": 1,
      "description": "",
      "color": "yellow",
      "cardNum": 1,
      "ranger": "Dewi Ruh Bengi",
      "ability": "Manipulation"
    },
    "Tsunami": {
      "name": "Tsunami",
      "block": 1,
      "description": "",
      "color": "blue",
      "cardNum": 1,
      "ranger": "Camiere",
      "ability": "Tsunami"
    },
    "DarkTerror": {
      "name": "Dark Terror",
      "block": 1,
      "description": "",
      "color": "lightpurple",
      "cardNum": 1,
      "ranger": "Braculla",
      "ability": "DarkTerror"
    },
  };
}
