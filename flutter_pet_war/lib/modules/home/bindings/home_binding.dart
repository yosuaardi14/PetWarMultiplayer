import 'package:flutter_pet_war/modules/home/controllers/home_controller.dart';
import 'package:flutter_pet_war/modules/home/controllers/home_firebase_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => HomeFirebaseController());
  }
}