import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';
import 'package:getx_architecture_template/feature/home/controller/home_controller.dart';
import 'package:getx_architecture_template/product/widget/appbar.dart';

class CategoryScreen extends GetView<HomeController> {
  const CategoryScreen({super.key, required this.controller});
  @override
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            CustomAppBar(title: 'Category', onBackPressed: () => Get.back()),
        body: Obx(
          () => SingleChildScrollView(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.categoryItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                var category =
                    controller.category.value?.meals?[index].strCategory ?? '';
                var item = controller.categoryItems[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Image.asset(item.image, fit: BoxFit.cover),
                      onPressed: () {
                        Get.toNamed(Routes.CATEGORY,
                            parameters: {'category': category});
                      },
                    ),
                    Text(category,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                  ],
                );
              },
            ),
          ),
        ));
  }
}
