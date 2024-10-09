import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/order/order_detail/order_detail/controller/order_detail_controller.dart';

class OrderDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailController>(OrderDetailController.new);
  }
}
