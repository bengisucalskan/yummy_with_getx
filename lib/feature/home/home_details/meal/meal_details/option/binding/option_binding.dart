import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/home_details/meal/meal_details/option/controller/option_controller.dart';

class OptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OptionController>(OptionController.new);
  }
}
