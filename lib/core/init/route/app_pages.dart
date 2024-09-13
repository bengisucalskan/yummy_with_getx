// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/view/base_screen.dart';
import 'package:getx_architecture_template/feature/login/binding/login_binding.dart';
import 'package:getx_architecture_template/feature/login/view/login_screen.dart';
import '/feature/home/binding/home_binding.dart';
import '/feature/home/view/home_screen.dart';
import '../../../feature/splash/binding/splash_binding.dart';
import '../../../feature/splash/view/splash_screen.dart';
import '../../constants/routes/navigation_constants.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
        name: Routes.SPLASH,
        page: () => const SplashScreen(),
        binding: SplashBinding(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
      name: Routes.BASE,
      page: () => const BaseScreen(),
      binding: HomeBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
        // gerekli değil sanırım.
        name: Routes.HOME,
        page: () => const HomeScreen(),
        binding: HomeBinding(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginScreen(),
        binding: LoginBinding(),
        transition: Transition.rightToLeftWithFade),
  ];
}
