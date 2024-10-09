import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/favorite/controller/favorite_mixin.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';
import 'package:getx_architecture_template/feature/home/service/home_service.dart';

class AreaController extends GetxController with FavoriteMixin {
  IHomeService homeService = HomeService();
  final RxBool isLoading = true.obs;
  final RxList<Meals> mealsByArea = <Meals>[].obs;
  RxString country = "".obs;

  @override
  void onInit() {
    super.onInit();
    country.value = Get.parameters['country'] ?? '';
    loadMealsForCountry(country.value);
  }

  void loadMealsForCountry(String country) async {
    isLoading.value = true;

    var response = await homeService.fetchMealsByArea(country);
    mealsByArea.value = response?.data?.meals ?? [];

    isLoading.value = false;
  }
}
