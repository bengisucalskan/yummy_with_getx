import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/enums/preferences_types.dart';
import 'package:getx_architecture_template/core/init/cache/locale_manager.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';
import 'package:getx_architecture_template/feature/home/service/home_service.dart';

class OptionController extends GetxController {
  IHomeService homeService = HomeService();
  final RxList<Meals> mealsById = <Meals>[].obs;
  final RxBool isLoading = true.obs;
  var selectedSize = 'S'.obs;

  @override
  void onInit() {
    super.onInit();
    String id = Get.parameters['id'] ?? '';
    print("Alınan ID: $id");
    loadMealsForId(id);
  }

  void selectSize(String size) {
    selectedSize.value = size;
  }

  void loadMealsForId(String id) async {
    isLoading.value = true;
    final response = await homeService.fetchMealsById(id);
    if (response?.data?.meals != null) {
      mealsById.value = response?.data?.meals ?? [];
    } else {
      print("API'den gelen meals verisi null.");
    }
    isLoading.value = false;
  }

  Future<void> addToCart(Meals meal) async {
    final prefs = LocaleManager.instance;
    try {
      List<String> list = List.empty(growable: true);
      if (!(prefs.getStringList(PreferencesTypes.cartList) == null ||
          prefs.getStringList(PreferencesTypes.cartList)!.isEmpty)) {
        list = prefs.getStringList(PreferencesTypes.cartList) ?? [];
      }

      list.add(jsonEncode(meal));

      await prefs.setStringList(PreferencesTypes.cartList, list);
    } catch (e) {
      print("Error adding to cart: $e");
    }
  }
}
