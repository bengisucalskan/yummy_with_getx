import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home_details/area/controller/area_controller.dart';

class HomeDetailAreaScreen extends GetView<AreaController> {
  const HomeDetailAreaScreen(
      {super.key,  required this.country});
  final String country;

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
          title: Text(
            '$country Food',
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
        body: Obx(() => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.mealsByArea.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    
                  ),
                  itemBuilder: (context, index) {
                    var meal = controller.mealsByArea[index];
                    return Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Image.network(meal.strMealThumb ?? '')),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              meal.strMeal ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text(
            '1.5 km | ⭐ 4.8 (1.2k)',
            style: TextStyle(fontSize: 13.0, color: Colors.grey),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border_sharp,
                color:  Color.fromARGB(255, 216, 115, 69),
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
            )));
  }
}
