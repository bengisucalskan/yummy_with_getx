import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/feature/favorite/controller/favorite_controller.dart';

class DishesScreen extends StatelessWidget {
  const DishesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteController controller = Get.put(FavoriteController());

    return Scaffold(
      body: Obx(() {
        if (controller.favoriteMeals.isEmpty) {
          return const Center(child: Text('No favorites added.'));
        }
        return Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: controller.favoriteMeals.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final meal = controller.favoriteMeals[index];
              return GestureDetector(
                onTap: () {
                  if (meal.idMeal != null && meal.idMeal!.isNotEmpty) {
                    Get.toNamed(Routes.MEAL,
                        parameters: {'id': meal.idMeal ?? ''});
                  } else {
                    print("Meal ID boş, yönlendirme yapılamadı.");
                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 140,
                        child: Image.network(meal.strMealThumb ?? ''),
                      ),
                      context.sizedBoxlow,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              meal.strMeal ?? '',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            context.sizedBoxlow,
                            Text(
                              'NYC, Broadway ave 79',
                              style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            ),
                            context.sizedBoxlow,
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: context.colorScheme.onTertiary,
                                    size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  '4.8 (1.2k) | 1,5 km',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      context.sizedBoxlow,
                      Column(
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: Theme.of(context).colorScheme.onTertiary,
                              ),
                              onPressed: () {
                                controller.removeFromFavorites(meal);
                              }),
                          context.sizedBoxMedium,
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 16,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
