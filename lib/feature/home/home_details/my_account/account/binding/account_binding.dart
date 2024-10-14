import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/home_details/my_account/account/controller/account_controller.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountController>(AccountController.new);
  }
}
