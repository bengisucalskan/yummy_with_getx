import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/home_details/my_account/account/account_details/personel_info/controller/personel_info_controller.dart';

class PersonelInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonelInfoController>(PersonelInfoController.new);
  }
}
