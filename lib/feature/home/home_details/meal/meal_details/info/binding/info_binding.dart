import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/home_details/meal/meal_details/info/controller/info_controller.dart';

class InfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfoController>(InfoController.new);
  }
}
