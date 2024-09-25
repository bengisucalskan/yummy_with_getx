import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home_details/meal/controller/meal_controller.dart';

class MealBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MealController>(() => MealController());
  }
}
