import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';

class FavoriteController extends GetxController {
  final RxList<Meals> favoriteMeals = <Meals>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void addToFavorites(Meals meal) {
    if (!favoriteMeals.contains(meal)) {
      favoriteMeals.add(meal);
    }
  }

  void removeFromFavorites(Meals meal) {
    favoriteMeals.remove(meal);
  }
}
