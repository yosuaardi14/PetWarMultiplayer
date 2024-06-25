import 'package:flutter/material.dart';
import 'package:flutter_pet_war/modules/home/controllers/home_controller.dart';
import 'package:flutter_pet_war/modules/home/controllers/home_firebase_controller.dart';
import 'package:get/get.dart';

class CreateRoomDialog extends GetView<HomeFirebaseController> {
  const CreateRoomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Buat Room"),
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        SizedBox(
          width: 270,
          height: 50,
          child: ElevatedButton(
            onPressed: controller.onCreateRoom,
            child: const Text("Buat"),
          ),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => Visibility(
              visible: controller.statusTxt.isNotEmpty,
              child: Text(
                controller.statusTxt(),
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            title: const Text("Room ID"),
            contentPadding: EdgeInsets.zero,
            subtitle: TextField(
              controller: controller.roomTextController,
              onSubmitted: (value) {
                controller.onCreateRoom();
              },
            ),
          ),
          // const SizedBox(height: 20),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     const Text("Mode Tim"),
          //     Obx(
          //       () => Switch(
          //         value: controller.teamMode(),
          //         onChanged: controller.onChangeMode,
          //       ),
          //     ),
          //   ],
          // ),
          const SizedBox(height: 20),
          SizedBox(
            width: 250,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Jumlah"),
              subtitle: DropdownButtonHideUnderline(
                child: Obx(
                  () => DropdownButton(
                    value: controller.playerNum(),
                    items: [
                      if (controller.teamMode())
                        ...List.generate(
                          2,
                          (index) => DropdownMenuItem(
                            value: (index + 2) * 2,
                            child: Text("${(index + 2) * 2} Pemain"),
                          ),
                        )
                      else
                        ...List.generate(
                          5,
                          (index) => DropdownMenuItem(
                            value: index + 2,
                            child: Text("${index + 2} Pemain"),
                          ),
                        )
                    ],
                    onChanged: controller.onChangePlayerNum,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
