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

  static const List<String> CANVAS_TEXT = ["CANVAS", "RANGER", "PETWAR"];
  static const List<String> DECK_TEXT = [
    "Action\nDeck",
    "Pet\nDeck",
    "Discard\nPile"
  ];

  static const List<Map<String, dynamic>> CANVAS_RANGER = [
    {
      "name": "Dobel",
      "description":
          "Ixora & Ixano, (known as \"Dobel\") are the owner of \"Sharpnell\" that has the ability of speed. They'll reach the safety zone in no time.",
      "pet": "Sharpnell",
      "color": "orange",
      "cardNum": 1
    },
    {
      "name": "Tsunaryo",
      "description":
          "\"Tsuna\" is the owner of \"LPG-Zord\" that has the ability of explosion. It/he can kill more than one pet in one action.",
      "pet": "LPG-Zord",
      "color": "yellowgreen",
      "cardNum": 1
    },
    {
      "name": "Vonstaire",
      "description":
          "\"Vonstaire\" is the owner of \"Sunge\" that has the abilities to escape and resurrect. Prepare to face them again, and again, and again...",
      "pet": "Sunge",
      "color": "deeppink",
      "cardNum": 1
    },
    {
      "name": "Ashtray",
      "description":
          "\"Ashtray\" is the owner of \"Minion\" that has the ability to disturb the other pet(s). Minion is the most annoying pet in this game.",
      "pet": "Minion",
      "color": "red",
      "cardNum": 1
    },
    {
      "name": "Bonci",
      "description":
          "\"Bonci\" is the owner of \"Waung\" that has the ability to survive. One attack is not enough to get rid of them.",
      "pet": "Waung",
      "color": "blue",
      "cardNum": 1
    },
    {
      "name": "Neo",
      "description":
          "\"Neo\" is the owner of \"Paleo\" that has the ability to kill another pet with its/his super power!",
      "pet": "Paleo",
      "color": "purple",
      "cardNum": 1
    },
    {
      "name": "Daiya",
      "description":
          "\"Daiya\" is the owner of \"Soeharti\", their ability is to manipulate the pet line to create the worst scenario of their opponent.",
      "pet": "Soeharti",
      "color": "orange",
      "cardNum": 1
    },
    {
      "name": "Elliot",
      "description": "",
      "pet": "Marmar",
      "color": "yellowgreen",
      "cardNum": 1
    },
    {
      "name": "Rei",
      "description":
          "\"Rei\" is the owner of \"Giro\", their ability is gear charge. They can use charge to kill more than one pet in one action.",
      "pet": "Giro",
      "color": "green",
      "cardNum": 1
    },
    {
      "name": "Javelin",
      "description":
          "\"Javelin\" is the owner of \"Vulcan\", their abilities are to scavenge the discard pile and the dead pet.",
      "pet": "Vulcan",
      "color": "red",
      "cardNum": 1
    },
    {
      "name": "Louise",
      "description":
          "\"Louise\" is the owner of \'King\", their ability is to jump over. King has a dead penalty after three rounds, however he can flee and kill with ease.",
      "pet": "King",
      "color": "blue",
      "cardNum": 1
    },
    {
      "name": "Bracula",
      "description": "",
      "pet": "Bratz",
      "color": "purple",
      "cardNum": 1
    },
    {
      "name": "Gaoh",
      "description":
          "\"Gaoh\" is the leader of villains and owner of \"Vao\". Their ability is to spread fear with voodoo magic.",
      "pet": "Vao",
      "color": "black",
      "cardNum": 1
    },
    {
      "name": "Mazo",
      "description":
          "\"Mazo\" is the leader of heroes and owner of \"Menejeur\". Strong with 2 lives and special area attacks. Menejeur will be stucked at the end of the pet line. Use Typhoon card to return it to deck.",
      "pet": "Menejeur",
      "color": "silver",
      "cardNum": 1
    },
    {
      "name": "Visca",
      "description":
          "\"Visca\" is the owner of \"Lavu\". Their ability is to use and manipulate air as the source of their power.",
      "pet": "Lavu",
      "color": "orange",
      "cardNum": 1
    },
    {
      "name": "Lynn",
      "description":
          "\"Lynn\" is the owner of \"Raven\". Their ability is to control poison darts as their weapons.",
      "pet": "Raven",
      "color": "purple",
      "cardNum": 1
    },
  ];

  static const Map<String, Map<String, dynamic>> PET = {
    "Jungle": {
      "name": "Jungle",
      "description": "",
      "color": "grey",
      "ranger": "",
      "life": 0,
      "cardNum": 5
    },
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
      "cardNum": 5
    },
    "Minion": {
      "name": "Minion",
      "description": "",
      "color": "red",
      "ranger": "Ashtray",
      "life": 1,
      "cardNum": 5
    },
    "Waung": {
      "name": "Waung",
      "description": "",
      "color": "blue",
      "ranger": "Bonci",
      "life": 1,
      "cardNum": 5
    },
    "Paleo": {
      "name": "Paleo",
      "description": "",
      "color": "purple",
      "ranger": "Neo",
      "life": 1,
      "cardNum": 5
    },
    "Soeharti": {
      "name": "Soeharti",
      "description": "",
      "color": "orange",
      "ranger": "Daiya",
      "life": 1,
      "cardNum": 5
    },
    "Marmar": {
      "name": "Marmar",
      "description": "",
      "color": "yellowgreen",
      "ranger": "Elliot",
      "life": 1,
      "cardNum": 5
    },
    "Giro": {
      "name": "Giro",
      "description": "",
      "color": "green",
      "ranger": "Rei",
      "life": 1,
      "cardNum": 5
    },
    "Vulcan": {
      "name": "Vulcan",
      "description": "",
      "color": "red",
      "ranger": "Javelin",
      "life": 1,
      "cardNum": 5
    },
    "King": {
      "name": "King",
      "description": "",
      "color": "blue",
      "ranger": "Louise",
      "life": 1,
      "cardNum": 5
    },
    "Bratz": {
      "name": "Bratz",
      "description": "",
      "color": "purple",
      "ranger": "Bracula",
      "life": 1,
      "cardNum": 5
    },
    "Vao": {
      "name": "Vao",
      "description": "",
      "color": "black",
      "ranger": "Gaoh",
      "life": 1,
      "cardNum": 5
    },
    "Menejeur": {
      "name": "Menejeur",
      "description": "",
      "color": "silver",
      "ranger": "Mazo",
      "life": 2,
      "cardNum": 5
    },
    "Lavu": {
      "name": "Lavu",
      "description": "",
      "color": "orange",
      "ranger": "Visca",
      "life": 1,
      "cardNum": 5
    },
    "Raven": {
      "name": "Raven",
      "description": "",
      "color": "purple",
      "ranger": "Lynn",
      "life": 1,
      "cardNum": 5
    },
    "Enchanted Forest": {
      "name": "Enchanted Forest",
      "description": "",
      "color": "grey",
      "ranger":
          "If any pet swaps with this forest, that player take one aim card in the discard pile and put in pet line in any order",
      "life": 0,
      "cardNum": 1
    },
    "Maze Forest": {
      "name": "Maze Forest",
      "description":
          "If any pet swaps with this forest, take all cards on the pet line, shuffle and deal again into the pet line",
      "color": "grey",
      "ranger": "",
      "life": 0,
      "cardNum": 1
    },
    "Thorn Forest": {
      "name": "Thorn Forest",
      "description":
          "No pet can go through this forest, unless King while using \"banza\"",
      "color": "grey",
      "ranger": "",
      "life": 0,
      "cardNum": 1
    },
    "Cursed Forest": {
      "name": "Cursed Forest",
      "description":
          "If any pet swaps with this forest, that pet dies instantly",
      "color": "grey",
      "ranger": "",
      "life": 0,
      "cardNum": 1
    },
    "Catapult Forest": {
      "name": "Catapult Forest",
      "description":
          "If any pet swaps with this forest, deal one damage to one targeted pet you choose",
      "color": "grey",
      "ranger": "",
      "life": 0,
      "cardNum": 1
    },
  };

  static const Map<String, Map<String, dynamic>> ACTION = {
    "Aim": {
      "name": "Aim",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 8, //5,
      "ability": "Aim",
      "special": null
    },
    "Boom": {
      "name": "Boom",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 8, //6,
      "ability": "Boom",
      "special": null
    },
    "Doom": {
      "name": "Doom",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 1,
      "ability": "Doom",
      "special": null
    },
    "Two Aim": {
      "name": "Two Aim",
      "block": 2,
      "description": "",
      "color": "gold",
      "cardNum": 2, //1,
      "ability": "TwoAim",
      "special": null
    },
    "Two Boom": {
      "name": "Two Boom",
      "block": 2,
      "description": "",
      "color": "gold",
      "cardNum": 1,
      "ability": "TwoBoom",
      "special": null
    },
    "Miss": {
      "name": "Miss",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 1,
      "ability": "Miss",
      "special": null
    },
    "Hide": {
      "name": "Hide",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 1,
      "ability": "Hide",
      "special": null
    },
    "Running": {
      "name": "Running",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 3,
      "ability": "Running",
      "special": null
    },
    "Go Forward": {
      "name": "Go Forward",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 2, //1,
      "ability": "GoForward",
      "special": null
    },
    "Go Backward": {
      "name": "Go Backward",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "GoBackward",
      "special": null
    },
    "Move The Pet": {
      "name": "Move The Pet",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 2, //1,
      "ability": "MoveThePet",
      "special": null
    },
    "Typhoon": {
      "name": "Typhoon",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 1,
      "ability": "Typhoon",
      "special": null
    },
    "Get Cover": {
      "name": "Get Cover",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "GetCover",
      "special": null
    },
    "Armor": {
      "name": "Armor",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 3, //1,
      "ability": "Armor",
      "special": null
    },
    "Lunch Time": {
      "name": "Lunch Time",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 2, //1,
      "ability": "LunchTime",
      "special": null
    },
    "Grenade-Mega Grenade": {
      "name": "Grenade",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "Grenade",
      "special": {
        "name": "Mega Grenade",
        "description": "",
        "color": "yellowgreen",
        "ranger": "Tsunaryo",
        "ability": "MegaGrenade"
      }
    },
    "Aim-Kamikaze": {
      "name": "Aim",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 3,
      "ability": "Aim",
      "special": {
        "name": "Kamikaze",
        "description": "",
        "color": "yellowgreen",
        "ranger": "Tsunaryo",
        "ability": "Kamikaze"
      }
    },
    "Ressurect-Double Resurrect": {
      "name": "Ressurect",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "Ressurect",
      "special": {
        "name": "Double Resurrect",
        "description": "",
        "color": "deeppink",
        "ranger": "Vonstaire",
        "ability": "DoubleRessurect"
      }
    },
    "Go Forward-Go Anyward": {
      "name": "Go Forward",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "GoForward",
      "special": {
        "name": "Go Anyward",
        "description": "",
        "color": "deeppink",
        "ranger": "Vonstaire",
        "ability": "GoAnyward"
      }
    },
    "Go Backward-Go Anyward": {
      "name": "Go Backward",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 1,
      "ability": "GoBackward",
      "special": {
        "name": "Go Anyward",
        "description": "",
        "color": "deeppink",
        "ranger": "Vonstaire",
        "ability": "GoAnyward"
      }
    },
    "Boom-Over Shock": {
      "name": "Boom",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 3,
      "ability": "Boom",
      "special": {
        "name": "Over Shock",
        "description": "",
        "color": "purple",
        "ranger": "Neo",
        "ability": "OverShock"
      }
    },
    "Armor-Shield": {
      "name": "Armor",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 1,
      "ability": "Armor",
      "special": {
        "name": "Shield",
        "description": "",
        "color": "blue",
        "ranger": "Bonci",
        "ability": "Shield"
      }
    },
    "Hide-Master Hide": {
      "name": "Hide",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "Hide",
      "special": {
        "name": "Master Hide",
        "description": "",
        "color": "blue",
        "ranger": "Bonci",
        "ability": "MasterHide"
      }
    },
    "Aim-Trap": {
      "name": "Aim",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 4,
      "ability": "Aim",
      "special": {
        "name": "Trap",
        "description": "",
        "color": "red",
        "ranger": "Ashtray",
        "ability": "Trap"
      }
    },
    "Bump Left-Moving Aim": {
      "name": "Bump Left",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "BumpLeft",
      "special": {
        "name": "Moving Aim",
        "description": "",
        "color": "red",
        "ranger": "Ashtray",
        "ability": "MovingAim"
      }
    },
    "Bump Right-Moving Aim": {
      "name": "Bump Right",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "BumpRight",
      "special": {
        "name": "Moving Aim",
        "description": "",
        "color": "red",
        "ranger": "Ashtray",
        "ability": "MovingAim"
      }
    },
    "Running-Escape": {
      "name": "Running",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 3,
      "ability": "Running",
      "special": {
        "name": "Escape",
        "description": "",
        "color": "orange",
        "ranger": "Dobel",
        "ability": "Escape"
      }
    },
    "Running-Double Run": {
      "name": "Running",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "Running",
      "special": {
        "name": "Double Run",
        "description": "",
        "color": "orange",
        "ranger": "Dobel",
        "ability": "DoubleRun"
      }
    },
    // II
    // "Doom": {
    //   "name": "Doom",
    //   "block": 1,
    //   "description": "",
    //   "color": "gold",
    //   "cardNum": 1,
    //   "ability": "Doom",
    //   "special": null
    // },
    // "Two Boom": {
    //   "name": "Two Boom",
    //   "block": 2,
    //   "description": "",
    //   "color": "gold",
    //   "cardNum": 1,
    //   "ability": "TwoBoom",
    //   "special": null
    // },
    // "Miss": {
    //   "name": "Miss",
    //   "block": 1,
    //   "description": "",
    //   "color": "gold",
    //   "cardNum": 1,
    //   "ability": "Miss",
    //   "special": null
    // },
    // "Hide": {
    //   "name": "Hide",
    //   "block": 1,
    //   "description": "",
    //   "color": "gold",
    //   "cardNum": 1,
    //   "ability": "Hide",
    //   "special": null
    // },
    // "Typhoon": {
    //   "name": "Typhoon",
    //   "block": 1,
    //   "description": "",
    //   "color": "gold",
    //   "cardNum": 1,
    //   "ability": "Typhoon",
    //   "special": null
    // },
    // "Lunch Time": {
    //   "name": "Lunch Time",
    //   "block": 1,
    //   "description": "",
    //   "color": "gold",
    //   "cardNum": 1,
    //   "ability": "LunchTime",
    //   "special": null
    // },
    "Reshuffle Hand": {
      "name": "Reshuffle Hand",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 1,
      "ability": "ReshuffleHand",
      "special": null
    },
    "Switch Ranger": {
      "name": "Switch Ranger",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 1,
      "ability": "SwitchRanger",
      "special": null
    },
    // "Ressurect": {
    //   "name": "Ressurect",
    //   "block": 1,
    //   "description": "",
    //   "color": "gold",
    //   "cardNum": 2,
    //   "ability": "Ressurect",
    //   "special": null,
    // },
    // "Running": {
    //   "name": "Running",
    //   "block": 1,
    //   "description": "",
    //   "color": "gold",
    //   "cardNum": 3,
    //   "ability": "Running",
    //   "special": null
    // },
    "Go Forward-Banzai": {
      "name": "Go Forward",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 3,
      "ability": "GoForward",
      "special": {
        "name": "Banzai",
        "description": "",
        "color": "blue",
        "ranger": "Louise",
        "ability": "Banzai"
      }
    },
    "Go Backward-Banzai": {
      "name": "Go Backward",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "GoBackward",
      "special": {
        "name": "Banzai",
        "description": "",
        "color": "blue",
        "ranger": "Louise",
        "ability": "Banzai"
      }
    },
    "Boom-Banzai": {
      "name": "Boom",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 5,
      "ability": "Boom",
      "special": {
        "name": "Banzai",
        "description": "",
        "color": "blue",
        "ranger": "Louise",
        "ability": "Banzai"
      }
    },
    "Get Cover-Water Bulb": {
      "name": "Get Cover",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "GetCover",
      "special": {
        "name": "Water Bulb",
        "description": "",
        "color": "blue",
        "ranger": "Louise",
        "ability": "WaterBulb"
      }
    },
    "Armor-Vampiric Move": {
      "name": "Armor",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "Armor",
      "special": {
        "name": "Vampiric Move",
        "description": "",
        "color": "purple",
        "ranger": "Bracula",
        "ability": "VampiricMove"
      }
    },
    "Boom-Vampiric Bite": {
      "name": "Boom",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 5,
      "ability": "Boom",
      "special": {
        "name": "Vampiric Bite",
        "description": "",
        "color": "purple",
        "ranger": "Bracula",
        "ability": "VampiricBite"
      }
    },
    "Hide-Corpse Cover": {
      "name": "Hide",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "Hide",
      "special": {
        "name": "Corpse Cover",
        "description": "",
        "color": "red",
        "ranger": "Javelin",
        "ability": "CorpseCover"
      }
    },
    "Aim-Scavenge": {
      "name": "Aim",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 3,
      "ability": "Aim",
      "special": {
        "name": "Scavenge",
        "description": "",
        "color": "red",
        "ranger": "Javelin",
        "ability": "Scavenge"
      }
    },
    "Aim-Avoid": {
      "name": "Aim",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 6,
      "ability": "Aim",
      "special": {
        "name": "Avoid",
        "description": "",
        "color": "yellowgreen",
        "ranger": "Elliot",
        "ability": "Avoid"
      }
    },
    "Bump Left-Steal": {
      "name": "Bump Left",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "BumpLeft",
      "special": {
        "name": "Steal",
        "description": "",
        "color": "yellowgreen",
        "ranger": "Elliot",
        "ability": "Steal"
      }
    },
    "Bump Right-Charge": {
      "name": "Bump Right",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "BumpRight",
      "special": {
        "name": "Charge",
        "description": "",
        "color": "green",
        "ranger": "Rei",
        "ability": "Charge"
      }
    },
    "Mine-Mega Mine": {
      "name": "Mine",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "Mine",
      "special": {
        "name": "Mega Mine",
        "description": "",
        "color": "green",
        "ranger": "Rei",
        "ability": "MegaMine"
      }
    },
    "Aim-Haunted": {
      "name": "Aim",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 3,
      "ability": "Aim",
      "special": {
        "name": "Haunted",
        "description": "",
        "color": "orange",
        "ranger": "Daiya",
        "ability": "Haunted"
      }
    },
    "Running-Boo": {
      "name": "Running",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 3,
      "ability": "Running",
      "special": {
        "name": "Boo",
        "description": "",
        "color": "orange",
        "ranger": "Daiya",
        "ability": "Boo"
      }
    },
    // Leader
    "Aim-Voodoo": {
      "name": "Aim",
      "block": 1,
      "description": "",
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
      "block": 1,
      "description": "",
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
      "block": 1,
      "description":
          "Take all forest cards in the pet line, reshuffle it with the pet deck. Put the new cards in the blank areas",
      "color": "gold",
      "cardNum": 2,
      "ability": "Illusion",
      "special": null
    },
    "Boom-Poison Darts": {
      "name": "Boom",
      "block": 1,
      "description": "",
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
    "Running-Air Shield": {
      "name": "Running",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "Running",
      "special": {
        "name": "Air Shield",
        "description":
            "Destroy the pet next to targeted pet (you can choose left or right) and the remove the used aim card, if u are Visca",
        "color": "orange",
        "ranger": "Visca",
        "ability": "AirShield"
      }
    },
    "Running-Air Compressor": {
      "name": "Running",
      "block": 1,
      "description": "",
      "color": "gold",
      "cardNum": 3,
      "ability": "Running",
      "special": {
        "name": "Air Compressor",
        "description":
            "Reshuffle 3 card of your chosen area which are side by side that side by side in the pet line with the pet deck. Put 3 new cards in the blank area, if u are Visca",
        "color": "orange",
        "ranger": "Visca",
        "ability": "AirCompressor"
      }
    },
    // Expansion
    "Fogging": {
      "name": "Fogging",
      "block": 1,
      "description":
          "Collect all pet cards that are in the \"Pet Line\" ( not including pet deck), reshuffle, and place the back in the \"Pet Line\" facing down",
      "color": "gold",
      "cardNum": 1,
      "ability": "Fogging",
      "special": null
    },
    "Machine Gun": {
      "name": "Machine Gun",
      "block": 2,
      "description": "Boom all aim cards on the pet line",
      "color": "gold",
      "cardNum": 1,
      "ability": "MachineGun",
      "special": null
    },
    "Wild": {
      "name": "Wild",
      "block": 1,
      "description": "This card acts as your special skill",
      "color": "gold",
      "cardNum": 1,
      "ability": "Wild",
      "special": null
    },
    "Hypnotize": {
      "name": "Hypnotize",
      "block": 1,
      "description": "Move any pet you choose one step forward or backward",
      "color": "gold",
      "cardNum": 1,
      "ability": "Hypnotize",
      "special": null
    },
  };
}
