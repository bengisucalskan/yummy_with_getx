import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/feature/favorite/controller/favorite_controller.dart';
import 'package:getx_architecture_template/feature/home/home_details/category/controller/category_controller.dart';
import 'package:getx_architecture_template/product/widget/appbar.dart';
import 'package:getx_architecture_template/product/widget/circle_progresbar.dart';

class HomeDetailCategoryScreen extends GetView<CategoryController> {
  const HomeDetailCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '${controller.category.value} Food',
        onBackPressed: () => Get.back(),
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(
              child: CircleProgressBarLoading(),
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: context.paddingLow,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.mealsByCategory.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.70,
                  ),
                  itemBuilder: (context, index) {
                    final meal = controller.mealsByCategory[index];
                    return Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (meal.idMeal != null &&
                                meal.idMeal!.isNotEmpty) {
                              Get.toNamed(Routes.MEAL,
                                  parameters: {'id': meal.idMeal ?? ''});
                            } else {
                              print("Meal ID boş, yönlendirme yapılamadı.");
                            }
                          },
                          icon: Image.network(meal.strMealThumb ?? ''),
                        ),
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
                                Text(
                                  '1.5 km | ⭐ 4.8 (1.2k)',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                ),
                                IconButton(
                                  onPressed: () {
                                    controller.toggleFavorite(meal);
                                  },
                                  icon: Obx(
                                    () => Icon(
                                      controller.isFavorite(meal)
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: controller.isFavorite(meal)
                                          ? Theme.of(context)
                                              .colorScheme
                                              .onTertiary
                                          : Theme.of(context)
                                              .colorScheme
                                              .secondary,
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
            );
          }
        },
      ),
    );
  }
}
