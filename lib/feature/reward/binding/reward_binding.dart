import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/reward/controller/reward_controller.dart';

class RewardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RewardController>(RewardController.new);
  }
}
