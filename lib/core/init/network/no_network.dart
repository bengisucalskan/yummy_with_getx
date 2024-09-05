import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../product/widget/get_bottom_sheet.dart';

class NoNetworkManager {
  final VoidCallback? onRetry;
  final bool isEnable;

  NoNetworkManager({required this.onRetry, this.isEnable = false});

  Future<void> show() async {
    if (!isEnable) return;
    if (await _checkConnectivity()) return;

    await GetBottomSheet.bottomshet(onRety: () {
      Get.back();
      onRetry?.call();
    });
  }

  Future<bool> _checkConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) return false;
    return true;
  }
}
