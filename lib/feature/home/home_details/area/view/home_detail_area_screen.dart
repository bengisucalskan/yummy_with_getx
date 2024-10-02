import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';
import 'package:getx_architecture_template/feature/favorite/controller/favorite_controller.dart';
import 'package:getx_architecture_template/feature/home/home_details/area/controller/area_controller.dart';

class HomeDetailAreaScreen extends GetView<AreaController> {
  const HomeDetailAreaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteController = // bunu kaldırıcaz
        Get.find<FavoriteController>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: Get.back, icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          '${controller.country.value} Food',
          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.mealsByArea.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                final meal = controller.mealsByArea[index];
                return Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          if (meal.idMeal != null && meal.idMeal!.isNotEmpty) {
                            Get.toNamed(Routes.MEAL,
                                parameters: {'id': meal.idMeal ?? ''});
                          }
                        },
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
                              style:
                                  TextStyle(fontSize: 13.0, color: Colors.grey),
                            ),
                            IconButton(
                              onPressed: () {
                                if (favoriteController.isFavorite(meal)) {
                                  favoriteController.removeFromFavorites(meal);
                                  Get.snackbar(
                                    'Favorite',
                                    'Removed from favorites!',
                                  );
                                } else {
                                  favoriteController.addToFavorites(meal);
                                  Get.snackbar(
                                    'Favorite',
                                    'Added to favorites!',
                                  );
                                }
                              },
                              icon: Obx(
                                () => Icon(
                                  favoriteController.isFavorite(meal)
                                      ? Icons.favorite // Favori ise dolu kalp
                                      : Icons
                                          .favorite_border, // Favori değilse boş kalp
                                  color: favoriteController.isFavorite(meal)
                                      ? Colors.red // Favori ise kırmızı renk
                                      : Colors.grey, // Favori değilse gri renk
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
