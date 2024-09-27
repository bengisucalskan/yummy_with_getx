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
    print("Alınan ID: $id");
    loadMealsForId(id);
  }

  void loadMealsForId(String id) async {
    isLoading.value = true;
    try {
      var response = await homeService.fetchMealsById(id);
      if (response?.data?.meals != null) {
        mealsById.value = response?.data?.meals ?? [];
      } else {
        print("API'den gelen meals verisi null.");
      }
    } catch (e) {
      print("Hata meydana geldi: $e");
    }

    isLoading.value = false;
  }
}
