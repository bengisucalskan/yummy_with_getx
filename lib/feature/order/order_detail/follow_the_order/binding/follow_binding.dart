import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/order/order_detail/follow_the_order/controller/follow_controller.dart';

class FollowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FollowController>(FollowController.new);
  }
}
