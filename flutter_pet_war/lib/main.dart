import 'package:flutter/material.dart';
import 'package:flutter_pet_war/app.dart';
import 'package:flutter_pet_war/data/services/socket_service.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(SocketService(), permanent: true);
  runApp(const App());
}
