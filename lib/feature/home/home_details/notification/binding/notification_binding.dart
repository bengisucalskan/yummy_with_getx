import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/home_details/notification/controller/notification_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(NotificationController.new);
  }
}
