import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/base/controller/base_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(() => BaseController());
  }
}
