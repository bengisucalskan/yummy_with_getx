import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';

class FromCartToOrderController extends GetxController {
  final RxList<Meals> cartItems = <Meals>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Get.arguments'ı List<Meals> türüne cast edip ve cartItems'a koyuyo
    if (Get.arguments != null) {
      cartItems.assignAll((Get.arguments as List<dynamic>).cast<Meals>());
    }
  }
}
