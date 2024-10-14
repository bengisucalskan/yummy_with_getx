import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/image/images.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/core/extension/image_ex.dart';

class FollowScreen extends StatelessWidget {
  const FollowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 600,
                  width: double.infinity,
                  child: AppImages.instance.map.assetImage,
                ),
                Positioned(
                  top: 120,
                  left: 30,
                  child: GestureDetector(
                    onTap: Get.back,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: context.colorScheme.primary,
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Theme.of(context).colorScheme.onSecondary,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            context.sizedBoxMedium,
            Padding(
              padding: context.paddingNormalHorizontal,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(AppImages.instance.cirlce),
                  ),
                  context.sizedBoxlow,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Michael Scoffield',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Will deliver your order',
                        style: TextStyle(
                          fontSize: 14,
                          color: context.colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.MESSAGE);
                    },
                    icon: const Icon(Icons.message),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.CALL);
                    },
                    icon: const Icon(Icons.phone),
                  ),
                ],
              ),
            ),
            context.sizedBoxlow,
            Padding(
              padding: context.paddingNormalHorizontal,
              child: Text(
                'Estimated delivery time',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: context.paddingNormalHorizontal,
              child: Text(
                '6:00 PM - 6:10 PM',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            context.sizedBoxlow,
            Padding(
              padding: context.paddingNormalHorizontal,
              child: Row(
                children: [
                  Icon(
                    Icons.receipt_long,
                    color: context.colorScheme.onTertiary,
                  ),
                  const Spacer(),
                  Icon(
                    Icons.kitchen,
                    color: context.colorScheme.secondary,
                  ),
                  const Spacer(),
                  Icon(
                    Icons.delivery_dining,
                    color: context.colorScheme.secondary,
                  ),
                  const Spacer(),
                  Icon(
                    Icons.check_circle_outline,
                    color: context.colorScheme.secondary,
                  ),
                ],
              ),
            ),
            context.sizedBoxlow,
            Padding(
              padding: context.paddingNormalHorizontal,
              child: Text(
                'Your order is being notified to the restaurant',
                style: TextStyle(color: context.colorScheme.secondary),
              ),
            ),
            context.sizedBoxHigh
          ],
        ),
      ),
    );
  }
}
