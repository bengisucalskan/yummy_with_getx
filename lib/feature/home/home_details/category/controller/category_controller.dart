import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/favorite/controller/favorite_controller.dart';
import 'package:getx_architecture_template/feature/favorite/controller/favorite_mixin.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';
import 'package:getx_architecture_template/feature/home/service/home_service.dart';

class CategoryController extends GetxController with FavoriteMixin {
  IHomeService homeService = HomeService();
  final RxList<Meals> mealsByCategory = <Meals>[].obs;
  final RxBool isLoading = true.obs;
  RxString category = "".obs;

  @override
  void onInit() {
    super.onInit();
    category.value = Get.parameters['category'] ?? '';
    loadMealsForCategory(category.value);
  }

  void loadMealsForCategory(String category) async {
    isLoading.value = true;

    var response = await homeService.fetchMealsByCategory(category);
    mealsByCategory.value = response?.data?.meals ?? [];

    isLoading.value = false;
  }
}
