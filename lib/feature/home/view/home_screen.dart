import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/image/images.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/core/extension/image_ex.dart';
import 'package:getx_architecture_template/feature/home/controller/home_controller.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';
import 'package:getx_architecture_template/feature/home/view/home_area_screen.dart';
import 'package:getx_architecture_template/feature/home/view/home_category_screen.dart';
import 'package:getx_architecture_template/product/widget/circle_progresbar.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchField(),
              const Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  top: 10,
                ),
                child: Text(
                  'Special Offer',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              context.sizedBoxlow,
              _buildCarouselSlider(),
              context.sizedBoxlow,
              _shopTitle(
                text: 'Category',
                onPressed: () {
                  Get.to(CategoryScreen(controller: controller));
                },
              ),
              context.sizedBoxlow,

              SizedBox(height: 200, child: _buildCategoryGrid(context)),

              _shopTitle(
                  text: 'Different cultures!',
                  onPressed: () {
                    Get.to(HomeAreaScreen(controller: controller));
                  }),
              //---------------------------------------------

              _shopCard(
                meals: controller.area.value?.meals ?? [],
                onPressed: (index) {
                  Get.toNamed(
                    Routes.AREA,
                    parameters: {
                      'country':
                          controller.area.value?.meals?[index].strArea ?? ''
                    },
                  );
                },
              ),

              //---------------------------
              context.sizedBoxlow,
              _buildRandomMealSection(),
              context.sizedBoxlow, //----------------------
              _shopTitle(
                  text: "What's delicious around here?",
                  onPressed:
                      () {}), // ??? dile göre o ülkenin yemekleri olsun ???

              _shopCard(
                meals: controller.area.value?.meals ?? [],
                onPressed: (index) {},
              ),

              //----------------
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 20,
                ),
                child: SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppImages.instance.homeShop.assetImage,
                            const Text(
                              'flsfk ssllkfdlkflk dfkl', // belli bir categorideki yemekleri koy balık yemekleri misal
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              //----------------------
              _shopTitle(
                text: 'Highlights of March',
                onPressed: () {},
              ), // martın yıldızları da tüm yemekler olabilir mesela

              _shopCard(
                meals: controller.area.value?.meals ?? [],
                onPressed: (index) {},
              ),

              //------------
              _shopTitle(text: 'Nearby Restaurants', onPressed: () {}),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppImages.instance.restaurant.assetImage,
                            const Text(
                              'Elisandra Restaurant',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Elisandra Restaurant',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
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
              //------------------------
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

              Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      child: Column(
                        children: [
                          AppImages.instance.recommended.assetImage,
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
                                  const Text(
                                    '1.5 km | ⭐ 4.8 (1.2k)',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite_border_sharp,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onTertiary,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              //------------------------
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.SEARCH);
        },
        child: AbsorbPointer(
          child: TextField(
            readOnly: true,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: 'What are you yearning for?',
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              prefixIcon: AppImages.instance.search.assetImage,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: <Widget>[
              Image.network(
                'https://picsum.photos/id/${itemIndex + 210}/400/300',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ],
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
      ),
    );
  }

  Widget _buildCategoryGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: (controller.category.value?.meals?.length ?? 0) > 8
          ? 8
          : controller.category.value?.meals?.length ?? 0,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemBuilder: (context, index) {
        final item = controller.categoryItems[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Image.asset(item.image, fit: BoxFit.cover),
              onPressed: () {
                Get.toNamed(Routes.CATEGORY, parameters: {
                  'category':
                      controller.category.value?.meals?[index].strCategory ?? ''
                });
              },
            ),
            Text(
              controller.category.value?.meals?[index].strCategory ?? '',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        );
      },
    );
  }

  Widget _buildRandomMealSection() {
    return Center(
      child: controller.random.value?.meals?.isNotEmpty ??
              false // burası isempty değil data gelirse kontrolü
          ? Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${controller.random.value?.meals?[0].strCategory ?? ''} of the day',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  InkWell(
                    onTap: () {
                      Get.toNamed(
                        Routes.MEAL,
                        parameters: {
                          'id': controller.random.value?.meals?[0].idMeal ?? '',
                        },
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        controller.random.value?.meals?[0].strMealThumb ?? '',
                        height: 140,
                        width: 340,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    controller.random.value?.meals?[0].strMeal ?? '',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : const CircleProgressBarLoading(),
    );
  }
}

Widget _shopCard({
  required List<Meals> meals,
  void Function(int index)? onPressed,
}) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 10,
    ),
    child: SizedBox(
      height: 250,
      child: meals.isNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      IconButton(
                        icon: Image.asset(AppImages.instance.discount),
                        onPressed: () => onPressed?.call(index),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            meals[index].strArea ?? '',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                '1.5 km | ⭐ 4.8 (1.2k)',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border_sharp,
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )
          : const Center(
              child: Text(
                'No meals available',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
    ),
  );
}

Widget _shopTitle({required void Function()? onPressed, String? text}) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 16,
      top: 20,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          text ?? '',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 19,
          ),
        ),
      ],
    ),
  );
}
