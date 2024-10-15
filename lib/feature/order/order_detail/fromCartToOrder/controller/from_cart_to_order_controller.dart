import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/enums/preferences_types.dart';
import 'package:getx_architecture_template/core/init/cache/locale_manager.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';

class FromCartToOrderController extends GetxController {
  final RxList<Meals> cartItems = <Meals>[].obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      cartItems.assignAll((Get.arguments as List<dynamic>).cast<Meals>());
    }
  }

  Future<void> addToOrder(List<Meals> meals) async {
    final prefs = LocaleManager.instance;
    try {
      List<String> listOrder =
          prefs.getStringList(PreferencesTypes.orderList) ?? [];

      for (var meal in meals) {
        listOrder.add(jsonEncode(meal.toJson()));
      }

      await prefs.setStringList(PreferencesTypes.orderList, listOrder);
      print('Orders added: $listOrder');
    } catch (e) {
      print("Error adding to order: $e");
    }
  }
}
