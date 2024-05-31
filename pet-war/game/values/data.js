class Data {
    static DEFAULT_MAX_LIFE = 5;

    static GRENADE_TURN = 4;

    static CANVAS_RANGER = [
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
        "Sharpnell": {
            "name": "Sharpnell",
            "description": "",
            "color": "orange",
            "ranger": "Dobel",
            "cardNum": 5
        },
        "Lpg-Zord": {
            "name": "Lpg-Zord",
            "description": "",
            "color": "yellowgreen",
            "ranger": "Tsunaryo",
            "cardNum": 5
        },
        "Sunge": {
            "name": "Sunge",
            "description": "",
            "color": "deeppink",
            "ranger": "Von staire",
            "cardNum": 5
        },
        "Minion": {
            "name": "Minion",
            "description": "",
            "color": "red",
            "ranger": "Ashtray",
            "cardNum": 5
        },
        "Waung": {
            "name": "Waung",
            "description": "",
            "color": "blue",
            "ranger": "Bonci",
            "cardNum": 5
        },
        "Paleo": {
            "name": "Paleo",
            "description": "",
            "color": "purple",
            "ranger": "Neo",
            "cardNum": 5
        }
    };

    static ACTION = {
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
                "ranger": "Von staire",
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
                "ranger": "Von staire",
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
                "ranger": "Von staire",
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
    };
}
module.exports = Data;