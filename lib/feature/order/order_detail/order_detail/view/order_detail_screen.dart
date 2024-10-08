import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/feature/order/controller/order_controller.dart';

class OrderDetailScreen extends GetView<OrderController> {
  const OrderDetailScreen({Key? key}) : super(key: key);

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
          'Order',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: context.paddingNormal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Harita ve Adres Bilgisi
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/discover.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Icon(Icons.location_on,
                          size: 30,
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                  ],
                ),
              ),
              context.sizedBoxlow,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "NYC, Broadway Ave",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "0356056591",
                        style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.black54),
                ],
              ),
              context.sizedBoxMedium,
              // Ürün Listesi
              _buildOrderItem(
                  context, "Hamburger", "Relaxing Hamburger", "\$12.00"),
              context.sizedBoxlow,
              _buildOrderItem(
                  context, "Hamburger", "Relaxing Hamburger", "\$12.00"),
              context.sizedBoxlow,
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  padding: context.paddingLow,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add, color: Colors.black),
                    Text('Add item', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
              context.sizedBoxMedium,

              const Text(
                "For You",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              context.sizedBoxlow,
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return _buildSuggestedItem(context);
                  },
                ),
              ),
              context.sizedBoxMedium,

              Divider(
                  color: Theme.of(context).colorScheme.onPrimary,
                  thickness: 10),

              const Text(
                "Checkout detail",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              context.sizedBoxlow,
              _buildCheckoutDetail(context, "Mastercard"),
              Divider(color: Theme.of(context).colorScheme.onPrimary),
              _buildCheckoutDetail(context, "Enter your promotion code"),
              Divider(
                  color: Theme.of(context).colorScheme.onPrimary,
                  thickness: 10),
              // Total Fiyat
              _buildTotalDetail('Merchandise Subtotal', r'$23', context),
              _buildTotalDetail(
                'Shipping Total',
                r'$1',
                context,
              ),
              Divider(color: Theme.of(context).colorScheme.onPrimary),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Payment",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$24",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ],
              ),
              context.sizedBoxMedium,

              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.onTertiary,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 120),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Checkout',
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
      BuildContext context, String title, String description, String price) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            'assets/images/discover.png',
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
                description,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                price,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onTertiary),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.edit_outlined),
        ),
      ],
    );
  }

  Widget _buildSuggestedItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/discover.png',
              height: 60,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "4% off your order",
              style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
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
          Text(title,
              style: const TextStyle(
                fontSize: 16,
              )),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
