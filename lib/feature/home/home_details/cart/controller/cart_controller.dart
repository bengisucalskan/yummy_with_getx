import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';

class CartController extends GetxController {
  final RxList<Meals> cartItems = <Meals>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCartItems();
  }

  Future<void> addToCart(Meals meal) async {
    if (!cartItems.any((item) => item.idMeal == meal.idMeal)) {
      cartItems.add(meal);
      await Future.delayed(const Duration(
          milliseconds:
              100)); // aksi halde cart screen yenilenmiyordu ondan ekledim
      await saveCartItems();
      print('Meal added and saved');
    } else {
      Get.snackbar("Warning", "This meal is already in your cart.");
    }
  }

  Future<void> removeFromCart(int index) async {
    cartItems.removeAt(index);
    await saveCartItems();
  }

  Future<void> loadCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cartData = prefs.getString('cart');

    if (cartData != null) {
      try {
        List<dynamic> jsonList = jsonDecode(cartData) as List<dynamic>;
        cartItems.value = jsonList
            .map((item) => Meals.fromJson(item as Map<String, dynamic>))
            .toList();
        print('Cart items loaded: $cartItems');
      } catch (e) {
        print("Error decoding cart data: $e");
      }
    }
  }

  Future<void> saveCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<Map<String, dynamic>> jsonList =
        cartItems.map((item) => item.toJson()).toList();

    prefs.setString('cart', jsonEncode(jsonList));
  }

  bool get isCartEmpty => cartItems.isEmpty;
}
