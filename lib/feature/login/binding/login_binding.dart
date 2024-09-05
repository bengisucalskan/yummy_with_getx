import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/login/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
