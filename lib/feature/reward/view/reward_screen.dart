import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/image/images.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/core/extension/image_ex.dart';
import 'package:getx_architecture_template/feature/home/home_details/meal/controller/meal_controller.dart';
import 'package:getx_architecture_template/product/widget/appbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RewardScreen extends GetView<MealController> {
  const RewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Padding(
        padding: context.paddingNormal,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: context.paddingNormal,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Your points',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    context.sizedBoxlow,
                    Stack(
                      children: [
                        Container(
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        Positioned(
                          left: 40,
                          child: Container(
                            height: 10,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.tertiary,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ],
                    ),
                    context.sizedBoxlow,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '20',
                              style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).colorScheme.onTertiary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: context.lowValue),
                            Text(
                              'yummy',
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.onTertiary,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.card_giftcard),
                          label: const Text('Exchange'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.tertiary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              context.sizedBoxlow,
              // QR
              Container(
                padding: context.paddingNormal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Scan QR code to earn\nmore points',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.qr_code_scanner,
                      color: Theme.of(context).colorScheme.onTertiary,
                      size: 48,
                    )
                  ],
                ),
              ),
              context.sizedBoxlow,

              const Text(
                'Exchange Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              context.sizedBoxlow,

              // Tab Bar için yapı
              ButtonsTabBar(
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                unselectedBackgroundColor: const Color(0xFFE8E8E8),
                unselectedLabelStyle:
                    TextStyle(color: Theme.of(context).colorScheme.tertiary),
                radius: 20,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                labelStyle: TextStyle(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(
                    text: 'For You',
                  ),
                  Tab(
                    text: 'Highlights of April',
                  ),
                  Tab(
                    text: 'Different cultures',
                  ),
                  Tab(
                    text: 'Promotion',
                  ),
                ],
              ),
              context.sizedBoxlow,

              // Tab Bar View
              SizedBox(
                height: 300.h,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _shopCard(context),
                    _shopCard(context),
                    _shopCard(context),
                    _shopCard(context),
                  ],
                ),
              ),
              context.sizedBoxlow,
            ],
          ),
        ),
      ),
    );
  }
}

Widget _shopCard(BuildContext context) {
  return Padding(
    padding: context.paddingNormal,
    child: ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: context.lowValue,
            vertical: context.lowValue,
          ),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
          ),
          child: Column(
            children: [
              AppImages.instance.recommended.assetImage,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hamburger',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '1.5 km | ⭐ 4.8 (1.2k)',
                        style: TextStyle(
                            fontSize: 13,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border_sharp,
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    ),
  );
}
