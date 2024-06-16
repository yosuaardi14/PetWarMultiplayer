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
      "description": "",
      "pet": "Sharpnell",
      "color": "orange",
      "cardNum": 1
    },
    {
      "name": "Tsunaryo",
      "description": "",
      "pet": "Lpg-Zord",
      "color": "yellowgreen",
      "cardNum": 1
    },
    {
      "name": "Von staire",
      "description": "",
      "pet": "Sunge",
      "color": "deeppink",
      "cardNum": 1
    },
    {
      "name": "Ashtray",
      "description": "",
      "pet": "Minion",
      "color": "red",
      "cardNum": 1
    },
    {
      "name": "Bonci",
      "description": "",
      "pet": "Waung",
      "color": "blue",
      "cardNum": 1
    },
    {
      "name": "Neo",
      "description": "",
      "pet": "Paleo",
      "color": "purple",
      "cardNum": 1
    },
    {
      "name": "Daiya",
      "description": "",
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
      "description": "",
      "pet": "Giro",
      "color": "green",
      "cardNum": 1
    },
    {
      "name": "Javelin",
      "description": "",
      "pet": "Vulcan",
      "color": "red",
      "cardNum": 1
    },
    {
      "name": "Louise",
      "description": "",
      "pet": "King",
      "color": "blue",
      "cardNum": 1
    },
    {
      "name": "Bratz",
      "description": "",
      "pet": "Bracula",
      "color": "purple",
      "cardNum": 1
    },
    {
      "name": "Gaoh",
      "description": "",
      "pet": "Vao",
      "color": "black",
      "cardNum": 1
    },
    {
      "name": "Mazo",
      "description": "",
      "pet": "Menejeur",
      "color": "silver",
      "cardNum": 1
    },
    {
      "name": "Visca",
      "description": "",
      "pet": "Lavu",
      "color": "orange",
      "cardNum": 1
    },
    {
      "name": "Lynn",
      "description": "",
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
    "Lpg-Zord": {
      "name": "Lpg-Zord",
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
      "ranger": "Von staire",
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
    "Bracula": {
      "name": "Bracula",
      "description": "",
      "color": "purple",
      "ranger": "Bratz",
      "life": 1,
      "cardNum": 5
    },
    "Enchanted Forest": {
      "name": "Enchanted Forest",
      "description": "",
      "color": "grey",
      "ranger": "",
      "life": 0,
      "cardNum": 5
    },
    "Maze Forest": {
      "name": "Maze Forest",
      "description": "",
      "color": "grey",
      "ranger": "",
      "life": 0,
      "cardNum": 5
    },
    "Thorn Forest": {
      "name": "Thorn Forest",
      "description": "",
      "color": "grey",
      "ranger": "",
      "life": 0,
      "cardNum": 5
    },
    "Cursed Forest": {
      "name": "Cursed Forest",
      "description": "",
      "color": "grey",
      "ranger": "",
      "life": 0,
      "cardNum": 5
    },
    "Catapult Forest": {
      "name": "Catapult Forest",
      "description": "",
      "color": "grey",
      "ranger": "",
      "life": 0,
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
    }
  };

  static const Map<String, Map<String, dynamic>> ACTION = {
    "Aim": {
      "name": "Aim",
      "description": "",
      "color": "gold",
      "cardNum": 8, //5,
      "ability": "Aim",
      "special": null
    },
    "Boom": {
      "name": "Boom",
      "description": "",
      "color": "gold",
      "cardNum": 8, //6,
      "ability": "Boom",
      "special": null
    },
    "Doom": {
      "name": "Doom",
      "description": "",
      "color": "gold",
      "cardNum": 1,
      "ability": "Doom",
      "special": null
    },
    "Two Aim": {
      "name": "Two Aim",
      "description": "",
      "color": "gold",
      "cardNum": 2, //1,
      "ability": "TwoAim",
      "special": null
    },
    "Two Boom": {
      "name": "Two Boom",
      "description": "",
      "color": "gold",
      "cardNum": 1,
      "ability": "TwoBoom",
      "special": null
    },
    "Miss": {
      "name": "Miss",
      "description": "",
      "color": "gold",
      "cardNum": 1,
      "ability": "Miss",
      "special": null
    },
    "Running": {
      "name": "Running",
      "description": "",
      "color": "gold",
      "cardNum": 3,
      "ability": "Running",
      "special": null
    },
    "Go Forward": {
      "name": "Go Forward",
      "description": "",
      "color": "gold",
      "cardNum": 2, //1,
      "ability": "GoForward",
      "special": null
    },
    "Go Backward": {
      "name": "Go Backward",
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "GoBackward",
      "special": null
    },
    "Move The Pet": {
      "name": "Move The Pet",
      "description": "",
      "color": "gold",
      "cardNum": 2, //1,
      "ability": "MoveThePet",
      "special": null
    },
    "Typhoon": {
      "name": "Typhoon",
      "description": "",
      "color": "gold",
      "cardNum": 1,
      "ability": "Typhoon",
      "special": null
    },
    "Get Cover": {
      "name": "Get Cover",
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "GetCover",
      "special": null
    },
    "Armor": {
      "name": "Armor",
      "description": "",
      "color": "gold",
      "cardNum": 3, //1,
      "ability": "Armor",
      "special": null
    },
    "Lunch Time": {
      "name": "Lunch Time",
      "description": "",
      "color": "gold",
      "cardNum": 2, //1,
      "ability": "LunchTime",
      "special": null
    },
    "Grenade-Mega Grenade": {
      "name": "Grenade-Mega Grenade",
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "Grenade",
      "special": {
        "description": "",
        "color": "yellowgreen",
        "ranger": "Tsunaryo",
        "ability": "MegaGrenade"
      }
    },
    "Aim-Kamikaze": {
      "name": "Aim-Kamikaze",
      "description": "",
      "color": "gold",
      "cardNum": 3,
      "ability": "Aim",
      "special": {
        "description": "",
        "color": "yellowgreen",
        "ranger": "Tsunaryo",
        "ability": "Kamikaze"
      }
    },
    "Ressurect-Double Resurrect": {
      "name": "Ressurect-Double Resurrect",
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "Ressurect",
      "special": {
        "description": "",
        "color": "deeppink",
        "ranger": "Von staire",
        "ability": "DoubleResurrect"
      }
    },
    "Go Forward-Go Anyward": {
      "name": "Go Forward-Go Anyward",
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "GoForward",
      "special": {
        "description": "",
        "color": "deeppink",
        "ranger": "Von staire",
        "ability": "GoAnyward"
      }
    },
    "Go Backward-Go Anyward": {
      "name": "Go Backward-Go Anyward",
      "description": "",
      "color": "gold",
      "cardNum": 1,
      "ability": "GoBackward",
      "special": {
        "description": "",
        "color": "deeppink",
        "ranger": "Von staire",
        "ability": "GoAnyward"
      }
    },
    "Boom-Over Shock": {
      "name": "Boom-Over Shock",
      "description": "",
      "color": "gold",
      "cardNum": 3,
      "ability": "Boom",
      "special": {
        "description": "",
        "color": "purple",
        "ranger": "Neo",
        "ability": "OverShock"
      }
    },
    "Armor-Shield": {
      "name": "Armor-Shield",
      "description": "",
      "color": "gold",
      "cardNum": 1,
      "ability": "Armor",
      "special": {
        "description": "",
        "color": "blue",
        "ranger": "Bonci",
        "ability": "Shield"
      }
    },
    "Hide-Master Hide": {
      "name": "Hide-Master Hide",
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "Hide",
      "special": {
        "description": "",
        "color": "blue",
        "ranger": "Bonci",
        "ability": "MasterHide"
      }
    },
    "Aim-Trap": {
      "name": "Aim-Trap",
      "description": "",
      "color": "gold",
      "cardNum": 4,
      "ability": "Aim",
      "special": {
        "description": "",
        "color": "red",
        "ranger": "Ashtray",
        "ability": "Trap"
      }
    },
    "Bump Left-Moving Aim": {
      "name": "Bump Left-Moving Aim",
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "BumpLeft",
      "special": {
        "description": "",
        "color": "red",
        "ranger": "Ashtray",
        "ability": "MovingAim"
      }
    },
    "Bump Right-Moving Aim": {
      "name": "Bump Right-Moving Aim",
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "BumpRight",
      "special": {
        "description": "",
        "color": "red",
        "ranger": "Ashtray",
        "ability": "MovingAim"
      }
    },
    "Running-Escape": {
      "name": "Running-Escape",
      "description": "",
      "color": "gold",
      "cardNum": 3,
      "ability": "Running",
      "special": {
        "description": "",
        "color": "orange",
        "ranger": "Dobel",
        "ability": "Escape"
      }
    },
    "Running-Double Run": {
      "name": "Running-Double Run",
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "Running",
      "special": {
        "description": "",
        "color": "orange",
        "ranger": "Dobel",
        "ability": "DoubleRun"
      }
    },
  };

  static const Map<String, Map<String, dynamic>> ACTION_NEW = {
    "Aim": {
      "name": "Aim",
      "description": "",
      "color": "gold",
      "cardNum": 8, //5,
      "ability": "Aim",
      "special": null
    },
    "Boom": {
      "name": "Boom",
      "description": "",
      "color": "gold",
      "cardNum": 8, //6,
      "ability": "Boom",
      "special": null
    },
    "Doom": {
      "name": "Doom",
      "description": "",
      "color": "gold",
      "cardNum": 1,
      "ability": "Doom",
      "special": null
    },
    "Two Aim": {
      "name": "Two Aim",
      "description": "",
      "color": "gold",
      "cardNum": 2, //1,
      "ability": "TwoAim",
      "special": null
    },
    "Two Boom": {
      "name": "Two Boom",
      "description": "",
      "color": "gold",
      "cardNum": 1,
      "ability": "TwoBoom",
      "special": null
    },
    "Miss": {
      "name": "Miss",
      "description": "",
      "color": "gold",
      "cardNum": 1,
      "ability": "Miss",
      "special": null
    },
    "Running": {
      "name": "Running",
      "description": "",
      "color": "gold",
      "cardNum": 3,
      "ability": "Running",
      "special": null
    },
    "Go Forward": {
      "name": "Go Forward",
      "description": "",
      "color": "gold",
      "cardNum": 2, //1,
      "ability": "GoForward",
      "special": null
    },
    "Go Backward": {
      "name": "Go Backward",
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "GoBackward",
      "special": null
    },
    "Move The Pet": {
      "name": "Move The Pet",
      "description": "",
      "color": "gold",
      "cardNum": 2, //1,
      "ability": "MoveThePet",
      "special": null
    },
    "Typhoon": {
      "name": "Typhoon",
      "description": "",
      "color": "gold",
      "cardNum": 1,
      "ability": "Typhoon",
      "special": null
    },
    "Get Cover": {
      "name": "Get Cover",
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "GetCover",
      "special": null
    },
    "Armor": {
      "name": "Armor",
      "description": "",
      "color": "gold",
      "cardNum": 3, //1,
      "ability": "Armor",
      "special": null
    },
    "Lunch Time": {
      "name": "Lunch Time",
      "description": "",
      "color": "gold",
      "cardNum": 2, //1,
      "ability": "LunchTime",
      "special": null
    },
    "Grenade-Mega Grenade": {
      "name": "Grenade",
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
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "Ressurect",
      "special": {
        "name": "Double Resurrect",
        "description": "",
        "color": "deeppink",
        "ranger": "Von staire",
        "ability": "DoubleResurrect"
      }
    },
    "Go Forward-Go Anyward": {
      "name": "Go Forward",
      "description": "",
      "color": "gold",
      "cardNum": 2,
      "ability": "GoForward",
      "special": {
        "name": "Go Anyward",
        "description": "",
        "color": "deeppink",
        "ranger": "Von staire",
        "ability": "GoAnyward"
      }
    },
    "Go Backward-Go Anyward": {
      "name": "Go Backward",
      "description": "",
      "color": "gold",
      "cardNum": 1,
      "ability": "GoBackward",
      "special": {
        "name": "Go Anyward",
        "description": "",
        "color": "deeppink",
        "ranger": "Von staire",
        "ability": "GoAnyward"
      }
    },
    "Boom-Over Shock": {
      "name": "Boom",
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
  };
}
