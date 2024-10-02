import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/image/images.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';
import 'package:getx_architecture_template/core/extension/image_ex.dart';
import 'package:getx_architecture_template/feature/home/controller/home_controller.dart';
import 'package:getx_architecture_template/feature/home/view/home_area_screen.dart';
import 'package:getx_architecture_template/feature/home/view/home_category_screen.dart';
import 'package:getx_architecture_template/product/widget/circle_progresbar.dart';
import 'package:getx_architecture_template/product/widget/drawer.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('NYCBroadwayekleme yap'), // bura nasıl olacak
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.NOTIFICATION);
            },
            icon: AppImages.instance.notification.assetImage,
          ),
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.CART);
            },
            icon: AppImages.instance.bag.assetImage,
          ),
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
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
                ),
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
                const SizedBox(height: 10),
                CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
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
                    enlargeCenterPage: true, // Merkezi öğeyi büyüt
                    viewportFraction:
                        0.9, // Görünür alanın ne kadarını kaplasın
                  ),
                ),
                const SizedBox(height: 10),
                _shopTitle(
                  // categorilere göre yönlendirme
                  text: 'Category',
                  onPressed: () {
                    Get.to(CategoryScreen(controller: controller));
                  },
                ),
                const SizedBox(height: 10),

                Obx(
                  () => SizedBox(
                    height: 200,
                    child: GridView.builder(
                      // buradaki categoriler ile görseller aynı değil onu düzelt
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          (controller.category.value?.meals?.length ?? 0) > 8
                              ? 8
                              : controller.category.value?.meals?.length ?? 0,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1,
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
                                  'category': controller.category.value
                                          ?.meals?[index].strCategory ??
                                      ''
                                });
                              },
                            ),
                            Text(
                                controller.category.value?.meals?[index]
                                        .strCategory ??
                                    '',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ],
                        );
                      },
                    ),
                  ),
                ),

                _shopTitle(
                    text: 'Different cultures!',
                    onPressed: () {
                      Get.to(HomeAreaScreen(controller: controller));
                    }), // buraya kültürlerin yemekleri listelenecek
                // tüm yemeklere erişemiyorum . tariflerini falan nasıl göstercm?
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Obx(
                            () => Column(
                              children: [
                                IconButton(
                                  icon:
                                      Image.asset(AppImages.instance.discount),
                                  onPressed: () {
                                    // ülkelerin yemeklerini çekerken controllerları ayırmak için home screende detay ekranı çekmemem lazım?
                                    Get.toNamed(
                                      Routes.AREA,
                                      parameters: {
                                        'country': controller.area.value
                                                ?.meals?[index].strArea ??
                                            ''
                                      },
                                    );
                                  },
                                ),
                                _shopCard(
                                  text: controller
                                          .area.value?.meals?[index].strArea ??
                                      '',
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: controller.random.value?.meals?.isNotEmpty ?? false
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${controller.random.value?.meals?[0].strCategory ?? ''} of the day',
                              style: const TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.MEAL, parameters: {
                                  'id': controller
                                          .random.value?.meals?[0].idMeal ??
                                      ''
                                });
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  controller.random.value?.meals?[0]
                                          .strMealThumb ??
                                      '',
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
                            )
                          ],
                        )
                      : const CircleProgressBarLoading(),
                ),

                const SizedBox(height: 10),
                _shopTitle(
                    text: "What's delicious around here?",
                    onPressed:
                        () {}), // ??? dile göre o ülkenin yemekleri olsun ???
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
                            children: [
                              AppImages.instance.delicious.assetImage,
                              _shopCard(text: 'yöresel yemekler'),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
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
                          margin: EdgeInsets.symmetric(horizontal: 8),
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
                _shopTitle(
                  text: 'Highlights of March',
                  onPressed: () {},
                ), // martın yıldızları da tüm yemekler olabilir mesela
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
                            children: [
                              AppImages.instance.highlight.assetImage,
                              _shopCard(text: 'Mart ayı'),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
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
                                  Icon(Icons.location_on_outlined,
                                      size: 20, color: Colors.grey),
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
                              bottom: BorderSide(color: Colors.grey.shade300)),
                        ),
                        child: Column(
                          children: [
                            AppImages.instance.recommended.assetImage,
                            _shopCard(text: 'Hamburger'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}

Widget _shopCard({String? text}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text ?? '',
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
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border_sharp,
                color: Color.fromARGB(255, 216, 115, 69),
              )),
        ],
      ),
    ],
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
        )
      ],
    ),
  );
}
