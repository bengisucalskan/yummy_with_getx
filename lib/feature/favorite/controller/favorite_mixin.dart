// lib/feature/favorite/controller/favorite_mixin.dart

import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/favorite/controller/favorite_controller.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';

mixin FavoriteMixin on GetxController {
  final FavoriteController favoriteController = Get.put(FavoriteController());

  void toggleFavorite(Meals meal) {
    if (favoriteController.isFavorite(meal)) {
      favoriteController.removeFromFavorites(meal);
      Get.snackbar('Favorite', 'Removed from favorites!');
    } else {
      favoriteController.addToFavorites(meal);
      Get.snackbar('Favorite', 'Added to favorites!');
    }
  }

  bool isFavorite(Meals meal) {
    return favoriteController.isFavorite(meal);
  }
}
