import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_architecture_template/feature/home/controller/home_controller.dart';
import 'package:getx_architecture_template/feature/home/home_details/view/home_detail_category_screen.dart';

class CategoryScreen extends GetView<HomeController> {
  const CategoryScreen({super.key, required this.controller});
  final HomeController controller;

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
            'Category',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Container(
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.categoryItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  var categories =
                      controller.category.value?.meals?[index].strCategory ??
                          '';
                  var item = controller.categoryItems[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: IconButton(
                        icon: Image.asset(item.image, fit: BoxFit.cover),
                        onPressed: () {
                          controller.loadMealsForCategory(categories);
                          Get.to(() => HomeDetailCategoryScreen(
                              controller: controller, category: categories));
                        },
                      )),
                      Text(categories,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  );
                },
              ),
            ),
          ),
        ));
  }
}
