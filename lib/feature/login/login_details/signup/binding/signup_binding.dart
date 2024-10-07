import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/login/login_details/signin/controller/signin_controller.dart';
import 'package:getx_architecture_template/feature/login/login_details/signup/controller/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(SignupController.new);
  }
}
