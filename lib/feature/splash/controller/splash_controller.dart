import 'package:get/get.dart';

import '../../../core/constants/routes/navigation_constants.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2))
        .then((value) => Get.offNamed(Routes.LOGIN));
    super.onInit();
  }
}
