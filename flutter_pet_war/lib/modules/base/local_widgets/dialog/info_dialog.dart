import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoDialog extends StatelessWidget {
  final String? text;
  const InfoDialog({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(text ?? "Giliran Anda"),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Ok"),
        ),
      ],
    );
  }
}
