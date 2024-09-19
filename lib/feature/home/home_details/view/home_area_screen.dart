import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/image/images.dart';
import 'package:getx_architecture_template/feature/home/controller/home_controller.dart';
import 'package:getx_architecture_template/feature/home/home_details/view/home_detail_area_screen.dart';

class HomeAreaScreen extends GetView<HomeController> {
  const HomeAreaScreen({super.key, required this.controller});
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
                child: Container(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.area.value?.meals?.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      var country =
                          controller.area.value?.meals?[index].strArea ?? '';
                      return Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                controller.loadMealsForCountry(country);
                                Get.to(() => HomeDetailAreaScreen(
                                    controller: controller, country: country));
                              },
                              icon: Image.asset(AppImages.instance.discount)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.area.value?.meals?[index].strArea ??
                                    '',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    '1.5 km | ⭐ 4.8 (1.2k)',
                                    style: TextStyle(
                                        fontSize: 14.0, color: Colors.grey),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite_border_sharp,
                                        color: const Color.fromARGB(
                                            255, 216, 115, 69),
                                      ))
                                ],
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            )));
  }
}
