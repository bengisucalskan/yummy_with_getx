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
import 'package:getx_architecture_template/feature/home/home_details/my_account/account/account_details/personel_info/binding/personel_info_binding.dart';
import 'package:getx_architecture_template/feature/home/home_details/my_account/account/account_details/personel_info/view/personel_info_screen.dart';
import 'package:getx_architecture_template/feature/home/home_details/my_account/account/binding/account_binding.dart';
import 'package:getx_architecture_template/feature/home/home_details/my_account/account/view/account_screen.dart';
import 'package:getx_architecture_template/feature/home/home_details/my_account/wallet/binding/wallet_binding.dart';
import 'package:getx_architecture_template/feature/home/home_details/my_account/wallet/views/wallet_screen.dart';
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
import 'package:getx_architecture_template/feature/order/binding/order_binding.dart';
import 'package:getx_architecture_template/feature/order/order_detail/call/binding/call_binding.dart';
import 'package:getx_architecture_template/feature/order/order_detail/call/view/call_screen.dart';
import 'package:getx_architecture_template/feature/order/order_detail/cancel_order/binding/cancel_order_binding.dart';
import 'package:getx_architecture_template/feature/order/order_detail/cancel_order/view/cancel_order_screen.dart';
import 'package:getx_architecture_template/feature/order/order_detail/follow_the_order/binding/follow_binding.dart';
import 'package:getx_architecture_template/feature/order/order_detail/follow_the_order/view/follow_screen.dart';
import 'package:getx_architecture_template/feature/order/order_detail/fromCartToOrder/binding/from_cart_to_order_binding.dart';
import 'package:getx_architecture_template/feature/order/order_detail/fromCartToOrder/view/from_cart_to_order_screen.dart';
import 'package:getx_architecture_template/feature/order/order_detail/message/binding/message_binding.dart';
import 'package:getx_architecture_template/feature/order/order_detail/message/view/message_screen.dart';
import 'package:getx_architecture_template/feature/order/order_detail/order_detail/bindins/order_detail_bindins.dart';
import 'package:getx_architecture_template/feature/order/order_detail/order_detail/view/order_detail_screen.dart';
import 'package:getx_architecture_template/feature/order/view/order_screen.dart';
import 'package:getx_architecture_template/feature/splash/binding/splash_binding.dart';
import 'package:getx_architecture_template/feature/splash/view/splash_screen.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    //login
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.SIGNIN,
      page: () => const SigninScreen(),
      binding: SigninBinding(),
    ),

    GetPage(
      name: Routes.SIGNUP,
      page: () => const SignupScreen(),
      binding: SignupBinding(),
    ),

//home

    GetPage(
      name: Routes.BASE,
      page: () => const BaseScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),

    //home_detail

    GetPage(
      name: Routes.AREA,
      page: () => const HomeDetailAreaScreen(),
      binding: AreaBinding(),
    ),
    GetPage(
      name: Routes.CATEGORY,
      page: () => const HomeDetailCategoryScreen(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: Routes.CART,
      page: () => const CartScreen(),
      binding: CartBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATION,
      page: () => const NotificationScreen(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => const SearchScreen(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: Routes.MEAL,
      page: () => const HomeDetailMealScreen(id: 'id'),
      binding: MealBinding(),
    ),
// Meal_details
    GetPage(
      name: Routes.INFO,
      page: () => const InfoScreen(),
      binding: InfoBinding(),
    ),
    GetPage(
      name: Routes.REVIEWS,
      page: () => const ReviewsScreen(),
      binding: ReviewsBinding(),
    ),
    GetPage(
      name: Routes.OPTION,
      page: () => const OptionScreen(id: 'id'),
      binding: OptionBinding(),
    ),
    //Fav
    GetPage(
      name: Routes.FAVORITE,
      page: () => const FavoriteScreen(),
      binding: FavoriteBinding(),
    ),
    // order
    GetPage(
      name: Routes.ORDER,
      page: () => const OrderScreen(),
      //binding: OrderBinding(),
    ),
    //order_detail
    GetPage(
      name: Routes.FROM_CART_TO_ORDER,
      page: () => const FromCartToOrderScreen(),
      binding: FromCartToOrderBinding(),
    ),
    GetPage(
      name: Routes.ORDER_DETAIL,
      page: () => const OrderDetailScreen(),
      binding: OrderDetailBinding(),
    ),
    GetPage(
      name: Routes.FOLLOW,
      page: () => const FollowScreen(),
      binding: FollowBinding(),
    ),
    GetPage(
      name: Routes.MESSAGE,
      page: () => const MessageScreen(),
      binding: MessageBinding(),
    ),
    GetPage(
      name: Routes.CALL,
      page: () => const CallScreen(),
      binding: CallBinding(),
    ),
    GetPage(
      name: Routes.CANCEL_ORDER,
      page: () => const CancelOrderScreen(),
      binding: CancelOrderBinding(),
    ),

    // my account detail

    GetPage(
      name: Routes.ACCOUNT,
      page: () => const AccountScreen(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: Routes.PERSONEL_INFO,
      page: () => const PersonelInfoScreen(),
      binding: PersonelInfoBinding(),
    ),
    GetPage(
      name: Routes.WALLET,
      page: () => const WalletScreen(),
      binding: WalletBinding(),
    ),
  ];
}
