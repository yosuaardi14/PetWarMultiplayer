class DataSpinOff {
    static DEFAULT_MAX_LIFE = 5;
    
    static POISON_DART_TURNS = 3;

    static CANVAS_RANGER = [
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
            "description": "",
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
            "cardNum": 5,
            "ability": "Boom",
            "special": {
                "name": "Poison Darts",
                "description": "",
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
                "description": "",
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
                "description": "",
                "color": "orange",
                "ranger": "Visca",
                "ability": "AirCompressor"
            }
        }
    };
}
module.exports = DataSpinOff;