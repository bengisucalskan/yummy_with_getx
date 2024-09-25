import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/image/images.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';
import 'package:getx_architecture_template/feature/home/controller/home_controller.dart';

class HomeAreaScreen extends GetView<HomeController> {
  const HomeAreaScreen({super.key, required this.controller});
  @override
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
            'Food of Countries',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
        body: Obx(() => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                            icon: Image.asset(AppImages.instance.discount)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.area.value?.meals?[index].strArea ??
                                  '',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            
                          ],
                        )
                      ],
                    );
                  },
                ),
              ),
            )));
  }
}
