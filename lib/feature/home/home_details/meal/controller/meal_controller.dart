import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/favorite/controller/favorite_mixin.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';
import 'package:getx_architecture_template/feature/favorite/controller/favorite_controller.dart';
import 'package:getx_architecture_template/feature/home/service/home_service.dart';

class MealController extends GetxController with FavoriteMixin {
  IHomeService homeService = HomeService();
  final RxList<Meals> mealsById = <Meals>[].obs;
  final RxBool isLoading = true.obs;
  final favoriteController = Get.find<FavoriteController>();

  @override
  void onInit() {
    super.onInit();
    String id = Get.parameters['id'] ?? '';
    loadMealsForId(id);
  }

  void loadMealsForId(String id) async {
    isLoading.value = true;
    var response = await homeService.fetchMealsById(id);
    if (response?.data?.meals != null) {
      mealsById.value = response?.data?.meals ?? [];
    } else {
      print("API'den gelen meals verisi null.");
    }
    isLoading.value = false;
  }
}
