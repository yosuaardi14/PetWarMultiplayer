// ignore_for_file: constant_identifier_names

import 'package:flutter_pet_war/modules/home/bindings/home_binding.dart';
import 'package:flutter_pet_war/modules/home/views/home_view.dart';
import 'package:flutter_pet_war/modules/login/bindings/login_binding.dart';
import 'package:flutter_pet_war/modules/login/views/login_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    // GetPage(
    //   name: Routes.GAME,
    //   page: () => const GameView(),
    //   binding: GameBinding(),
    // ),
    // GetPage(
    //   name: Routes.SPECTATOR,
    //   page: () => const SpectatorView(),
    //   binding: SpectatorBinding(),
    // ),
  ];
}
