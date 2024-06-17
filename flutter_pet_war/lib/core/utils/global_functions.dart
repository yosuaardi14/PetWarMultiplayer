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

  static Color colorFromString(String color, [bool light = false]) {
    switch (color) {
      case "red":
        if (light) {
          return Colors.red.shade200;
        }
        return Colors.red.shade400;
      case "orange":
        if (light) {
          return Colors.orangeAccent.shade200;
        }
        return Colors.orangeAccent.shade700;
      case "deeppink":
        if (light) {
          return Colors.pink.shade100;
        }
        return Colors.pink.shade300;
      case "purple":
        if (light) {
          return Colors.purple.shade200;
        }
        return Colors.purple;
      case "blue":
        if (light) {
          return Colors.blueAccent.shade100;
        }
        return Colors.blueAccent;
      case "yellowgreen":
        if (light) {
          return Colors.green.shade100;
        }
        return Colors.green;
      case "green":
        if (light) {
          return Colors.lightGreen.shade100;
        }
        return Colors.lightGreen;
      case "black":
        if (light) {
          return Colors.black87;
        }
        return Colors.black;
      case "silver":
        if (light) {
          return Colors.blueGrey.shade100;
        }
        return Colors.blueGrey;
      default:
        if (light) {
          return Colors.white54;
        }
        return Colors.white;
    }
  }

  static IconData getIconByAbility(String? ability) {
    switch (ability) {
      case "OverShock":
      case "Doom":
        return Icons.brightness_high_rounded;
      case "GetCover":
      case "MasterHide":
        return Icons.group;
      case "Hide":
        return Icons.bookmark;
      case "Armor":
        return Icons.shield_outlined;
      case "Shield":
        return Icons.shield;
      case "Aim":
        return Icons.circle_outlined;
      case "TwoAim":
        return Icons.join_inner_rounded;
      case "Grenade":
        return Icons.zoom_in_map;
      case "MegaGrenade":
        return Icons.zoom_out_map;
      case "Miss":
        return Icons.call_missed;
      case "Boom":
        return Icons.brightness_5;
      case "TwoBoom":
        return Icons.brightness_low_outlined;
      case "Running":
        return Icons.arrow_back_ios_new;
      case "DoubleRun":
        return Icons.keyboard_double_arrow_left_sharp;
      case "GoForward":
        return Icons.turn_left;
      case "GoBackward":
        return Icons.turn_right;
      case "GoAnyward":
        return Icons.swap_horiz_sharp;
      case "BumpLeft":
        return Icons.arrow_back;
      case "BumpRight":
        return Icons.arrow_forward;
      case "LunchTime":
        return Icons.lunch_dining;
      case "MovingAim":
        return Icons.compare_arrows;
      case "Trap":
        return Icons.do_disturb;
      case "MoveThePet":
        return Icons.swap_horiz;
      case "Kamikaze":
        return Icons.brightness_7;
      case "Escape":
        return Icons.move_up_rounded;
      case "Typhoon":
        return Icons.air;
      case "Ressurect":
        return Icons.plus_one;
      case "DoubleRessurect":
        return Icons.exposure_plus_2;
      default:
        return Icons.abc;
    }
  }
}
