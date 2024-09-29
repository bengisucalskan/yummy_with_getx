import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';
import 'package:getx_architecture_template/feature/favorite/controller/favorite_controller.dart';
import 'package:getx_architecture_template/feature/home_details/category/controller/category_controller.dart';

class HomeDetailCategoryScreen extends GetView<CategoryController> {
  const HomeDetailCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String category = Get.parameters['category'] ?? 'Unknown';
    final FavoriteController favoriteController =
        Get.find<FavoriteController>();

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
            '$category Food',
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
        body: Obx(() => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.mealsByCategory.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.70,
                  ),
                  itemBuilder: (context, index) {
                    var meal = controller.mealsByCategory[index];
                    return Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              String id = meal.idMeal ?? '';
                              if (meal.idMeal != null &&
                                  meal.idMeal!.isNotEmpty) {
                                Get.toNamed(Routes.MEAL,
                                    parameters: {'id': meal.idMeal ?? ''});
                              } else {
                                print("Meal ID boş, yönlendirme yapılamadı.");
                              }
                            },
                            icon: Image.network(meal.strMealThumb ?? '')),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              meal.strMeal ?? '',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Text(
                                  '1.5 km | ⭐ 4.8 (1.2k)',
                                  style: TextStyle(
                                      fontSize: 13.0, color: Colors.grey),
                                ),
                                IconButton(
                                    onPressed: () {
                                      favoriteController.addToFavorites(meal);
                                      Get.snackbar(
                                        "Favorite",
                                        "Added to favorites!",
                                        snackPosition: SnackPosition.BOTTOM,
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.favorite_border_sharp,
                                      color: Color.fromARGB(255, 216, 115, 69),
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
