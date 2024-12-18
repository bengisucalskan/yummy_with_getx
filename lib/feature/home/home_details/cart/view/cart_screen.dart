import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/image/images.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/core/extension/image_ex.dart';
import 'package:getx_architecture_template/feature/home/home_details/cart/controller/cart_controller.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';

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
            padding: context.paddingNormal,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.cartItems.length,
                    itemBuilder: (context, index) {
                      final cart = controller.cartItems[index];
                      return buildCartItems(context, cart, index);
                    },
                  ),
                ),
                buildPaymentButton(context),
                context.sizedBoxMedium,
              ],
            ),
          );
        }
      }),
    );
  }

  Widget buildEmptyCart(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -0.6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AppImages.instance.smilingFace.assetImage,
          Padding(
            padding: context.paddingLow,
            child: Text(
              'No orders',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: context.colorScheme.onTertiary,
              ),
            ),
          ),
          Padding(
            padding: context.paddingLowHorizontal,
            child: Text(
              'Sorry, you have no orders in your cart, please add your order to your cart.',
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: 16, color: context.colorScheme.secondary),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCartItems(BuildContext context, Meals cart, int index) {
    return Padding(
      padding: context.paddingLowVertical,
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
          context.sizedBoxlow,
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
                context.sizedBoxlow,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Special instructions',
                      style: TextStyle(
                        fontSize: 14,
                        color: context.colorScheme.secondary,
                      ),
                    ),
                    Obx(() => Text(
                          'x${controller.itemCounts[cart.idMeal] ?? 1}',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                context.sizedBoxlow,
                Row(
                  children: [
                    Text(
                      "50.000 d",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.onTertiary,
                      ),
                    ),
                    context.sizedBoxlow,
                    Text(
                      "70.000 d",
                      style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color: context.colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              controller.removeFromCart(cart.idMeal ?? '');
            },
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
    );
  }

  Widget buildPaymentButton(BuildContext context) {
    return Padding(
      padding: context.paddingLowVertical,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: context.paddingLowVertical,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: context.colorScheme.onTertiary,
          ),
          onPressed: () {
            Get.toNamed(
              Routes.FROM_CART_TO_ORDER,
              arguments: controller.cartItems,
            );
          },
          child: Text(
            'Payment',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: context.colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
