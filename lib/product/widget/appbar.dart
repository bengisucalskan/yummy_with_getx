import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants/image/images.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, this.leftIcon, this.title, this.rightIcon});

  final Widget? leftIcon;
  final Widget? title;
  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 1.w),
        margin: EdgeInsets.only(bottom: 0.25.h),
        height: 7.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leftIcon ??
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Image.asset(AppImages.instance.backButton,
                        height: 1.5.h, color: Colors.black87)),
            title ?? const Text(""),
            rightIcon ??
                Container(
                  width: 10.w,
                ),
          ],
        ),
      ),
    );
  }
}
