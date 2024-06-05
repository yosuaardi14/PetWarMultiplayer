import 'dart:math';
// import 'dart:developer' as dev;

class CircularQueue<T> {
  List<T> data;
  int size;
  CircularQueue({this.data = const [], this.size = 0});

  void shuffleSize(int len) {
    for (var i = 0; i < len; i++) {
      var rand = Random().nextInt(i + 1);
      var temp = data[i];
      data[i] = data[rand];
      data[rand] = temp;
    }
  }

  void shuffleAll() {
    // for (var i = data.length - 1; i > 0; i--) {
    //   var rand = Random().nextInt(i + 1);
    //   var temp = data[i];
    //   data[i] = data[rand];
    //   data[rand] = temp;
    // }
    data.shuffle();
  }

  T getAt(int index) {
    return data[index];
  }

  List<T> getRange(int len) {
    if (len > data.length) {
      len = data.length;
    }
    return data.getRange(0, len).toList();
  }

  void setElement(List<T> elements) {
    data.removeWhere((element) => true);
    data.addAll(elements);
    size = data.length;
  }

  void addElement(T element) {
    data.add(element);
    size = data.length;
  }

  void addAll(Iterable<T> iterable) {
    data.addAll(iterable);
    size = data.length;
  }

  T removeAt(int index) {
    size = data.length;
    return data.removeAt(index);
  }

  void setAt(int index, T element) {
    data[index] = element;
    size = data.length;
  }

  void moveForwardAll() {
    // dev.inspect("Forward");
    var firstElement = data[0];
    for (var i = 0; i < data.length - 1; i++) {
      data[i] = data[i + 1];
    }
    data[data.length - 1] = firstElement;
  }

  void moveBackwardAll() {
    // dev.inspect("Backward");
    var lastElement = data[data.length - 1];
    for (var i = data.length - 1; i > 0; i--) {
      data[i] = data[i - 1];
    }
    data[0] = lastElement;
  }

  void printElement(int len) {
    if (len > size) {
      len = size;
    }
    // var temp = getRange(len);
    // dev.inspect(temp);
    for (var i = 0; i < size; i++) {
    }
  }

  void printAll() {
    // dev.inspect(data);
    // var text = "[";
    // for (var i = 0; i < size; i++) {
    //   text += "[${data[i]?.length ??}]";
    //   // print(data[i].toString());
    // }
    // text += "]";
    // print(text);
  }
}
