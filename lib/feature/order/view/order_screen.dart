import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/feature/order/controller/order_controller.dart';

class OrderScreen extends GetView<OrderController> {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: controller.orderItems.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final order = controller.orderItems[index];
            return GestureDetector(
              onTap: () {
                Get.toNamed(Routes.ORDER_DETAIL, arguments: order);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 140,
                      child: Image.network(order.strMealThumb ?? ''),
                    ),
                    context.sizedBoxlow,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 12,
                              ),
                              Text(
                                'Delivered ',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.green),
                              ),
                              Text(
                                '| 05,Apr',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                          context.sizedBoxlow,
                          Text(
                            order.strMeal ?? '',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    context.sizedBoxlow,
                    Column(
                      children: [
                        context.sizedBoxMedium,
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).colorScheme.onSecondary,
                          size: 25,
                        ),
                        IconButton(
                          onPressed: () {
                            controller.removeFromOrder(index);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).colorScheme.onTertiary,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
