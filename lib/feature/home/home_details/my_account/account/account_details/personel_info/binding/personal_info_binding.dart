import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/home_details/my_account/account/account_details/personel_info/controller/personal_info_controller.dart';

class PersonalInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalInfoController>(PersonalInfoController.new);
  }
}
