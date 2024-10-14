import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/order/order_detail/cancel_order/controller/cancel_order_controller.dart';

class CancelOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CancelOrderController>(CancelOrderController.new);
  }
}
