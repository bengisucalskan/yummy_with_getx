import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/home_details/my_account/wallet/controller/wallet_controller.dart';

class WalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletController>(WalletController.new);
  }
}
