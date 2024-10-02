import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/controller/home_controller.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
            'Notification',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _notificationTitle(text: 'New'),
              _notificationCard(
                title: 'Order canceled!',
                iconData: Icons.cancel,
                color: Colors.red,
                description:
                    'You have canceled an order at Burger Hut. We apologize for your inconvenience. We will try to improve our service next time.',
              ),
              _notificationTitle(text: 'Old'),
              _notificationCard(
                title: 'Order Success',
                iconData: Icons.check_circle,
                color: Colors.green,
                description:
                    'Your order at Burger Hut has been successfully processed.',
              ),
            ],
          ),
        ));
  }
}

Widget _notificationTitle({String? text}) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Text(
      text ?? '',
      style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _notificationCard(
    // buradaki title subtitle hizalamasını ayarlayamadım. ve siparişler  bildirimleri neye göre gelecek?
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
