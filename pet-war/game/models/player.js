class Player {
    constructor(id, name, maxLife) {
        this.id = id;
        this.name = name;
        this.rangerName = "";//ranger["name"];
        this.ranger = {};
        this.maxLife = maxLife;
        this.life = maxLife;
        this.cardDeck = [];
        this.isDead = false;
        this.defeatedPet = [];
    }

    setRanger(ranger) {
        this.ranger = ranger;
        this.rangerName = ranger["name"];
    }

    toJson() {
        return {
            "name": this.name,
            "rangerName": this.rangerName,
            "ranger": JSON.stringify(this.ranger),
            "maxLife": this.maxLife,
            "life": this.life,
            "cardDeck": this.cardDeck,
            "isDead": this.isDead,
        };
    }

    clientToJson(){
        return {
            "name": this.name,
            "rangerName": this.rangerName,
            "ranger": JSON.stringify(this.ranger),
            "life": this.life,
            "maxLife": this.maxLife,
            "isDead": this.isDead,
        };
    }
}

module.exports = Player;