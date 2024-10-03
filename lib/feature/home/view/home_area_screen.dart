import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/image/images.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/feature/home/controller/home_controller.dart';
import 'package:getx_architecture_template/product/widget/appbar.dart';

class HomeAreaScreen extends GetView<HomeController> {
  const HomeAreaScreen({super.key, required this.controller});
  @override
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Food of Country',
        onBackPressed: () => Get.back(),
      ),
      body: Obx(() => SingleChildScrollView(
            child: Padding(
              padding: context.paddingLow,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.area.value?.meals?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  var country =
                      controller.area.value?.meals?[index].strArea ?? '';
                  return Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.AREA,
                              parameters: {'country': country});
                        },
                        icon: Image.asset(AppImages.instance.discount),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.area.value?.meals?[index].strArea ?? '',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          )),
    );
  }
}
