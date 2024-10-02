import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/order/controller/order_controller.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(OrderController.new);
  }
}
