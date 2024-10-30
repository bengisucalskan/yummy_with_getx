import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';

class OrderDetailController extends GetxController {
  late final Meals order;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      order = Get.arguments as Meals;
    } else {
      Get.snackbar("Error", "Order details not found");
    }
  }
}
