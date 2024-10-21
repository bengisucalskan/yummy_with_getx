import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
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
  var quantity = 1.obs;

  @override
  void onInit() {
    super.onInit();
    String id = Get.parameters['id'] ?? '';
    print("Alınan ID: $id");
    loadMealsForId(id);
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

  void selectSize(String size) {
    selectedSize.value = size;
  }

  void increaseQuantity() {
    quantity.value++;
  }

  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  Future<void> addToCart(Meals meal) async {
    final prefs = LocaleManager.instance;
    try {
      List<String> list = prefs.getStringList(PreferencesTypes.cartList) ?? [];

      for (int i = 0; i < quantity.value; i++) {
        list.add(jsonEncode(meal));
      }

      await prefs.setStringList(PreferencesTypes.cartList, list);
    } catch (e) {
      print("Error adding to cart: $e");
    }
  }

  Future<void> addMeal(Meals meal) {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');

    return users
        .add({
          'id': meal.idMeal,
          'meal': meal.strMeal,
          'photo': meal.strMealThumb,
        })
        .then((value) => log("User added successfully!"))
        .catchError((error) {
          if (kDebugMode) {
            log('Hata ${error}', name: 'OPTION CONTROLLER ADD MEAL');
          }
          FirebaseCrashlytics.instance.recordError(error, StackTrace.current);
        });
  }
}
