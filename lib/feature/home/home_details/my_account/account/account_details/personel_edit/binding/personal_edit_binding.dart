import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/home_details/my_account/account/account_details/personel_edit/controller/personal_edit_controller.dart';

class PersonalEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalEditController>(PersonalEditController.new);
  }
}
