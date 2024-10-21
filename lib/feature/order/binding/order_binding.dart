import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/order/controller/order_controller.dart';

class OrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(() => OrderController());
  }
}
