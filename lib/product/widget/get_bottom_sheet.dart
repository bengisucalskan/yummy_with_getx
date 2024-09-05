import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GetBottomSheet {
  static bottomshet({Callback? onRety}) => Get.bottomSheet(
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          LottieBuilder.asset('assets/lottie/nonetwork.json'),
          Column(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.refresh,
                    size: 23.sp,
                  ),
                  onPressed: onRety),
              const Text(
                "İnternet bağlantınızı kontrol ediniz",
                style: TextStyle(),
              )
            ],
          ),
        ],
      ),
      backgroundColor: Colors.white,
      isDismissible: false,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.only(topLeft: Radius.circular(5.w), topRight: Radius.circular(5.w)),
      ));
}
