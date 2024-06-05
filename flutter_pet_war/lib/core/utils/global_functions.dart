import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/dialog/option_dialog.dart';
import 'package:get/get.dart';

class GF {
  static int genRandomNumber(max) {
    return Random().nextInt(max);
  }

  static List<T> shuffle<T>(List<T> data) {
    var random = Random();
    for (var i = 0; i < data.length; i++) {
      var rand = random.nextInt(i + 1);
      var temp = data[i];
      data[i] = data[rand];
      data[rand] = temp;
    }
    return data;
  }

  static bool isListFull(List data) {
    return data.every((element) => element != null);
    // for (var i = 0; i < data.length; i++) {
    //   if (data[i] == null) {
    //     return false;
    //   }
    // }
    // return true;
  }

  static bool isListNull(List data, [int? len]) {
    if (data.length == len) {
      return data.every((element) => element == null);
    }
    int size = data.length;
    if (len != null) {
      size = len;
    }

    for (var i = 0; i < size; i++) {
      if (data[i] != null) {
        return false;
      }
    }
    return true;
  }

  static List setListElementNull(List data, int size) {
    if (size > data.length) {
      size = data.length;
    }
    data.fillRange(0, size, null);
    // for (var i = 0; i < size; i++) {
    //   data[i] = null;
    // }
    return data;
  }

  static String generateId(String type, [Map<String, dynamic>? data]) {
    if (type == "action") {
      if (data != null) {
        return "ACT_${data["ability"]?.toString().trim() ?? "ACTION"}_${data["cardNum"]?.toString() ?? 0}";
      }
      return "ACT_${DateTime.now()}";
    }
    return "";
  }

  static showOptionDialog() async {
    return await Get.dialog(
      barrierDismissible: false,
      const OptionDialog(title: "", description: "Apakah anda yakin?"),
    );
  }

  static Future<int> showLeftRightDialog({String? desc = ""}) async {
    return await Get.dialog(
      barrierDismissible: false,
      OptionDialog(
        title: "Kiri atau Kanan?",
        description: desc,
        buttonLabelValue: const {"Kiri": -1, "Kanan": 1},
      ),
    );
  }

  static Color colorFromString(String color) {
    switch (color) {
      case "red":
        return Colors.red.shade400;
      case "orange":
        return Colors.orangeAccent.shade700;
      case "deeppink":
        return Colors.pink.shade300;
      case "purple":
        return Colors.purple;
      case "blue":
        return Colors.blueAccent;
      case "yellowgreen":
        return Colors.green;
      default:
        return Colors.white;
    }
  }
}
