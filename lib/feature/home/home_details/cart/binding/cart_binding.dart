import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/home_details/cart/controller/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(CartController.new);
  }
}
