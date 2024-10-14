import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/order/order_detail/message/controller/message_controller.dart';

class MessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageController>(MessageController.new);
  }
}
