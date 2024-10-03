import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/favorite/controller/favorite_controller.dart';

class DishesScreen extends GetView<FavoriteController> {
  // bu sayfayı sonra ayarla extensionlara daha küçük bi tanr daha yapı ekle
  const DishesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              var meal = controller.favoriteMeals[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.grey.shade300)),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 140,
                      child: Image.network(meal.strMealThumb ?? ''),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            meal.strMeal ?? '',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'NYC, Broadway ave 79',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(height: 4),
                          const Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              SizedBox(width: 4),
                              Text(
                                '4.8 (1.2k) | 1,5 km',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      children: [
                        IconButton(
                            icon: const Icon(Icons.favorite,
                                color: Color.fromARGB(255, 216, 115, 69)),
                            onPressed: () {
                              controller.removeFromFavorites(meal);
                            }),
                        const SizedBox(height: 16),
                        const Icon(Icons.arrow_forward_ios,
                            color: Colors.grey, size: 16),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
