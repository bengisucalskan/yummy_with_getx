import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';
import 'package:getx_architecture_template/feature/home/service/home_service.dart';

class CategoryController extends GetxController {
  IHomeService homeService = HomeService();
  final RxList<Meals> mealsByCategory = <Meals>[].obs;
  final RxBool isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    String category = Get.parameters['category'] ?? '';
    loadMealsForCategory(category); 
  }

  void loadMealsForCategory(String category) async {
    isLoading.value = true;

    var response = await homeService.fetchMealsByCategory(category);
    print("API'den Gelen Yanıt: ${response?.data?.meals}");
    mealsByCategory.value = response?.data?.meals ?? [];

    isLoading.value = false;
  }
}
