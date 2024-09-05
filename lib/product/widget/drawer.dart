import 'package:flutter/material.dart';
import 'package:getx_architecture_template/core/constants/image/images.dart';
import 'package:getx_architecture_template/core/extension/image_ex.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Dang bao bao"),
            accountEmail: const Text("ID 04378796"),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/ellipse.png'),
            ),
            onDetailsPressed: () {},
          ),
          ListTile(
            leading: AppImages.instance.wallet.assetImage,
            title: const Text(
              'Wallet',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: AppImages.instance.location.assetImage,
            title: const Text(
              'My Address',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: AppImages.instance.discountShape.assetImage,
            title: const Text(
              'Special Offer/ Promotion',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Language'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Order History'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Notifications'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Share Information'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Terms and Policies'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
