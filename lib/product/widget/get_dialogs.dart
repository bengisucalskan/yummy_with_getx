import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:getx_architecture_template/product/widget/circle_progresbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GetDialog {
  static questionDialog(
          {String? title,
          String? message,
          Callback? cancelPress,
          Callback? confimPress}) =>
      Get.defaultDialog(
        barrierDismissible: false,
        titlePadding: EdgeInsets.only(top: 3.h),
        contentPadding: EdgeInsets.all(15.sp),
        title: title!,
        //  titleStyle: Styles.largeBoldFontStyle(),
        middleText: message!,
        //  middleTextStyle: Styles.normalBoldFontStyle(),
        confirm: ElevatedButton(
            style: ButtonStyle(
                //    backgroundColor: MaterialStatePropertyAll(AppColors.themeColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.sp)))),
            onPressed: confimPress,
            child: Text(
              "Evet",
              // style: Styles.smallBoldFontStyle().copyWith(color: AppColors.white),
            )),
        cancel: ElevatedButton(
            style: ButtonStyle(
                //backgroundColor: MaterialStatePropertyAll(AppColors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.sp)))),
            onPressed: cancelPress ??
                () {
                  Get.back();
                },
            child: Text(
              "Hayır",
              //    style: Styles.smallBoldFontStyle(),
            )),
      );

  static Widget circulerDialog(
          {String? title, String? message, Callback? confimPress}) =>
      Scaffold(
        body: CircleProgressBarLoading(),
      );

  static warningDialog(
          {String? title, String? message, Callback? confimPress}) =>
      Get.defaultDialog(
        barrierDismissible: false,
        titlePadding: EdgeInsets.only(top: 3.h),
        contentPadding: EdgeInsets.all(15.sp),
        title: title!,
        //   titleStyle: Styles.largeBoldFontStyle(),
        middleText: message!,
        //middleTextStyle: Styles.normalBoldFontStyle(),
        confirm: ElevatedButton(
            style: ButtonStyle(
                //   backgroundColor: MaterialStatePropertyAll(AppColors.themeColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.sp)))),
            onPressed: confimPress ??
                () {
                  Get.back();
                },
            child: Text(
              "Tamam",
              //   style: Styles.smallBoldFontStyle().copyWith(color: AppColors.white),
            )),
      );
}
