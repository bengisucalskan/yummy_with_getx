import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/image/images.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/core/extension/image_ex.dart';
import 'package:getx_architecture_template/feature/order/order_detail/cancel_order/controller/cancel_order_controller.dart';
import 'package:getx_architecture_template/product/widget/appbar.dart';

class CancelOrderScreen extends GetView<CancelOrderController> {
  const CancelOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cancel order', onBackPressed: Get.back),
      body: Padding(
        padding: context.paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  const Text(
                    'Please select reasons',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  _buildCheckboxTile(context, 'Late delivery', true),
                  Divider(
                    color: context.colorScheme.secondary,
                  ),
                  _buildCheckboxTile(
                      context, 'Can not contact to the driver', false),
                  Divider(
                    color: context.colorScheme.secondary,
                  ),
                  _buildCheckboxTile(
                      context, 'Driver denied to come to pickup', false),
                  Divider(
                    color: context.colorScheme.secondary,
                  ),
                  _buildCheckboxTile(context, 'Displayed wrong address', false),
                  Divider(
                    color: context.colorScheme.secondary,
                  ),
                  _buildCheckboxTile(context, 'Unfavorable price', false),
                  Divider(
                    color: context.colorScheme.secondary,
                  ),
                  _buildCheckboxTile(
                      context, 'I want to order another restaurant', false),
                  Divider(
                    color: context.colorScheme.secondary,
                  ),
                  _buildCheckboxTile(
                      context, 'I just want to cancel the order', false),
                  context.sizedBoxMedium,
                  const Text(
                    'Other',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  context.sizedBoxlow,
                  _buildMessageInput(context),
                ],
              ),
            ),
            context.sizedBoxMedium,
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _showCancellationDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.colorScheme.onTertiary,
                    padding: context.paddingLowVertical,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Send',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.primary),
                  ),
                ),
              ),
            ),
            context.sizedBoxMedium
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxTile(
      BuildContext context, String title, bool isChecked) {
    return CheckboxListTile(
      value: isChecked,
      onChanged: (bool? value) {},
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: context.colorScheme.onSurface,
        ),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: context.colorScheme.onSecondary,
      checkColor: context.colorScheme.primary,
    );
  }

  Widget _buildMessageInput(BuildContext context) {
    return TextField(
      maxLines: 3,
      decoration: InputDecoration(
        hintText: 'Do you have any message to the restaurant',
        hintStyle: TextStyle(color: context.colorScheme.secondary),
        filled: true,
        fillColor: context.colorScheme.onPrimary,
        contentPadding: const EdgeInsets.all(12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  void _showCancellationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: context.paddingNormal,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppImages.instance.cry.assetImage,
                context.sizedBoxMedium,
                const Text(
                  'We are sorry that your order had been canceled',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                context.sizedBoxMedium,
                Text(
                  'We will continue improving our service and pleasing you in the next order.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14, color: context.colorScheme.secondary),
                ),
                context.sizedBoxHigh,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.BASE);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colorScheme.onTertiary,
                      padding: context.paddingLowVertical,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Back to homepage',
                      style: TextStyle(
                          fontSize: 16, color: context.colorScheme.primary),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
