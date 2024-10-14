import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getx_architecture_template/feature/order/order_detail/call/controller/call_controller.dart';
import 'package:getx_architecture_template/product/widget/appbar.dart';

class CallScreen extends GetView<CallController> {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Call', onBackPressed: Get.back),
    );
  }
}
