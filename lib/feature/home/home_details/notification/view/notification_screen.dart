import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/product/widget/appbar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notification',
        onBackPressed: () => Get.back(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: context.paddingNormal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _notificationTitle(context, text: 'New'),
              _notificationCard(
                title: 'Order canceled!',
                iconData: Icons.cancel,
                color: Theme.of(context).colorScheme.onPrimary,
                description:
                    'You have canceled an order at Burger Hut. We apologize for your inconvenience. We will try to improve our service next time.',
              ),
              _notificationTitle(context, text: 'Old'),
              _notificationCard(
                title: 'Order Success',
                iconData: Icons.check_circle,
                color: Colors.green,
                description:
                    'Your order at Burger Hut has been successfully processed.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _notificationTitle(BuildContext context, {String? text}) {
  return Padding(
    padding: context.paddingNormal,
    child: Text(
      text ?? '',
      style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _notificationCard(
    {required String title,
    required IconData iconData,
    required Color color,
    required String description}) {
  return ListTile(
    leading: Icon(iconData, color: color),
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    subtitle: Text(
      description,
      style: const TextStyle(color: Colors.grey),
    ),
    isThreeLine: true,
  );
}
