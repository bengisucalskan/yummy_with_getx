import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/order/order_detail/call/controller/call_controller.dart';

class CallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CallController>(CallController.new);
  }
}
