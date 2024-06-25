class DataExpansion {
    static CANVAS_RANGER = [
        {
            "name": "Double",
            "description": "Ixora & Ixano, (known as \"Double\") are the owner of \"Sharpnell\" that has the ability of speed. They'll reach the safety zone in no time.",
            "pet": "Sharpnell",
            "color": "orange",
            "cardNum": 1
        },
        {
            "name": "Kobong",
            "description": "\"Kobong\" is the owner of \"LPG-Zord\" that has the ability of explosion. It/he can kill more than one pet in one action.",
            "pet": "LPG-Zord",
            "color": "yellowgreen",
            "cardNum": 1
        },
        {
            "name": "Soulbender R",
            "description": "\"Soulbender R\" is the owner of \"Sunge\" that has the abilities to escape and resurrect. Prepare to face them again, and again, and again...",
            "pet": "Sunge",
            "color": "deeppink",
            "cardNum": 1
        },
        {
            "name": "Ashtranger",
            "description": "\"Ashtranger\" is the owner of \"Minion\" that has the ability to disturb the other pet(s). Minion is the most annoying pet in this game.",
            "pet": "Minion",
            "color": "red",
            "cardNum": 1
        },
        {
            "name": "Roxxeon Kaizer",
            "description": "\"Roxxeon Kaizer\" is the owner of \"Waung\" that has the ability to survive. One attack is not enough to get rid of them.",
            "pet": "Waung",
            "color": "deepblue",
            "cardNum": 1
        },
        {
            "name": "Electrode",
            "description": "\"Electrode\" is the owner of \"Paleo\" that has the ability to kill another pet with its/his super power!",
            "pet": "Paleo",
            "color": "deeppurple",
            "cardNum": 1
        },
         {
            "name": "Dewi Ruh Bengi",
            "description": "\"Dewi Ruh Bengi\" is the owner of \"Soeharti\", their ability is to manipulate the pet line to create the worst scenario of their opponent.",
            "pet": "Soeharti",
            "color": "yellow",
            "cardNum": 1
        },
        {
            "name": "Archetype",
            "description": "\"Archetype\" is the owner of \"Marmar\", their abilities are to steal other pet's protection and discard aims.",
            "pet": "Marmar",
            "color": "lightgreen",
            "cardNum": 1
        },
        {
            "name": "G.R.",
            "description": "\"G.R.\" is the owner of \"Giro\", their ability is gear charge. They can use charge to kill more than one pet in one action.",
            "pet": "Giro",
            "color": "green",
            "cardNum": 1
        },
        {
            "name": "Zero-Arms",
            "description": "\"Zero-Arms\" is the owner of \"Vulcan\", their abilities are to scavenge the discard pile and the dead pet.",
            "pet": "Vulcan",
            "color": "brown",
            "cardNum": 1
        },
        {
            "name": "Camiere",
            "description": "\"Camiere\" is the owner of \'King\", their ability is to jump over. King has a dead penalty after three rounds, however he can flee and kill with ease.",
            "pet": "King",
            "color": "blue",
            "cardNum": 1
        },
        {
            "name": "Braculla",
            "description": "\"Braculla\" is the owner of \"Bratz\", their ability is vampiric skill that allows him to absorb other pet's life.",
            "pet": "Bratz",
            "color": "lightpurple",
            "cardNum": 1
        }
    ];

    static PET = {
        "Enchanted Forest": {
            "name": "Enchanted Forest",
            "description": "If any pet swaps with this forest, that player take one aim card in the discard pile and put in pet line in any order",
            "color": "grey",
            "ranger": "",
            "life": 0,
            "cardNum": 1
        },
        "Maze Forest": {
            "name": "Maze Forest",
            "description": "If any pet swaps with this forest, take all cards on the pet line, shuffle and deal again into the pet line",
            "color": "grey",
            "ranger": "",
            "life": 0,
            "cardNum": 1
        },
        "Thorn Forest": {
            "name": "Thorn Forest",
            "description": "No pet can go through this forest, unless King while using \"banzai\"",
            "color": "grey",
            "ranger": "",
            "life": 0,
            "cardNum": 1
        },
        "Cursed Forest": {
            "name": "Cursed Forest",
            "description": "If any pet swaps with this forest, that pet dies instantly",
            "color": "grey",
            "ranger": "",
            "life": 0,
            "cardNum": 1
        },
        "Catapult Forest": {
            "name": "Catapult Forest",
            "description": "If any pet swaps with this forest, deal one damage to one targeted pet you choose",
            "color": "grey",
            "ranger": "",
            "life": 0,
            "cardNum": 1
        },
    };

    static ACTION = {
        "Fogging": {
            "name": "Fogging",
            "block": 1,
            "description": "Collect all pet cards that are in the \"Pet Line\" (not including pet deck), reshuffle, and place the back in the \"Pet Line\" facing down",
            "color": "gold",
            "cardNum": 1,
            "ability": "Fogging",
            "special": null
        },
        "Machine Gun": {
            "name": "Machine Gun",
            "block": 2,
            "description": "Boom all aim cards on the pet line",
            "color": "gold",
            "cardNum": 1,
            "ability": "MachineGun",
            "special": null
        },
        "Wild": {
            "name": "Wild",
            "block": 1,
            "description": "This card acts as your special skill",
            "color": "gold",
            "cardNum": 1,
            "ability": "Wild",
            "special": null
        },
        "Hypnotize": {
            "name": "Hypnotize",
            "block": 1,
            "description": "Move any pet you choose one step forward or backward",
            "color": "gold",
            "cardNum": 1,
            "ability": "Hypnotize",
            "special": null
        },
    };

    static CANVAS_ACTIVATION = {
        "Instant Escape": {
            "name": "Instant Escape",
            "block": 1,
            "description": "",
            "color": "orange",
            "cardNum": 1,
            "ranger": "Double",
            "ability": "InstantEscape"
        },
        "Deflect": {
            "name": "Deflect",
            "block": 1,
            "description": "",
            "color": "deepblue",
            "cardNum": 1,
            "ranger": "Roxxeon Kaizer",
            "ability": "Deflect"
        },
        "Outbreak": {
            "name": "Outbreak",
            "block": 1,
            "description": "",
            "color": "deeppink",
            "cardNum": 1,
            "ranger": "Soulbender R",
            "ability": "Outbreak"
        },
        "Vortex": {
            "name": "Vortex",
            "block": 1,
            "description": "",
            "color": "yellowgreen",
            "cardNum": 1,
            "ranger": "Kobong",
            "ability": "Vortex"
        },
        "Copycat": {
            "name": "Copycat",
            "block": 1,
            "description": "",
            "color": "red",
            "cardNum": 1,
            "ranger": "Ashtranger",
            "ability": "Copycat"
        },
        "Multishock": {
            "name": "Multishock",
            "block": 1,
            "description": "",
            "color": "deeppurple",
            "cardNum": 1,
            "ranger": "Electrode",
            "ability": "MultiShock"
        },
        // II
        "Thievery": {
            "name": "Thievery",
            "block": 1,
            "description": "",
            "color": "lightgreen",
            "cardNum": 1,
            "ranger": "Archetype",
            "ability": "Thievery"
        },
        "Mega Charge": {
            "name": "Mega Charge",
            "block": 1,
            "description": "",
            "color": "green",
            "cardNum": 1,
            "ranger": "G.R.",
            "ability": "MegaCharge"
        },
        "Junk Yard Master": {
            "name": "Junk Yard Master",
            "block": 1,
            "description": "",
            "color": "brown",
            "cardNum": 1,
            "ranger": "Zero-Arms",
            "ability": "Junk Yard Master"
        },
        "Manipulation": {
            "name": "Manipulation",
            "block": 1,
            "description": "",
            "color": "yellow",
            "cardNum": 1,
            "ranger": "Dewi Ruh Bengi",
            "ability": "Manipulation"
        },
        "Tsunami": {
            "name": "Tsunami",
            "block": 1,
            "description": "",
            "color": "blue",
            "cardNum": 1,
            "ranger": "Camiere",
            "ability": "Tsunami"
        },
        "Dark Terror": {
            "name": "Dark Terror",
            "block": 1,
            "description": "",
            "color": "lightpurple",
            "cardNum": 1,
            "ranger": "Braculla",
            "ability": "DarkTerror"
        },
    };
}

module.exports = DataExpansion;
