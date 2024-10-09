import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FavoriteController extends GetxController {
  final RxList<Meals> favoriteMeals = <Meals>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  void addToFavorites(Meals meal) async {
    if (!favoriteMeals.any((favMeal) => favMeal.idMeal == meal.idMeal)) {
      favoriteMeals.add(meal);
      await saveFavorites();
    } else {
      Get.snackbar("Warning", "This meal is already in favorites.");
    }
  }

  void removeFromFavorites(Meals meal) async {
    favoriteMeals.removeWhere((favMeal) => favMeal.idMeal == meal.idMeal);
    await saveFavorites();
  }

  bool isFavorite(Meals meal) {
    return favoriteMeals.any((favMeal) => favMeal.idMeal == meal.idMeal);
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteMealsJson =
        favoriteMeals.map((meal) => jsonEncode(meal.toJson())).toList();
    await prefs.setStringList('favorites', favoriteMealsJson);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? favoriteMealsJson = prefs.getStringList('favorites');
    if (favoriteMealsJson != null) {
      favoriteMeals.value = favoriteMealsJson
          .map((mealJson) =>
              Meals.fromJson(jsonDecode(mealJson) as Map<String, dynamic>))
          .toList();
    }
  }
}
