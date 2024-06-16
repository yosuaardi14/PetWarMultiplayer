class DataUltimateSeries {
    static DEFAULT_MAX_LIFE = 5;

    static CANVAS_RANGER = [
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
        }
    ];

    static PET = {
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
        }
    };

    static ACTION = {
        "Fogging": {
            "name": "Fogging",
            "block": 1,
            "description": "",
            "color": "gold",
            "cardNum": 1,
            "ability": "Fogging",
            "special": null
        },
        "Machine Gun": {
            "name": "Machine Gun",
            "block": 2,
            "description": "",
            "color": "gold",
            "cardNum": 1,
            "ability": "MachineGun",
            "special": null
        },
        "Wild": {
            "name": "Wild",
            "block": 1,
            "description": "",
            "color": "gold",
            "cardNum": 1,
            "ability": "Wild",
            "special": null
        },
        "Hypnotize": {
            "name": "Hypnotize",
            "block": 1,
            "description": "",
            "color": "gold",
            "cardNum": 1,
            "ability": "Hypnotize",
            "special": null
        },
        "Aim-Voodoo": {
            "name": "Aim",
            "block": 1,
            "description": "",
            "color": "gold",
            "cardNum": 4,
            "ability": "Aim",
            "special": {
                "name": "Voodoo",
                "description": "",
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
                "description": "",
                "color": "silver",
                "ranger": "Mazo",
                "ability": "Apocalypse"
            }
        },
    };
}
module.exports = DataUltimateSeries;