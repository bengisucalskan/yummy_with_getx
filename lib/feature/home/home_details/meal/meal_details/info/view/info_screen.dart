import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/feature/home/home_details/meal/meal_details/info/controller/info_controller.dart';
import 'package:getx_architecture_template/product/widget/appbar.dart';

class InfoScreen extends GetView<InfoController> {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Restaurant Information',
          onBackPressed: () => Get.back(),
        ),
        body: Padding(
          padding: context.paddingNormal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 130,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: context.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(15)),
                child: const Icon(Icons.home, size: 50),
              ),
              context.sizedBoxlow,
              Row(
                children: [
                  const Icon(Icons.location_on),
                  SizedBox(width: context.lowValue),
                  Text(
                    'NYC, Broadway ave 79',
                    style: TextStyle(
                        fontSize: 16, color: context.colorScheme.secondary),
                  ),
                ],
              ),
              const Divider(),
              const Text(
                'About us',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              context.sizedBoxlow,
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
                style: TextStyle(
                    fontSize: 14, color: context.colorScheme.secondary),
              ),
              context.sizedBoxlow,
              GestureDetector(
                onTap: () {},
                child: Text(
                  'See more...',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onTertiary),
                ),
              ),
              const Divider(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Monday-Friday', style: TextStyle(fontSize: 16)),
                  Text('10:00 - 22.00',
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onTertiary)),
                ],
              ),
              context.sizedBoxlow,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Saturday-Sunday', style: TextStyle(fontSize: 16)),
                  Text('12:00 - 20.00',
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onTertiary)),
                ],
              ),
              const Divider(height: 32),
              Row(
                children: [
                  const Text('Phone number', style: TextStyle(fontSize: 16)),
                  const Spacer(),
                  Text('056056591',
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onTertiary)),
                ],
              ),
            ],
          ),
        ));
  }
}
