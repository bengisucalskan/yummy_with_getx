import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/home_details/controller/home_detail_controller.dart';
import '/feature/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeDetailController>(() => HomeDetailController());
  }
}
