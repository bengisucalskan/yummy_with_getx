import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';
import 'package:getx_architecture_template/feature/order/order_detail/fromCartToOrder/controller/from_cart_to_order_controller.dart';
import 'package:getx_architecture_template/product/widget/appbar.dart';

class FromCartToOrderScreen extends GetView<FromCartToOrderController> {
  const FromCartToOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Order',
        onBackPressed: Get.back,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: context.paddingNormal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Harita ve Adres Bilgisi
              _buildAddressSection(context),
              context.sizedBoxlow,

              // Ürün Listesi
              Obx(() {
                return Column(
                  children: controller.cartItems.map((meal) {
                    return Column(
                      children: [
                        _buildOrderItem(context, meal.strMeal ?? '',
                            meal.strMealThumb ?? '', '\$12.00'),
                        context.sizedBoxlow,
                      ],
                    );
                  }).toList(),
                );
              }),

              Divider(
                  color: Theme.of(context).colorScheme.onPrimary,
                  thickness: 10),

              const Text(
                'Checkout detail',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              context.sizedBoxlow,

              _buildCheckoutDetail(context, 'Mastercard'),
              Divider(color: Theme.of(context).colorScheme.onPrimary),
              _buildCheckoutDetail(context, 'Enter your promotion code'),

              Divider(
                  color: Theme.of(context).colorScheme.onPrimary,
                  thickness: 10),

              // Total Fiyat
              _buildTotalDetail('Merchandise Subtotal', '\$23', context),
              _buildTotalDetail('Shipping Total', '\$1', context),

              Divider(color: Theme.of(context).colorScheme.onPrimary),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Payment',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$24',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              context.sizedBoxMedium,

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _showOrderSuccessDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.onTertiary,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 120,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Payment',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderItem(
      BuildContext context, String title, String imageUrl, String price) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imageUrl,
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
        context.sizedBoxlow,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Relaxing blabla',
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.secondary),
              ),
              Text(
                price,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onTertiary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCheckoutDetail(BuildContext context, String title) {
    return Padding(
      padding: context.paddingLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          const Icon(Icons.arrow_forward_ios, color: Colors.black54),
        ],
      ),
    );
  }

  Widget _buildTotalDetail(String title, String value, BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildAddressSection(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: AssetImage('assets/images/discover.png'), // map olacak
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Icon(
              Icons.location_on,
              size: 30,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ],
      ),
    );
  }

  void _showOrderSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            Get.offAllNamed(Routes.BASE);
          },
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: context.paddingNormal,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  context.sizedBoxMedium,
                  const Icon(Icons.check_circle, color: Colors.green, size: 50),
                  context.sizedBoxMedium,
                  const Text(
                    'Ordered successfully',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  context.sizedBoxlow,
                  Text(
                    'Your order has been successfully placed. You can check your order status in the "Order History" section.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  context.sizedBoxMedium,
                  Text(
                    'Click anywhere to continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  context.sizedBoxMedium,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
