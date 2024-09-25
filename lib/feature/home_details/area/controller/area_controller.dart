import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';
import 'package:getx_architecture_template/feature/home/service/home_service.dart';

class AreaController extends GetxController {
  IHomeService homeService = HomeService();
  final RxBool isLoading = true.obs;
  final RxList<Meals> mealsByArea = <Meals>[].obs;

  @override
  void onInit() {
    super.onInit();
    String country = Get.parameters['country'] ?? '';
    loadMealsForCountry(country); 
  }

  void loadMealsForCountry(String country) async {
    isLoading.value = true;

    var response = await homeService.fetchMealsByArea(country);
    mealsByArea.value = response?.data?.meals ?? [];

    isLoading.value = false;
  }
}
