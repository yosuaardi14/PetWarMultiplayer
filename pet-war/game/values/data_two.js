class DataTwo {
    static DEFAULT_MAX_LIFE = 5;

    static KING_MAX_TOKEN = 4;

    static CANVAS_RANGER = [
        {
            "name": "Daiya",
            "description": "\"Daiya\" is the owner of \"Soeharti\", their ability is to manipulate the pet line to create the worst scenario of their opponent.",
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
            "description": "\"Rei\" is the owner of \"Giro\", their ability is gear charge. They can use charge to kill more than one pet in one action.",
            "pet": "Giro",
            "color": "green",
            "cardNum": 1
        },
        {
            "name": "Javelin",
            "description": "\"Javelin\" is the owner of \"Vulcan\", their abilities are to scavenge the discard pile and the dead pet.",
            "pet": "Vulcan",
            "color": "red",
            "cardNum": 1
        },
        {
            "name": "Louise",
            "description": "\"Louise\" is the owner of \'King\", their ability is to jump over. King has a dead penalty after three rounds, however he can flee and kill with ease.",
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
        }
    ];

    static PET = {
        "Jungle": {
            "name": "Jungle",
            "description": "",
            "color": "grey",
            "ranger": "",
            "life": 0,
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
        }
    };

    static ACTION = {
        "Doom": {
            "name": "Doom",
            "block": 1,
            "description": "",
            "color": "gold",
            "cardNum": 1,
            "ability": "Doom",
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
        "Typhoon": {
            "name": "Typhoon",
            "block": 1,
            "description": "",
            "color": "gold",
            "cardNum": 1,
            "ability": "Typhoon",
            "special": null
        },
        "Lunch Time": {
            "name": "Lunch Time",
            "block": 1,
            "description": "",
            "color": "gold",
            "cardNum": 1,
            "ability": "LunchTime",
            "special": null
        },
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
        "Ressurect": {
            "name": "Ressurect",
            "block": 1,
            "description": "",
            "color": "gold",
            "cardNum": 2,
            "ability": "Ressurect",
            "special": null,
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
        }
    };
}
module.exports = DataTwo;