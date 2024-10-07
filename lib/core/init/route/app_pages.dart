// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';
import 'package:getx_architecture_template/feature/favorite/binding/favorite_binding.dart';
import 'package:getx_architecture_template/feature/favorite/view/favorite_screen.dart';
import 'package:getx_architecture_template/feature/home/binding/home_binding.dart';
import 'package:getx_architecture_template/feature/home/home_details/area/binding/area_binding.dart';
import 'package:getx_architecture_template/feature/home/home_details/area/view/home_detail_area_screen.dart';
import 'package:getx_architecture_template/feature/home/home_details/cart/binding/cart_binding.dart';
import 'package:getx_architecture_template/feature/home/home_details/cart/view/cart_screen.dart';
import 'package:getx_architecture_template/feature/home/home_details/category/binding/category_binding.dart';
import 'package:getx_architecture_template/feature/home/home_details/category/view/home_detail_category_screen.dart';
import 'package:getx_architecture_template/feature/home/home_details/meal/binding/meal_binding.dart';
import 'package:getx_architecture_template/feature/home/home_details/meal/meal_details/info/binding/info_binding.dart';
import 'package:getx_architecture_template/feature/home/home_details/meal/meal_details/info/view/info_screen.dart';
import 'package:getx_architecture_template/feature/home/home_details/meal/meal_details/option/binding/option_binding.dart';
import 'package:getx_architecture_template/feature/home/home_details/meal/meal_details/option/view/option_screen.dart';
import 'package:getx_architecture_template/feature/home/home_details/meal/meal_details/reviews/binding/reviews_binding.dart';
import 'package:getx_architecture_template/feature/home/home_details/meal/meal_details/reviews/view/reviews_screen.dart';
import 'package:getx_architecture_template/feature/home/home_details/meal/view/home_detail_meal_screen.dart';
import 'package:getx_architecture_template/feature/home/home_details/notification/binding/notification_binding.dart';
import 'package:getx_architecture_template/feature/home/home_details/notification/view/notification_screen.dart';
import 'package:getx_architecture_template/feature/home/home_details/search/binding/search_binding.dart';
import 'package:getx_architecture_template/feature/home/home_details/search/view/search_screen.dart';
import 'package:getx_architecture_template/feature/home/view/base_screen.dart';
import 'package:getx_architecture_template/feature/home/view/home_screen.dart';
import 'package:getx_architecture_template/feature/login/binding/login_binding.dart';
import 'package:getx_architecture_template/feature/login/login_details/signin/binding/signin_binding.dart';
import 'package:getx_architecture_template/feature/login/login_details/signin/view/signin_screen.dart';
import 'package:getx_architecture_template/feature/login/login_details/signup/binding/signup_binding.dart';
import 'package:getx_architecture_template/feature/login/login_details/signup/view/signup_screen.dart';
import 'package:getx_architecture_template/feature/login/view/login_screen.dart';
import 'package:getx_architecture_template/feature/splash/binding/splash_binding.dart';
import 'package:getx_architecture_template/feature/splash/view/splash_screen.dart';

class AppPages {
  static const INITIAL = Routes.BASE;

  static final routes = [
    //login
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
      transition: Transition.rightToLeftWithFade,
    ),

    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: Routes.SIGNIN,
      page: () => const SigninScreen(),
      binding: SigninBinding(),
      transition: Transition.rightToLeftWithFade,
    ),

    GetPage(
      name: Routes.SIGNUP,
      page: () => const SignupScreen(),
      binding: SignupBinding(),
      transition: Transition.rightToLeftWithFade,
    ),

//home

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
      transition: Transition.rightToLeftWithFade,
    ),

    //home_detail

    GetPage(
      name: Routes.AREA,
      page: () => const HomeDetailAreaScreen(),
      binding: AreaBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: Routes.CATEGORY,
      page: () => const HomeDetailCategoryScreen(),
      binding: CategoryBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: Routes.CART,
      page: () => const CartScreen(),
      binding: CartBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: Routes.NOTIFICATION,
      page: () => const NotificationScreen(),
      binding: NotificationBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => const SearchScreen(),
      binding: SearchBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: Routes.MEAL,
      page: () => const HomeDetailMealScreen(id: 'id'),
      binding: MealBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
// Meal_details
    GetPage(
      name: Routes.INFO,
      page: () => const InfoScreen(),
      binding: InfoBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: Routes.REVIEWS,
      page: () => const ReviewsScreen(),
      binding: ReviewsBinding(),
      transition: Transition.rightToLeftWithFade,
    ),

    GetPage(
      name: Routes.FAVORITE,
      page: () => const FavoriteScreen(),
      binding: FavoriteBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: Routes.OPTION,
      page: () => const OptionScreen(id: 'id'),
      binding: OptionBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
  ];
}
