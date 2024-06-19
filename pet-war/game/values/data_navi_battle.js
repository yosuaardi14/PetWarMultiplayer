class DataNaviBattle {
    static DEFAULT_MAX_LIFE = 5;

    static POISON_DART_TURNS = 3;

    static CANVAS_RANGER = [
        {
            "name": "Visca",
            "description": "\"Visca\" is the owner of \"Lavu\". Their ability is to use and manipulate air as the source of their power.",
            "pet": "Lavu",
            "color": "orange",
            "cardNum": 1
        },
        {
            "name": "Lynn",
            "description": "\"Lynn\" is the owner of \"Raven\". Their ability is to control poison darts as their weapons.",
            "pet": "Raven",
            "color": "purple",
            "cardNum": 1
        }
    ];

    static PET = {
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

    static ACTION = {
        "Illusion": {
            "name": "Illusion",
            "block": 1,
            "description": "Take all forest cards in the pet line, reshuffle it with the pet deck. Put the new cards in the blank areas",
            "color": "gold",
            "cardNum": 2,
            "ability": "Illusion",
            "special": null
        },
        "Boom-Poison Darts": {
            "name": "Boom",
            "block": 1,
            "description": "Use this card to destroy the targeted pet. Remove the aim card",
            "color": "gold",
            "cardNum": 3,
            "ability": "Boom",
            "special": {
                "name": "Poison Darts",
                "description": "Put 1 token on top of a pet that is on 3 of your chosen area which are side by side. Add 1 token every round. The pet dies when it receives a 4th token, if u are Lynn",
                "color": "purple",
                "ranger": "Lynn",
                "ability": "PoisonDarts"
            }
        },
        "Running-Air Shield": {
            "name": "Running",
            "block": 1,
            "description": "Move forward all cards in the \"pet line\" remove the card in the very from of the line to the bottom of the deck, replace the blank spot with new card from deck",
            "color": "gold",
            "cardNum": 2,
            "ability": "Running",
            "special": {
                "name": "Air Shield",
                "description": "Destroy the pet next to targeted pet (you can choose left or right) and the remove the used aim card, if u are Visca",
                "color": "orange",
                "ranger": "Visca",
                "ability": "AirShield"
            }
        },
        "Running-Air Compressor": {
            "name": "Running",
            "block": 1,
            "description": "Move forward all cards in the \"pet line\" remove the card in the very from of the line to the bottom of the deck, replace the blank spot with new card from deck",
            "color": "gold",
            "cardNum": 3,
            "ability": "Running",
            "special": {
                "name": "Air Compressor",
                "description": "Reshuffle 3 card of your chosen area which are side by side that side by side in the pet line with the pet deck. Put 3 new cards in the blank area, if u are Visca",
                "color": "orange",
                "ranger": "Visca",
                "ability": "AirCompressor"
            }
        }
    };
}
module.exports = DataNaviBattle;
