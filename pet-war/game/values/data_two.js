class DataTwo {
    static DEFAULT_MAX_LIFE = 5;

    static CANVAS_RANGER = [
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
        }
    ];

    static PET = {
        "Jungle": {
            "name": "Jungle",
            "description": "",
            "color": "grey",
            "ranger": "",
            "cardNum": 5
        },
        "Soeharti": {
            "name": "Soeharti",
            "description": "",
            "color": "orange",
            "ranger": "Daiya",
            "cardNum": 5
        },
        "Marmar": {
            "name": "Marmar",
            "description": "",
            "color": "yellowgreen",
            "ranger": "Elliot",
            "cardNum": 5
        },
        "Giro": {
            "name": "Giro",
            "description": "",
            "color": "green",
            "ranger": "Rei",
            "cardNum": 5
        },
        "Vulcan": {
            "name": "Vulcan",
            "description": "",
            "color": "red",
            "ranger": "Javelin",
            "cardNum": 5
        },
        "King": {
            "name": "King",
            "description": "",
            "color": "blue",
            "ranger": "Louise",
            "cardNum": 5
        },
        "Bracula": {
            "name": "Bracula",
            "description": "",
            "color": "purple",
            "ranger": "Bratz",
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
                "ranger": "Bratz",
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
                "ranger": "Bratz",
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