import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/enums/preferences_types.dart';
import 'package:getx_architecture_template/core/init/cache/locale_manager.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  final RxList<Meals> cartItems = <Meals>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCartItems();
  }

  Future<void> removeFromCart(int index) async {
    final prefs = LocaleManager.instance;
    final cartData = prefs.getStringList(PreferencesTypes.cartList);

    if (cartData != null) {
      cartData.removeAt(index);

      cartItems.removeAt(index);

      await prefs.setStringList(PreferencesTypes.cartList, cartData);

      print('Cart updated after removal: $cartItems');
    }
  }

  Future<void> loadCartItems() async {
    final prefs = LocaleManager.instance;
    final cartData = prefs.getStringList(PreferencesTypes.cartList);

    if (cartData != null) {
      try {
        print('jsonEncode ${json.decode(cartData.first)}');
        cartItems.value = cartData
            .map((item) =>
                Meals.fromJson(json.decode(item) as Map<String, dynamic>))
            .toList(); // JSON verisini Meals'e çeviriyo
        print('Cart items loaded: $cartItems');
      } catch (e) {
        print("Error decoding cart data: $e");
      }
    }
  }

  bool get isCartEmpty => cartItems.isEmpty;
}
