import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/feature/order/order_detail/order_detail/controller/order_detail_controller.dart';
import 'package:getx_architecture_template/product/widget/appbar.dart';

class OrderDetailScreen extends GetView<OrderDetailController> {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Order Detail',
        onBackPressed: Get.back,
      ),
      body: SingleChildScrollView(
        padding: context.paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Status',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            context.sizedBoxlow,

            Text(
              'Preparing',
              style: TextStyle(
                  fontSize: 16, color: Theme.of(context).colorScheme.secondary),
            ),
            context.sizedBoxMedium,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.receipt_long,
                    color: Theme.of(context).colorScheme.onTertiary),
                Icon(Icons.kitchen,
                    color: Theme.of(context).colorScheme.secondary),
                Icon(Icons.delivery_dining,
                    color: Theme.of(context).colorScheme.secondary),
                Icon(Icons.check_circle_outline,
                    color: Theme.of(context).colorScheme.secondary),
              ],
            ),
            context.sizedBoxlow,
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.FOLLOW);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Follow the order',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 14),
                ],
              ),
            ),
            context.sizedBoxMedium,
            Divider(
                color: Theme.of(context).colorScheme.secondary, thickness: 1),

            // Ürün Listesi
            _buildOrderItem(
              context,
              controller.order.strMealThumb ?? '',
              controller.order.strMeal ?? 'Meal Name',
              'happy not angry',
              r'$7.02',
              '2x',
            ),

            context.sizedBoxMedium,
            // Ödeme Bilgileri
            _buildPaymentDetail('Quantity (4 items)', r'$12', context),
            _buildPaymentDetail('Shipping fee : 1.5 km', r'$23', context),
            _buildPaymentDetail('Voucher', r'-$3', context),
            _buildPaymentDetail('Yummy', r'-$1', context),
            Divider(
              color: Theme.of(context).colorScheme.secondary,
              thickness: 1,
            ),

            // Toplam paymnet
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total payment',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      r'$34',
                      style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    context.sizedBoxlow,
                    Text(
                      r'$23',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            context.sizedBoxMedium,
            Divider(
              color: Theme.of(context).colorScheme.secondary,
              thickness: 1,
            ),

            // Ödeme Yöntemi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Payment Method',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text('d'),
                        ),
                        context.sizedBoxlow,
                        const Text('Cash', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            context.sizedBoxMedium,
            Divider(
                color: Theme.of(context).colorScheme.secondary, thickness: 1),

            _buildOrderInfo('Order code', 'DBAJFI-55616_SD34V', context),
            _buildOrderInfo('Receiver', 'Dinh Bao', context),
            _buildOrderInfo('Phone number', '0356056591', context),
            _buildOrderInfo(
              'Address',
              '89 Pham Van Dong,',
              context,
            ),
            context.sizedBoxMedium,
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.CANCEL_ORDER);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                ),
                child: Text(
                  'Cancel order',
                  style: TextStyle(
                      color: context.colorScheme.onSecondary, fontSize: 16),
                ),
              ),
            ),
            context.sizedBoxMedium,
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(BuildContext context, String imageURL, String title,
      String description, String price, String quantity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageURL,
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          context.sizedBoxlow,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          Text(price, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildPaymentDetail(String title, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 14)),
          Text(value, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildOrderInfo(String title, String info, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 14)),
          Expanded(
            child: Text(
              info,
              textAlign: TextAlign.end,
              style: const TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
