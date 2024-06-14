class Util {
    static nullSafety(value, nullValue) {
        if (value === null) {
            return nullValue;
        }
        return value;
    }

    static findyById(array, id) {
        return array.find(item => item.id === id);
    }

    static findAllIndex(array, element) {
        let listIndex = [];
        let idx = array.indexOf(element);
        while (idx !== -1) {
            listIndex.push(idx);
            idx = array.indexOf(element, idx + 1);
        }
        return listIndex;
    }

    static shuffle(data, size = null) {
        if (size == null) {
            size = data.length;
        }
        for (let i = 0; i < size; i++) {
            const rand = Math.floor(Math.random() * size);
            [data[i], data[rand]] = [data[rand], data[i]];
        }
        return data;
    }

    static shuffleRange(data, start = 0, end) {
        if (end > data.length) {
            end = data.length;
        }
        for (let i = start; i < end; i++) {
            // Generate a random index between i (inclusive) and end (exclusive)
            const rand = Math.floor(Math.random() * (end - i)) + i;
            // Swap elements at indices i and rand
            [data[i], data[rand]] = [data[rand], data[i]];
        }
    }

    static generateRandomString(length = 12) {
        const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        let result = '';
        const charactersLength = characters.length;

        for (let i = 0; i < length; i++) {
            result += characters.charAt(Math.floor(Math.random() * charactersLength));
        }

        return result;
    }

    static generateId(type, cardIdx = 0, data = null) {
        if (type === "action") {
            if (data != null) {
                const ability = data.ability?.toString().trim() ?? "ACTION";
                const cardNum = data.cardNum?.toString() ?? "0";
                const result = `ACT_${ability}_${cardNum}_${cardIdx}`;
                return result;
            }
            const now = new Date();
            const formattedDate = `${now.getFullYear()}-${(now.getMonth() + 1).toString().padStart(2, '0')}-${now.getDate().toString().padStart(2, '0')}`;
            const formattedTime = `${now.getHours().toString().padStart(2, '0')}:${now.getMinutes().toString().padStart(2, '0')}:${now.getSeconds().toString().padStart(2, '0')}`;
            const formattedDateTime = `${formattedDate}${formattedTime}`;
            const randomStr = this.generateRandomString(27);
            return `ACT_${randomStr}`;
        } else if (type === "pet") {
            if (data != null) {
                const ability = data.ability?.toString().trim() ?? "PET";
                const cardNum = data.cardNum?.toString() ?? "0";
                const result = `PET_${ability}_${cardNum}`;
                return result;
            }
            const now = new Date();
            const formattedDate = `${now.getFullYear()}-${(now.getMonth() + 1).toString().padStart(2, '0')}-${now.getDate().toString().padStart(2, '0')}`;
            const formattedTime = `${now.getHours().toString().padStart(2, '0')}:${now.getMinutes().toString().padStart(2, '0')}:${now.getSeconds().toString().padStart(2, '0')}`;
            const formattedDateTime = `${formattedDate}${formattedTime}`;
            const randomStr = this.generateRandomString(6);
            return `PET_${randomStr}`;
        } else if (type === "ranger") {
            if (data != null) {
                const ability = data.ability?.toString().trim() ?? "RGR";
                const cardNum = data.cardNum?.toString() ?? "0";
                const result = `RGR_${ability}_${cardNum}`;
                return result;
            }
            const now = new Date();
            const formattedDate = `${now.getFullYear()}-${(now.getMonth() + 1).toString().padStart(2, '0')}-${now.getDate().toString().padStart(2, '0')}`;
            const formattedTime = `${now.getHours().toString().padStart(2, '0')}:${now.getMinutes().toString().padStart(2, '0')}:${now.getSeconds().toString().padStart(2, '0')}`;
            const formattedDateTime = `${formattedDate}${formattedTime}`;
            const randomStr = this.generateRandomString(6);
            return `RGR_${randomStr}`;
        }
        const randomStr = this.generateRandomString(6);
        return `PW1_${randomStr}`;
    }

    static isListFull(data) {
        return data.every(element => element !== null);
    }

    static isListNull(data, len) {
        if (data.length === len) {
            return data.every(element => element === null);
        }
        let size = data.length;
        if (len !== undefined) {
            size = len;
        }

        for (let i = 0; i < size; i++) {
            if (data[i] !== null) {
                return false;
            }
        }
        return true;
    }

    static setListElementNull(data, size) {
        if (size > data.length) {
            size = data.length;
        }
        data.fill(null, 0, size);
        return data;
    }
}

module.exports = Util;