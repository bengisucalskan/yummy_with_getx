import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/login/login_details/signin/controller/signin_controller.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigninController>(SigninController.new);
  }
}
