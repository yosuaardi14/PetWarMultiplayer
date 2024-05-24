class Player {
    constructor(id, name, maxLife) {
        this.id = id;
        this.name = name;
        this.rangerName = "";//ranger["name"];
        this.ranger = null;
        this.maxLife = maxLife;
        this.life = maxLife;
        this.cardDeck = [];
        this.isDead = false;
    }

    setRanger(ranger) {
        this.ranger = ranger;
        this.rangerName = ranger["name"];
    }

    toJson() {
        return {
            "name": this.name,
            "rangeName": this.rangerName,
            "ranger": this.ranger,
            "maxLife": this.maxLife,
            "life": this.life,
            "cardDeck": this.cardDeck,
            "isDead": this.isDead,
        };
    }
}

module.exports = Player;