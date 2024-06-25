import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pet_war/app.dart';
import 'package:flutter_pet_war/data/services/socket_service.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Get.put(SocketService(), permanent: true);
  runApp(const App());
}
