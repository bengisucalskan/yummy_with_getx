import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/order/order_detail/order_detail/controller/order_detail_controller.dart';
import 'package:getx_architecture_template/product/widget/appbar.dart';

class OrderDetailScreen extends GetView<OrderDetailController> {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Order Detail',
        onBackPressed: Get.back,
      ),
    );
  }
}
