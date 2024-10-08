import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/image/images.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/core/extension/image_ex.dart';
import 'package:getx_architecture_template/feature/home/home_details/cart/controller/cart_controller.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';

class CartScreen extends GetView<CartController> {
  // ilk tıklamada ürün gelmiyo ikinci tıklamada geliyo
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Cart',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(() {
        if (controller.isCartEmpty) {
          return buildEmptyCart(context);
        } else {
          return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: controller.cartItems.length,
                          itemBuilder: (context, index) {
                            final cart = controller.cartItems[index];
                            return buildCartItems(context, cart);
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 11),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.onTertiary,
                        ),
                        onPressed: () {
                          Get.toNamed(Routes.ORDER_DETAIL);
                        },
                        child: const Text(
                          'Payment',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  context.sizedBoxMedium
                ],
              ));
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
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'No orders',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onTertiary,
            ),
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

Widget buildCartItems(BuildContext context, Meals cart) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            cart.strMealThumb ?? '',
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.strMeal ?? 'Meal Name',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Special instructions', // Özel istek veya ek bilgiler
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    "50.000 d",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "70.000 d",
                    style: const TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Miktar ayarları
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.remove_circle_outline),
            ),
            Text(
              "01",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_circle_outline),
            ),
          ],
        ),
      ],
    ),
  );
}
