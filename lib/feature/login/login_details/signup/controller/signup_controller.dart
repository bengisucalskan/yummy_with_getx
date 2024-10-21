import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';

class SignupController extends GetxController {
  final TextEditingController fullName = TextEditingController();
  final TextEditingController phoneNumber =
      MaskedTextController(mask: '(000) 000-0000');
  final TextEditingController mailC = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final RxBool obscureText = true.obs;
  final RxBool obscureText1 = true.obs;
  final RxBool isFormValid = false.obs;

  void passwordVisibility() {
    obscureText.value = !obscureText.value;
  }

  void passwordVisibility2() {
    obscureText1.value = !obscureText1.value;
  }

  void validateForm() {
    if (fullName.text.isNotEmpty &&
        phoneNumber.text.isNotEmpty &&
        mailC.text.isNotEmpty &&
        password.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      isFormValid.value = true;
    } else {
      isFormValid.value = false;
    }
  }

  Future<void> signUp() async {
    if (password.text != confirmPasswordController.text) {
      Get.snackbar("Hata", "Şifreler eşleşmiyor.");
      return;
    }

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: mailC.text,
        password: password.text,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({
        'fullName': fullName.text,
        'phoneNumber': phoneNumber.text,
        'email': mailC.text,
      });

      Get.offAllNamed(Routes.BASE);
      FirebaseCrashlytics.instance.setUserIdentifier(mailC.text);
      log('Kullanıcı adı ${userCredential.user?.email}', name: 'FIREBASEAUTH');
    } catch (e) {
      Get.snackbar("Kayıt hatası", e.toString());
      log('Hata $e', name: 'FIREBASEERROR');
    }
  }

  @override
  void onClose() {
    // Controller'ları dispose edeyorz
    fullName.dispose();
    phoneNumber.dispose();
    mailC.dispose();
    password.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
