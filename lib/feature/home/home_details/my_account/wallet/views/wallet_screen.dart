import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/feature/home/home_details/my_account/wallet/controller/wallet_controller.dart';
import 'package:getx_architecture_template/product/widget/appbar.dart';

class WalletScreen extends GetView<WalletController> {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My wallet',
        onBackPressed: Get.back,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            context.sizedBoxHigh,
            Icon(
              Icons.account_balance_wallet,
              size: 100,
              color: context.colorScheme.onTertiary,
            ),
            context.sizedBoxMedium,
            const Text(
              'For your own safety',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            context.sizedBoxMedium,
            Text(
              'For your information safety when setting up\n'
              'Yummy wallet of Yummyfood app, please read and\n'
              'agree to Terms and Policies.',
              textAlign: TextAlign.center,
              style: TextStyle(color: context.colorScheme.secondary),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.check_box_outline_blank),
                context.sizedBoxlow,
                const Text('I agree with '),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Terms and Policies',
                    style: TextStyle(
                      color: context.colorScheme.onTertiary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: context.paddingNormalHorizontal,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    padding: context.paddingLowVertical,
                    backgroundColor: context.colorScheme.onPrimary,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Setup Yummy wallet',
                    style: TextStyle(color: context.colorScheme.onSecondary),
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
