// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/view/base_screen.dart';
import 'package:getx_architecture_template/feature/home_details/area/binding/area_binding.dart';
import 'package:getx_architecture_template/feature/home_details/area/view/home_detail_area_screen.dart';
import 'package:getx_architecture_template/feature/home_details/category/binding/category_binding.dart';
import 'package:getx_architecture_template/feature/home_details/category/view/home_detail_category_screen.dart';
import 'package:getx_architecture_template/feature/home_details/meal/binding/meal_binding.dart';
import 'package:getx_architecture_template/feature/home_details/meal/view/home_detail_meal_screen.dart';
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
        name: Routes.HOME,
        page: () => const HomeScreen(),
        binding: HomeBinding(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginScreen(),
        binding: LoginBinding(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: Routes.AREA,
        page: () => const HomeDetailAreaScreen(
              country: 'country',
            ),
        binding: AreaBinding(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: Routes.CATEGORY,
        page: () => const HomeDetailCategoryScreen(category: 'category'),
        binding: CategoryBinding(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: Routes.MEAL,
        page: () => const HomeDetailMealScreen(id: 'id'),
        binding: MealBinding(),
        transition: Transition.rightToLeftWithFade),
  ]; // detay sayfası için route koy
}
