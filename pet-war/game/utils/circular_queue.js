class CircularQueue {
    constructor() {
        this.queue = [];
        this.size = 0;
    }

    shuffleSize(size) {
        for (let i = 0; i < size; i++) {
            const rand = Math.floor(Math.random() * size);
            [this.queue[i], this.queue[rand]] = [this.queue[rand], this.queue[i]];
        }
    }

    shuffleOn(start = 0, end) {
        if (end > this.queue.length) {
            end = this.queue.length;
        }
        // for (let i = start; i < end; i++) {
        //     const rand = Math.floor(Math.random() * (end - start + 1)) + (start - 1);
        //     [this.queue[i], this.queue[rand]] = [this.queue[rand], this.queue[i]];
        // }
        for (let i = start; i < end; i++) {
            // Generate a random index between i (inclusive) and end (exclusive)
            const rand = Math.floor(Math.random() * (end - i)) + i;
            // Swap elements at indices i and rand
            [this.queue[i], this.queue[rand]] = [this.queue[rand], this.queue[i]];
        }
    }

    shuffleAll() {
        for (let i = this.queue.length - 1; i > 0; i--) {
            const rand = Math.floor(Math.random() * (i + 1));
            [this.queue[i], this.queue[rand]] = [this.queue[rand], this.queue[i]];
        }
    }

    getAt(index) {
        return this.queue[index];
    }

    getRange(len) {
        if (len > this.queue.length) {
            len = this.queue.length;
        }
        return Array.from(this.queue).splice(0, len);
    }

    setElement(elements) {
        this.queue = elements;
        this.size = elements.length;
    }

    setAt(index, element) {
        this.queue[index] = element;
    }

    addElement(element) {
        this.queue.push(element);
        this.size += 1;
    }

    removeAt(index) {
        this.size -= 1;
        return this.queue.splice(index, 1);
    }

    copyAll(){
        return JSON.parse(JSON.stringify(this.queue));
    }

    moveForwardAll() {
        // console.log("Forward");
        let firstElement = this.queue[0];
        for (let i = 0; i < this.queue.length; i++) {
            this.queue[i] = this.queue[i + 1];
        }
        this.queue[this.queue.length - 1] = firstElement;
    }

    moveBackwardAll() {
        // console.log("Backward");
        let lastElement = this.queue[this.queue.length - 1];
        for (let i = this.queue.length - 1; i > 0; i--) {
            this.queue[i] = this.queue[i - 1];
        }
        this.queue[0] = lastElement;
    }

    printElement(len) {
        if (len > this.size) {
            len = this.size;
        }
        let temp = Array.from(this.queue).splice(0, len);
        // console.log(temp);
        // for (let i = 0; i < size; i++) {
        //     // console.log(this.queue[i]);
        // }
    }

    printAll() {
        // console.log(this.queue);
        // for (let i = 0; i < this.size; i++) {
        //     // console.log(this.queue[i]);
        // }
    }

    toArray() {
        return this.queue;
    }
}

module.exports = CircularQueue;