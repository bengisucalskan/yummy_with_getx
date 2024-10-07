import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';

class SignupController extends GetxController {
  final RxString password = ''.obs;
  var phoneController = MaskedTextController(mask: '(000) 000-0000');
  final RxBool obscureText = true.obs;
  final RxBool obscureText1 = true.obs;

  // ignore: public_member_api_docs
  void passwordVisibility() {
    obscureText.value = !obscureText.value;
  }

  void passwordVisibility2() {
    obscureText1.value = !obscureText1.value;
  }
}
