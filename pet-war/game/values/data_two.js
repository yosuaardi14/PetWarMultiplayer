class DataTwo {
    static DEFAULT_MAX_LIFE = 5;

    static KING_MAX_TOKEN = 4;

    static CANVAS_RANGER = [
        {
            "name": "Daiya",
            "description": "\"Daiya\" is the owner of \"Soeharti\", their ability is to manipulate the pet line to create the worst scenario of their opponent.",
            "pet": "Soeharti",
            "color": "yellow",
            "cardNum": 1
        },
        {
            "name": "Elliot",
            "description": "\"Elliot\" is the owner of \"Marmar\", their abilities are to steal other pet's protection and discard aims.",
            "pet": "Marmar",
            "color": "lightgreen",
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
            "color": "brown",
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
            "description": "\"Bracula\" is the owner of \"Bratz\", their ability is vampiric skill that allows him to absorb other pet's life.",
            "pet": "Bratz",
            "color": "lightpurple",
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
            "color": "yellow",
            "ranger": "Daiya",
            "life": 1,
            "cardNum": 5
        },
        "Marmar": {
            "name": "Marmar",
            "description": "",
            "color": "lightgreen",
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
            "color": "brown",
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
            "color": "lightpurple",
            "ranger": "Bracula",
            "life": 1,
            "cardNum": 5
        }
    };

    static ACTION = {
        "Doom": {
            "name": "Doom",
            "block": 1,
            "description": "Destroying target whether it was aimed or not. If the card was aimed, remove the aim card also",
            "color": "gold",
            "cardNum": 1,
            "ability": "Doom",
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
        "Miss Fire": {
            "name": "Miss Fire",
            "block": 1,
            "description": "Destroy the pet next to the aimed pet (left or right). Remove the used aim card",
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
        "Typhoon": {
            "name": "Typhoon",
            "block": 1,
            "description": "Reshuffle all the pet cards in the \"Pet Line\" and the pet deck. Draw six new pet cards into the line",
            "color": "gold",
            "cardNum": 1,
            "ability": "Typhoon",
            "special": null
        },
        "Lunch Time": {
            "name": "Lunch Time",
            "block": 1,
            "description": "Remove all aim cards in the \"Pet Line\"",
            "color": "gold",
            "cardNum": 1,
            "ability": "LunchTime",
            "special": null
        },
        "Reshuffle Hand": {
            "name": "Reshuffle Hand",
            "block": 1,
            "description": "Collect all action card in hands from all players and shuffle it (action deck not included) and deal the action cards",
            "color": "gold",
            "cardNum": 1,
            "ability": "ReshuffleHand",
            "special": null
        },
        "Switch Ranger": {
            "name": "Switch Ranger",
            "block": 1,
            "description": "Switch your character with another player of your choice",
            "color": "gold",
            "cardNum": 1,
            "ability": "SwitchRanger",
            "special": null
        },
        "Ressurect": {
            "name": "Ressurect",
            "block": 1,
            "description": "Revive one of your pet that has been removed from the game to the bottom of the pet deck",
            "color": "gold",
            "cardNum": 2,
            "ability": "Ressurect",
            "special": null,
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
        "Go Forward-Banzai": {
            "name": "Go Forward",
            "block": 1,
            "description": "Swap YOUR pet with any card on the left side",
            "color": "gold",
            "cardNum": 3,
            "ability": "GoForward",
            "special": {
                "name": "Banzai",
                "description": "King can jump 2 steps forward (If it's pet, the second card it passes destroyed). If King jump over the Pet Line, he'll return to the bottom of the pet deck, if u are Louise",
                "color": "blue",
                "ranger": "Louise",
                "ability": "Banzai"
            }
        },
        "Go Backward-Banzai": {
            "name": "Go Backward",
            "block": 1,
            "description": "Swap YOUR pet with any card on the right side",
            "color": "gold",
            "cardNum": 2,
            "ability": "GoBackward",
            "special": {
                "name": "Banzai",
                "description": "King can jump 2 steps forward (If it's pet, the second card it passes destroyed). If King jump over the Pet Line, he'll return to the bottom of the pet deck, if u are Louise",
                "color": "blue",
                "ranger": "Louise",
                "ability": "Banzai"
            }
        },
        "Boom-Banzai": {
            "name": "Boom",
            "block": 1,
            "description": "Use this card to destroy the targeted pet. Remove the aim card",
            "color": "gold",
            "cardNum": 5,
            "ability": "Boom",
            "special": {
                "name": "Banzai",
                "description": "King can jump 2 steps forward (If it's pet, the second card it passes destroyed). If King jump over the Pet Line, he'll return to the bottom of the pet deck, if u are Louise",
                "color": "blue",
                "ranger": "Louise",
                "ability": "Banzai"
            }
        },
        "Get Cover-Water Bulb": {
            "name": "Get Cover",
            "block": 1,
            "description": "Put YOUR pet underneath the nearest pet. Your pet moves along with the covering pet, and remain hidden until the covering is destroyed",
            "color": "gold",
            "cardNum": 2,
            "ability": "GetCover",
            "special": {
                "name": "Water Bulb",
                "description": "Cover King with this card to nullify the 3 rounds death, if u are Louise",
                "color": "blue",
                "ranger": "Louise",
                "ability": "WaterBulb"
            }
        },
        "Armor-Vampiric Move": {
            "name": "Armor",
            "block": 1,
            "description": "Cover your chosen pet to get additional life +1",
            "color": "gold",
            "cardNum": 2,
            "ability": "Armor",
            "special": {
                "name": "Vampiric Move",
                "description": "Draw two cards from the Action Deck and play an extra action card from your hand, if u are Bracula",
                "color": "lightpurple",
                "ranger": "Bracula",
                "ability": "VampiricMove"
            }
        },
        "Boom-Vampiric Bite": {
            "name": "Boom",
            "block": 1,
            "description": "Use this card to destroy the targeted pet. Remove the aim card",
            "color": "gold",
            "cardNum": 5,
            "ability": "Boom",
            "special": {
                "name": "Vampiric Bite",
                "description": "Use this card to destroy the pet below the aim card. Put one destroyed Bratz to replace the targeted pet, if u are Bracula",
                "color": "lightpurple",
                "ranger": "Bracula",
                "ability": "VampiricBite"
            }
        },
        "Hide-Corpse Cover": {
            "name": "Hide",
            "block": 1,
            "description": "Cover your chosen pet with this card. The covered pet can't be destroyed until this card removed after one round",
            "color": "gold",
            "cardNum": 2,
            "ability": "Hide",
            "special": {
                "name": "Corpse Cover",
                "description": "Cover Vulcan with any discarded pet from your opponent's graveyard, put it faced down. The used pet corpse is removed from game, it can't be resurrected, if u are Javelin",
                "color": "brown",
                "ranger": "Javelin",
                "ability": "CorpseCover"
            }
        },
        "Aim-Scavenge": {
            "name": "Aim",
            "block": 1,
            "description": "Put this card above the pet you want to be targeted in the \"Pet Line\"",
            "color": "gold",
            "cardNum": 3,
            "ability": "Aim",
            "special": {
                "name": "Scavenge",
                "description": "Take ALL aim cards from discard pile, and place them all on the pet line in any way you like. Discard the rest if the slot is full, if you are Javelin",
                "color": "brown",
                "ranger": "Javelin",
                "ability": "Scavenge"
            }
        },
        "Aim-Avoid": {
            "name": "Aim",
            "block": 1,
            "description": "Put this card above the pet you want to be targeted in the \"Pet Line\"",
            "color": "gold",
            "cardNum": 6,
            "ability": "Aim",
            "special": {
                "name": "Avoid",
                "description": "Remove up to 6 aim cards, if u are Elliot",
                "color": "lightgreen",
                "ranger": "Elliot",
                "ability": "Avoid"
            }
        },
        "Bump Left-Steal": {
            "name": "Bump Left",
            "block": 1,
            "description": "Move any aim card one step to the left. If there is another aim card on the position, nothing happens",
            "color": "gold",
            "cardNum": 2,
            "ability": "BumpLeft",
            "special": {
                "name": "Steal",
                "description": "Steal any hide or armor card or even a pet that covers other pet, if u are Elliot",
                "color": "lightgreen",
                "ranger": "Elliot",
                "ability": "Steal"
            }
        },
        "Bump Right-Charge": {
            "name": "Bump Right",
            "block": 1,
            "description": "Move any aim card one step to the right. If there is another aim card on the position, nothing happens",
            "color": "gold",
            "cardNum": 2,
            "ability": "BumpRight",
            "special": {
                "name": "Charge",
                "description": "Cover Giro with this card and it is considered to have an AIM on top of it. If Giro survives one whole turn, Giro moves two steps forward and destroy all pets that passed by Giro, if u are Rei",
                "color": "green",
                "ranger": "Rei",
                "ability": "Charge"
            }
        },
        "Mine-Mega Mine": {
            "name": "Mine",
            "block": 1,
            "description": "Put this card under any pet card on the Pet Line. When a Running or Boo card played, destroy the pet above the mine card",
            "color": "gold",
            "cardNum": 2,
            "ability": "Mine",
            "special": {
                "name": "Mega Mine",
                "description": "Put this card under any pet card on the Pet Line. When a Running or Boo card played, destroy the pet above the mine card along with adjacent pets, if u are Rei",
                "color": "green",
                "ranger": "Rei",
                "ability": "MegaMine"
            }
        },
        "Aim-Haunted": {
            "name": "Aim",
            "block": 1,
            "description": "Put this card above the pet you want to be targeted in the \"Pet Line\"",
            "color": "gold",
            "cardNum": 3,
            "ability": "Aim",
            "special": {
                "name": "Haunted",
                "description": "Swap Soeharti with any pet you like, if u are Daiya",
                "color": "yellow",
                "ranger": "Daiya",
                "ability": "Haunted"
            }
        },
        "Running-Boo": {
            "name": "Running",
            "block": 1,
            "description": "Move forward all cards in the \"pet line\" remove the card in the very from of the line to the bottom of the deck, replace the blank spot with new card from deck",
            "color": "gold",
            "cardNum": 3,
            "ability": "Running",
            "special": {
                "name": "Boo",
                "description": "Move all cards on the pet line backward. Move the card in the back of the line to the top of the deck. Take the card from the bottom of the deck and put back in the front of the line, if u are Daiya",
                "color": "yellow",
                "ranger": "Daiya",
                "ability": "Boo"
            }
        }
    };
}
module.exports = DataTwo;
