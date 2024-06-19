class Data {
    static DEFAULT_MAX_LIFE = 5;
    
    static GRENADE_TURN = 4;

    static CANVAS_RANGER = [
        {
            "name": "Dobel",
            "description": "Ixora & Ixano, (known as \"Dobel\") are the owner of \"Sharpnell\" that has the ability of speed. They'll reach the safety zone in no time.",
            "pet": "Sharpnell",
            "color": "orange",
            "cardNum": 1
        },
        {
            "name": "Tsunaryo",
            "description": "\"Tsuna\" is the owner of \"LPG-Zord\" that has the ability of explosion. It/he can kill more than one pet in one action.",
            "pet": "LPG-Zord",
            "color": "yellowgreen",
            "cardNum": 1
        },
        {
            "name": "Vonstaire",
            "description": "\"Vonstaire\" is the owner of \"Sunge\" that has the abilities to escape and resurrect. Prepare to face them again, and again, and again...",
            "pet": "Sunge",
            "color": "deeppink",
            "cardNum": 1
        },
        {
            "name": "Ashtray",
            "description": "\"Ashtray\" is the owner of \"Minion\" that has the ability to disturb the other pet(s). Minion is the most annoying pet in this game.",
            "pet": "Minion",
            "color": "red",
            "cardNum": 1
        },
        {
            "name": "Bonci",
            "description": "\"Bonci\" is the owner of \"Waung\" that has the ability to survive. One attack is not enough to get rid of them.",
            "pet": "Waung",
            "color": "deepblue",
            "cardNum": 1
        },
        {
            "name": "Neo",
            "description": "\"Neo\" is the owner of \"Paleo\" that has the ability to kill another pet with its/his super power!",
            "pet": "Paleo",
            "color": "deeppurple",
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
            "color": "deepblue",
            "ranger": "Bonci",
            "life": 1,
            "cardNum": 5
        },
        "Paleo": {
            "name": "Paleo",
            "description": "",
            "color": "deeppurple",
            "ranger": "Neo",
            "life": 1,
            "cardNum": 5
        }
    };

    static ACTION = {
        "Aim": {
            "name": "Aim",
            "block": 1,
            "description": "Put this card above the pet you want to be targeted in the \"Pet Line\"",
            "color": "gold",
            "cardNum": 8, //5,
            "ability": "Aim",
            "special": null
        },
        "Boom": {
            "name": "Boom",
            "block": 1,
            "description": "Use this card to destroy the targeted pet. Remove the aim card",
            "color": "gold",
            "cardNum": 8, //6,
            "ability": "Boom",
            "special": null
        },
        "Doom": {
            "name": "Doom",
            "block": 1,
            "description": "Destroying target whether it was aimed or not. If the card was aimed, remove the aim card also",
            "color": "gold",
            "cardNum": 1,
            "ability": "Doom",
            "special": null
        },
        "Two Aims": {
            "name": "Two Aims",
            "block": 2,
            "description": "Put TWO AIMS card sideways above any adjacent pets, tilt back to the normal position if one of them was destroyed",
            "color": "gold",
            "cardNum": 2, //1,
            "ability": "TwoAim",
            "special": null
        },
        "Two Booms": {
            "name": "Two Booms",
            "block": 2,
            "description": "Destory any two adjacent targeted pets, both with aim cards above them. Remove the aim cards. If there's no any adjacent aim card if become single boom",
            "color": "gold",
            "cardNum": 1,
            "ability": "TwoBoom",
            "special": null
        },
        "Miss": {
            "name": "Miss",
            "block": 1,
            "description": "Destroy the pet next to the targeted pet (left or right) and the remove the used aim card",
            "color": "gold",
            "cardNum": 1,
            "ability": "Miss",
            "special": null
        },
        "Hide": {
            "name": "Hide",
            "block": 1,
            "description": "Cover your chosen pet with this card. The covered pet can't be destroyed until this card removed after one round",
            "color": "gold",
            "cardNum": 1,
            "ability": "Hide",
            "special": null
        },
        "Running": {
            "name": "Running",
            "block": 1,
            "description": "Move forward all cards in the \"pet line\" remove the card in the very from of the line to the bottom of the deck, replace the blank spot with new card from deck",
            "color": "gold",
            "cardNum": 3,
            "ability": "Running",
            "special": null
        },
        "Go Forward": {
            "name": "Go Forward",
            "block": 1,
            "description": "Swap YOUR pet with any card on the left side",
            "color": "gold",
            "cardNum": 2, //1,
            "ability": "GoForward",
            "special": null
        },
        "Go Backward": {
            "name": "Go Backward",
            "block": 1,
            "description": "Swap YOUR pet with any card on the right side",
            "color": "gold",
            "cardNum": 2,
            "ability": "GoBackward",
            "special": null
        },
        "Move The Pet": {
            "name": "Move The Pet",
            "block": 1,
            "description": "Rearrange all pet cards in the \"Pet Line\" anyway you like. Aim cards don't move",
            "color": "gold",
            "cardNum": 2, //1,
            "ability": "MoveThePet",
            "special": null
        },
        "Typhoon": {
            "name": "Typhoon",
            "block": 1,
            "description": "Reshuffle all the pet cards in the \"Pet Line\" and the pet deck. Draw six new pet cards into the line",
            "color": "gold",
            "cardNum": 1,
            "ability": "Typhoon",
            "special": null
        },
        "Get Cover": {
            "name": "Get Cover",
            "block": 1,
            "description": "Put YOUR pet underneath the nearest pet. Your pet moves along with the covering pet, and remain hidden until the covering is destroyed",
            "color": "gold",
            "cardNum": 2,
            "ability": "GetCover",
            "special": null
        },
        "Armor": {
            "name": "Armor",
            "block": 1,
            "description": "Cover your chosen pet to get additional life +1",
            "color": "gold",
            "cardNum": 3, //1,
            "ability": "Armor",
            "special": null
        },
        "Lunch Time": {
            "name": "Lunch Time",
            "block": 1,
            "description": "Remove all aim cards in the \"Pet Line\"",
            "color": "gold",
            "cardNum": 2, //1,
            "ability": "LunchTime",
            "special": null
        },
        "Grenade-Mega Grenade": {
            "name": "Grenade",
            "block": 1,
            "description": "Put this card below any pet card in the \"Pet Line\". When the third player ends their turn after this card was placed, remove the grenade card and the pet above it. (has no effect to the forest card)",
            "color": "gold",
            "cardNum": 2,
            "ability": "Grenade",
            "special": {
                "name": "Mega Grenade",
                "description": "Put this card below any pet card in the \"Pet Line\". When the third player ends their turn after this card was placed, remove the grenade card and three pet above it. (has no effect to the forest card), if u are Tsuna",
                "color": "yellowgreen",
                "ranger": "Tsunaryo",
                "ability": "MegaGrenade"
            }
        },
        "Aim-Kamikaze": {
            "name": "Aim",
            "block": 1,
            "description": "Put this card above the pet you want to be targeted in the \"Pet Line\"",
            "color": "gold",
            "cardNum": 3,
            "ability": "Aim",
            "special": {
                "name": "Kamikaze",
                "description": "Cover LPG-Zord with this card. If LPG-Zord was destroyed, it and its both sides including all attached to the are destroyed, if u are Tsuna",
                "color": "yellowgreen",
                "ranger": "Tsunaryo",
                "ability": "Kamikaze"
            }
        },
        "Ressurect-Double Resurrect": {
            "name": "Ressurect",
            "block": 1,
            "description": "Revive one of your pet that has been removed from the game to the bottom of the pet deck",
            "color": "gold",
            "cardNum": 2,
            "ability": "Ressurect",
            "special": {
                "name": "Double Resurrect",
                "description": "Put two 'Sunge' that has been removed from the game to the bottom of the pet deck, if u are Vonstaire",
                "color": "deeppink",
                "ranger": "Vonstaire",
                "ability": "DoubleRessurect"
            }
        },
        "Go Forward-Go Anyward": {
            "name": "Go Forward",
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
        "Go Backward-Go Anyward": {
            "name": "Go Backward",
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
        "Boom-Over Shock": {
            "name": "Boom",
            "block": 1,
            "description": "Use this card to destroy the targeted pet. Remove the aim card",
            "color": "gold",
            "cardNum": 3,
            "ability": "Boom",
            "special": {
                "name": "Over Shock",
                "description": "Destroying target whether it was aimed or not. If the card was aimed, remove the aim card also, if u are Neo",
                "color": "deeppurple",
                "ranger": "Neo",
                "ability": "OverShock"
            }
        },
        "Armor-Shield": {
            "name": "Armor",
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
        "Hide-Master Hide": {
            "name": "Hide",
            "block": 1,
            "description": "Cover your chosen pet with this card. The covered pet can't be destroyed until this card removed after one round",
            "color": "gold",
            "cardNum": 2,
            "ability": "Hide",
            "special": {
                "name": "Master Hide",
                "description": "Put \"Waung\" underneath any pet. It moves along with the covering and remains hidden until the pet that cover it is removed, if u are Bonci",
                "color": "deepblue",
                "ranger": "Bonci",
                "ability": "MasterHide"
            }
        },
        "Aim-Trap": {
            "name": "Aim",
            "block": 1,
            "description": "Put this card above the pet you want to be targeted in the \"Pet Line\"",
            "color": "gold",
            "cardNum": 4,
            "ability": "Aim",
            "special": {
                "name": "Trap",
                "description": "Cover your targeted pet with this card, the pet can't be moved by any action cards until the end of the Ashtray's next turn, if u are Ashtray",
                "color": "red",
                "ranger": "Ashtray",
                "ability": "Trap"
            }
        },
        "Bump Left-Moving Aim": {
            "name": "Bump Left",
            "block": 1,
            "description": "Move any aim card one step to the left. If there is another aim card on the position, nothing happens",
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
        "Bump Right-Moving Aim": {
            "name": "Bump Right",
            "block": 1,
            "description": "Move any aim card one step to the right. If there is another aim card on the position, nothing happens",
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
            "block": 1,
            "description": "Move forward all cards in the \"pet line\" remove the card in the very from of the line to the bottom of the deck, replace the blank spot with new card from deck",
            "color": "gold",
            "cardNum": 3,
            "ability": "Running",
            "special": {
                "name": "Escape",
                "description": "Take \"Sharpnell\" from the \"Pet Line\" put it in the pet deck and reshuffle, take one card from the pet deck to fill the blank spot, if u are Dobel",
                "color": "orange",
                "ranger": "Dobel",
                "ability": "Escape"
            }
        },
        "Running-Double Run": {
            "name": "Running",
            "block": 1,
            "description": "Move forward all cards in the \"pet line\" remove the card in the very from of the line to the bottom of the deck, replace the blank spot with new card from deck",
            "color": "gold",
            "cardNum": 2,
            "ability": "Running",
            "special": {
                "name": "Double Run",
                "description": "Move forward all cards in the \"pet line\" remove two cards in the very front of the line to the bottom of the deck, replace the blank spot with two new card from deck, if u are Dobel",
                "color": "orange",
                "ranger": "Dobel",
                "ability": "DoubleRun"
            }
        },
    };
}
module.exports = Data;
