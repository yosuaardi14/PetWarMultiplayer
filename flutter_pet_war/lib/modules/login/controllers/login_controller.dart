import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pet_war/core/utils/storage_utils.dart';
import 'package:flutter_pet_war/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final errorText = "".obs;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    play();
  }

  void play() async {
    StorageUtils.read("playerName").then((value) {
      if (value != null) {
        Get.offNamed(Routes.HOME);
      }
    });
  }

  void onLogin() async {
    errorText.value = "";
    if (textEditingController.text.isEmpty) {
      errorText.value = "Nama tidak boleh kosong";
      return;
    }
    String name = textEditingController.text;
    if (name.length > 14) {
      name = name.substring(0, 13);
    }
    var id = DateTime.now().millisecondsSinceEpoch;
    await StorageUtils.write("playerName", name);
    await StorageUtils.write(
      "playerId",
      base64Encode(id.toString().codeUnits + name.codeUnits),
    );

    Get.offNamed(Routes.HOME);
  }
}
