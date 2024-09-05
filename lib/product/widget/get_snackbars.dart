import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetBars {
  static errorSnackBar(String title, String message) => Get.snackbar(
        title,
        message,
        barBlur: 150,
        //     backgroundColor: AppColors.themeColor.withOpacity(0.9),
        //  colorText: AppColors.white,
        duration: const Duration(milliseconds: 5000),
        dismissDirection: DismissDirection.horizontal,
      );

  static successSnackBar(title, message) => Get.snackbar(
        title,
        message,
        // backgroundColor: AppColors.green,
        // colorText: AppColors.white,
        duration: const Duration(milliseconds: 1500),
        dismissDirection: DismissDirection.horizontal,
      );

  static warningSnackBar(title, message) => Get.snackbar(
        title,
        message,
        // backgroundColor: AppColors.yellow,
        //  colorText: AppColors.black,
        duration: const Duration(milliseconds: 1500),
        dismissDirection: DismissDirection.horizontal,
      );
}
