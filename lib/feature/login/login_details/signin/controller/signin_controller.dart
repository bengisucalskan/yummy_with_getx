import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';

class SigninController extends GetxController {
  final RxBool obscureText = true.obs;
  final RxBool isFormValid = false.obs;

  final TextEditingController password = TextEditingController();
  final TextEditingController mailC = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void passwordVisibility() {
    obscureText.value = !obscureText.value;
  }

  void validateForm() {
    if (mailC.text.isNotEmpty && password.text.isNotEmpty) {
      isFormValid.value = true;
    } else {
      isFormValid.value = false;
    }
  }

  Future<void> login() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: mailC.text,
        password: password.text,
      )
          .then((value) {
        Get.offAllNamed(Routes.BASE);
        FirebaseCrashlytics.instance.setUserIdentifier(mailC.text);
        log('MAİL ${value.additionalUserInfo?.username}', name: 'FIREBASEAUTH');
      });
    } catch (e) {
      Get.snackbar("kayıt hatası", e.toString());
      log('Hata $e', name: 'FIREBASEERROR');
    }
  }

  void updatePassword(String pass) {
    mailC.text = pass;
  }

  @override
  void onClose() {
    mailC.dispose();
    super.onClose();
  }
}
