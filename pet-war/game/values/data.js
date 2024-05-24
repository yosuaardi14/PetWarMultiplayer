class Data {
    static DEFAULT_MAX_LIFE = 5;
    
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
        "Boom-Overshock": {
            "name": "Boom-Overshock",
            "description": "",
            "color": "gold",
            "cardNum": 3,
            "ability": "Boom",
            "special": {
                "description": "",
                "color": "purple",
                "ranger": "Neo",
                "ability": "Overshock"
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

    static ACTION_NEW = {
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
        "Boom-Overshock": {
            "name": "Boom",
            "description": "",
            "color": "gold",
            "cardNum": 3,
            "ability": "Boom",
            "special": {
                "name": "Overshock",
                "description": "",
                "color": "purple",
                "ranger": "Neo",
                "ability": "Overshock"
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
module.exports = Data;