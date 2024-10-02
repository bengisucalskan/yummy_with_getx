import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/home_details/area/controller/area_controller.dart';

class AreaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AreaController>(() => AreaController());
  }
}
