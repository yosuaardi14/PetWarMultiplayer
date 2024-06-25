import 'package:flutter/material.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/catalog/card_catalog.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/game_background.dart';
import 'package:flutter_pet_war/modules/home/controllers/home_controller.dart';
import 'package:flutter_pet_war/modules/home/controllers/home_firebase_controller.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeFirebaseController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameBackground(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Card(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: SizedBox(
                            width: 200,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: controller.showCreateRoomDialog,
                              child: const Text("Buat Room"),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 200,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: controller.showRoomListDialog,
                            child: const Text("Lihat Daftar Room"),
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: 200,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.dialog(const CardCatalog());
                            },
                            child: const Text("Katalog Kartu"),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: controller.transferData,
                          child: Text("Transfer"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
