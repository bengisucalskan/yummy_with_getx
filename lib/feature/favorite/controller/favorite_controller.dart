import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';

class FavoriteController extends GetxController {
  final RxList<Meals> favoriteMeals = <Meals>[].obs; // Favori yemekler listesi

  @override
  void onInit() {
    super.onInit();
  }

  void addToFavorites(Meals meal) {
    // Favori listesine ekleme
    if (!favoriteMeals.contains(meal)) {
      favoriteMeals.add(meal);
    }
  }

  void removeFromFavorites(Meals meal) {
    // Favori listesinden çıkarma
    favoriteMeals.remove(meal);
  }
}
