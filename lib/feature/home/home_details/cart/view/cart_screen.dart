import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/image/images.dart';
import 'package:getx_architecture_template/core/extension/image_ex.dart';
import 'package:getx_architecture_template/feature/home/home_details/cart/controller/cart_controller.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Cart',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(() {
        if (controller.isCartEmpty) {
          // bura yanlışmış
          return buildEmptyCart(context); // Sepet boşsa gösterilecek içerik
        } else {
          return buildCartItems(); // Sepette ürün varsa gösterilecek içerik
        }
      }),
    );
  }
}

Widget buildEmptyCart(BuildContext context) {
  return Align(
    alignment: const Alignment(0, -0.6),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AppImages.instance.smilingFace.assetImage,
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'No orders',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onTertiary),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            'Sorry, you have no orders in your cart, please add your order to your cart.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      ],
    ),
  );
}

Widget buildCartItems() {
  return const Text('sepet dolu');
}
