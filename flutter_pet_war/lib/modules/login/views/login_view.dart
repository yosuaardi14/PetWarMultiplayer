import 'package:flutter/material.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/game_background.dart';
import 'package:flutter_pet_war/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Pet War Card Game"),
      // ),
      body: Obx(
        () => GameBackground(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  // width: 700,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListTile(
                            title: const Text("Nama"),
                            subtitle: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  controller: controller.textEditingController,
                                ),
                                if (controller.errorText.isNotEmpty)
                                  Text(
                                    controller.errorText(),
                                    style: const TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 300,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: ElevatedButton(
                                onPressed: controller.onLogin,
                                child: const Text("Masuk"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
