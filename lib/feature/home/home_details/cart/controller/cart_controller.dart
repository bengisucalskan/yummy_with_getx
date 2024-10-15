import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/enums/preferences_types.dart';
import 'package:getx_architecture_template/core/init/cache/locale_manager.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  final RxList<Meals> cartItems = <Meals>[].obs;
  final RxMap<String, int> itemCounts = <String, int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadCartItems();
  }

  Future<void> addToCart(Meals meal, int quantity) async {
    final prefs = LocaleManager.instance;
    List<String> cartData =
        prefs.getStringList(PreferencesTypes.cartList) ?? [];

    // Aynı ürün varsa, sadece sayısını artıyo
    if (itemCounts.containsKey(meal.idMeal)) {
      itemCounts[meal.idMeal!] = itemCounts[meal.idMeal!]! + quantity;
    } else {
      // Ürün sepette yoksa, ürünü ekle ve kaç taneyse
      itemCounts[meal.idMeal!] = quantity;
      cartItems.add(meal);
    }

    cartData = cartItems.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList(PreferencesTypes.cartList, cartData);

    update();
  }

  Future<void> removeFromCart(int index) async {
    final prefs = LocaleManager.instance;
    final cartData = prefs.getStringList(PreferencesTypes.cartList);

    if (cartData != null) {
      String idMeal = cartItems[index].idMeal ?? '';

      // Ürünün sayısı 1'den fazlaysa sayı azalsın
      if (itemCounts[idMeal] != null && itemCounts[idMeal]! > 1) {
        itemCounts[idMeal] = itemCounts[idMeal]! - 1;
      } else {
        // 1 taneyse ürünü kaldıyo
        itemCounts.remove(idMeal);
        cartData.removeAt(index);
        cartItems.removeAt(index);
      }

      await prefs.setStringList(PreferencesTypes.cartList, cartData);
      print('Cart updated after removal: $cartItems');
    }
  }

  Future<void> loadCartItems() async {
    final prefs = LocaleManager.instance;
    final cartData = prefs.getStringList(PreferencesTypes.cartList);

    if (cartData != null) {
      try {
        cartItems.clear();
        itemCounts.clear();

        for (String item in cartData) {
          Meals meal =
              Meals.fromJson(json.decode(item) as Map<String, dynamic>);
          // Aynı ürün varsa sayısı artıyo, yoksa ürünü listeye ekliyo
          if (itemCounts.containsKey(meal.idMeal)) {
            itemCounts[meal.idMeal!] = itemCounts[meal.idMeal!]! + 1;
          } else {
            cartItems.add(meal);
            itemCounts[meal.idMeal!] = 1;
          }
        }

        print('Cart items loaded: $cartItems');
      } catch (e) {
        print("Error decoding cart data: $e");
      }
    }
  }

  bool get isCartEmpty => cartItems.isEmpty;
}
