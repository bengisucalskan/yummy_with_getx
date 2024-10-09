import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/order/order_detail/fromCartToOrder/controller/from_cart_to_order_controller.dart';

class FromCartToOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FromCartToOrderController>(FromCartToOrderController.new);
  }
}
