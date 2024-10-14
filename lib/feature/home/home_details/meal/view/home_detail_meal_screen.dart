import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/image/images.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/core/extension/image_ex.dart';
import 'package:getx_architecture_template/feature/favorite/controller/favorite_controller.dart';
import 'package:getx_architecture_template/feature/home/home_details/meal/controller/meal_controller.dart';
import 'package:getx_architecture_template/product/widget/circle_progresbar.dart';

class HomeDetailMealScreen extends GetView<MealController> {
  // bu sayfanın theme color düzelt
  const HomeDetailMealScreen({required this.id, super.key});
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const CircleProgressBarLoading();
        } else {
          final meal = controller.mealsById.first;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    // Resim ve geri butonu olan kısım
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(meal.strMealThumb ?? ''),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: 30,
                      child: GestureDetector(
                        onTap: Get.back,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: context.colorScheme.primary,
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Theme.of(context).colorScheme.onSecondary,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                    //küçük resim

                    Positioned(
                      bottom: -40,
                      left: 25,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: context.colorScheme.primary,
                        backgroundImage: NetworkImage(meal.strMealThumb ?? ''),
                        //D
                      ),
                    ),
                  ],
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.tertiary,
                      padding: context.paddingLow,
                    ),
                    onPressed: () {
                      Get.toNamed(
                        Routes.OPTION,
                        parameters: {'id': meal.idMeal ?? ''},
                      );
                    },
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(
                          color: context.colorScheme.primary, fontSize: 14),
                    ),
                  ),
                ),
                // İsim ve adres bölümü
                Padding(
                  padding: context.paddingNormalHorizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              meal.strMeal ?? '',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Eğer alan yetmezse noktalar ekle
                              maxLines: 2, // Maks 2 satıra kadar taşsın
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.toggleFavorite(meal);
                            },
                            icon: Obx(() => Icon(
                                  controller.isFavorite(meal)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: controller.isFavorite(meal)
                                      ? Theme.of(context).colorScheme.onTertiary
                                      : Theme.of(context).colorScheme.secondary,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: context.lowValue),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  //Restaurant information??
                                },
                                child: const Text(
                                  'NYC, Broadway ave 79',
                                  style: TextStyle(),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  'Opening',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                Get.toNamed(Routes.INFO);
                              },
                              icon: Icon(
                                Icons.warning_amber_outlined,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            '⭐4.8 (1.2k)',
                            style: TextStyle(fontSize: 13),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.shopping_basket_outlined,
                                  size: 16,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary)),
                          Text(
                            '99+ orders',
                            style: TextStyle(
                                fontSize: 13,
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.REVIEWS);
                            },
                            child: const Text(
                              'Reviews',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: context.paddingNormalHorizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Ingredients',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: context.colorScheme.secondary,
                          size: 19,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: context.lowValue),
                Padding(
                  padding: context.paddingNormalHorizontal,
                  child: SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: context.lowValue,
                            ),
                            padding: context.paddingLow,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.tertiary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              //D
                              child: Text(
                                'aaaa',
                                style: TextStyle(
                                  color: context.colorScheme.secondary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                //for you kısmı
                Padding(
                  padding: context.paddingNormalHorizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'For You',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: context.colorScheme.secondary,
                          size: 19,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: context.paddingNormalHorizontal,
                  child: SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: context.lowValue,
                          ),
                          child: Column(
                            children: [
                              AppImages.instance.delicious.assetImage, //D
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Pizza Hut',
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
                                          fontSize: 13,
                                          color: context.colorScheme.secondary,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_border_sharp,
                                          color: context.colorScheme.onTertiary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // tavsiye
                const Padding(
                  padding: EdgeInsets.only(
                    left: 25,
                  ),
                  child: Text(
                    'Recommended For You',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: context.lowValue,
                      ),
                      child: Column(
                        children: [
                          AppImages.instance.recommended.assetImage, //D
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Hamburger',
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
                                      fontSize: 13,
                                      color: context.colorScheme.secondary,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_border_sharp,
                                      color: context.colorScheme.onTertiary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
