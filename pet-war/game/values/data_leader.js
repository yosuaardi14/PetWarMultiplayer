class DataLeader {
    static DEFAULT_MAX_LIFE = 5;

    static CANVAS_RANGER = [
        {
            "name": "Gaoh",
            "description": "\"Gaoh\" is the leader of villains and owner of \"Vao\". Their ability is to spread fear with voodoo magic.",
            "pet": "Vao",
            "color": "black",
            "cardNum": 1
        },
        {
            "name": "Mazo",
            "description": "\"Mazo\" is the leader of heroes and owner of \"Menejeur\". Strong with 2 lives and special area attacks. Menejeur will be stucked at the end of the pet line. Use Typhoon card to return it to deck.",
            "pet": "Menejeur",
            "color": "silver",
            "cardNum": 1
        }
    ];

    static PET = {
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
        "Aim-Voodoo": {
            "name": "Aim",
            "block": 1,
            "description": "Put this card above the pet you want to be targeted in the \"Pet Line\"",
            "color": "gold",
            "cardNum": 4,
            "ability": "Aim",
            "special": {
                "name": "Voodoo",
                "description": "Take three cards at the top of pet deck and choose one pet among them to die immediately. You have to use this skill if u are Gaoh",
                "color": "black",
                "ranger": "Gaoh",
                "ability": "Voodoo"
            }
        },
        "Boom-Apocalypse": {
            "name": "Boom",
            "block": 1,
            "description": "Use this card to destroy the targeted pet. Remove the aim card",
            "color": "gold",
            "cardNum": 3,
            "ability": "Boom",
            "special": {
                "name": "Apocalypse",
                "description": "Give one damage to all pet in the pet line. Remove all aim cards in the pet line, if u are Mazo",
                "color": "silver",
                "ranger": "Mazo",
                "ability": "Apocalypse"
            }
        },
    };
}
module.exports = DataLeader;
