import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/home_details/cart/controller/cart_controller.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';
import 'package:getx_architecture_template/feature/home/service/home_service.dart';

class OptionController extends GetxController {
  IHomeService homeService = HomeService();
  final RxList<Meals> mealsById = <Meals>[].obs;
  final RxBool isLoading = true.obs;
  var selectedSize = 'S'.obs;

  @override
  void onInit() {
    super.onInit();
    String id = Get.parameters['id'] ?? '';
    print("Alınan ID: $id");
    loadMealsForId(id);
  }

  void selectSize(String size) {
    selectedSize.value = size;
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

  void addToCart(Meals meal) {
    try {
      final CartController cartController = Get.put(CartController());
      cartController.addToCart(meal);
    } catch (e) {
      print("Error adding to cart: $e");
    }
  }
}
