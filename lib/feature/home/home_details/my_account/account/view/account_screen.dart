import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/feature/home/home_details/my_account/account/controller/account_controller.dart';
import 'package:getx_architecture_template/product/widget/appbar.dart';

class AccountScreen extends GetView<AccountController> {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Account',
        onBackPressed: Get.back,
      ),
      body: Padding(
        padding: context.paddingNormalHorizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text('Personal Information'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed(Routes.PERSONAL_INFO);
              },
            ),
            Divider(color: context.colorScheme.secondary),
            ListTile(
              title: const Text('Personal Editing'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed(Routes.PERSONAL_EDIT);
              },
            ),
            Divider(color: context.colorScheme.secondary),
            ListTile(
              title: const Text('Change Password'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            Divider(color: context.colorScheme.secondary),
            ListTile(
              title: const Text('Help'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            Divider(color: context.colorScheme.secondary),
            const Spacer(),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      padding: context.paddingLowVertical,
                      backgroundColor: context.colorScheme.onTertiary),
                  onPressed: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                  child: Text(
                    'Log out',
                    style: TextStyle(color: context.colorScheme.primary),
                  ),
                ),
              ),
            ),
            context.sizedBoxHigh
          ],
        ),
      ),
    );
  }
}
