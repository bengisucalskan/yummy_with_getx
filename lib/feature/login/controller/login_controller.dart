import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';
//import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';

class LoginController extends GetxController {
  final RxBool obscureText = true.obs;
  final RxString password = ''.obs;
  var phoneController = MaskedTextController(mask: '(000) 000-0000');
  var obscureText1 = true.obs;
  var obscureText2 = true.obs;

  void togglePasswordVisibility1() {
    obscureText1.value = !obscureText1.value;
  }

  void togglePasswordVisibility2() {
    obscureText2.value = !obscureText2.value;
  }

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  void login() {
    if (phoneController.text == "(507) 115-6048" && password.value == "444") {
      Get.offAllNamed(Routes.BASE);
    } else {
      Get.snackbar("Hata", "Yanlış telefon numarası veya şifre",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void updatePassword(String pass) {
    password.value = pass;
  }

  @override
  void onClose() {
    phoneController.dispose(); // Controller kapanırken kaynakları serbest bırak
    super.onClose();
  }
}
