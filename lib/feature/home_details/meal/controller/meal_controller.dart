import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';
import 'package:getx_architecture_template/feature/home/service/home_service.dart';

class MealController extends GetxController {
  IHomeService homeService = HomeService();
  final RxList<Meals> mealsById = <Meals>[].obs;
  final RxBool isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    String id = Get.parameters['id'] ?? '';
    loadMealsForId(id);
  }

  void loadMealsForId(String id) async {
    isLoading.value = true;

    var response = await homeService.fetchMealsById(id);
    print("API'den Gelen Yanıt: ${response?.data?.meals}");
    mealsById.value = response?.data?.meals ?? [];

    isLoading.value = false;
  }
}
