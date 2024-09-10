import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/image/images.dart';
import 'package:getx_architecture_template/core/extension/image_ex.dart';
import 'package:getx_architecture_template/product/widget/drawer.dart';
import '/feature/home/controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('NYCBroadwayekleme yap'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: AppImages.instance.notification.assetImage),
          IconButton(onPressed: () {}, icon: AppImages.instance.bag.assetImage)
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextField(
                    enableSuggestions: true, // Klavyede önerileri etkinleştir
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: 'What are you yearning for?',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: AppImages.instance.search.assetImage,
                    ),
                    onChanged: (value) {},
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 16.0,
                    top: 20.0,
                  ),
                  child: Text('Special Offer',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold)),
                ),
                CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
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
                Container(
                  height: 200,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.categoryItems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      var item = controller.categoryItems[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.asset(item.image, fit: BoxFit.cover),
                          ),
                          Text(item.title,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                        ],
                      );
                    },
                  ),
                ),
                _shopTitle(text: 'Discount guaranteed!'),
                _shopCard(image: AppImages.instance.discount.assetImage),
                SizedBox(height: 40),
                Center(
                    child:
                        Image(image: AssetImage(AppImages.instance.discover))),
                SizedBox(height: 40),
                _shopTitle(text: 'What/s delicious around here?'),
                _shopCard(image: AppImages.instance.delicious.assetImage),
                SizedBox(height: 40),
                Container(
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
                            Text(
                              'flsfk ssllkfdlkflk dfkl',
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
                SizedBox(height: 40),
                _shopTitle(text: 'Highlights of March'),
                _shopCard(image: AppImages.instance.highlight.assetImage),
                SizedBox(height: 40),
                _shopTitle(text: 'Nearby Restaurants'),
                Container(
                  height: 250,
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
                            AppImages.instance.restaurant.assetImage,
                            Text(
                              'Elisandra Restaurant',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
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
                Text('Recommended For You',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
                Container(
                  // tüm sayfa mı kaysın sadece bura mı?
                  height: 400,
                  child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            AppImages.instance.recommended.assetImage,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hamburger',
                                  style: TextStyle(
                                    fontSize: 17,
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
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}

Widget _shopCard({Widget? image}) {
  return Container(
    height: 250,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              image ?? SizedBox(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pizza Hut',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '1.5 km | ⭐ 4.8 (1.2k)',
                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border_sharp,
                            color: const Color.fromARGB(255, 216, 115, 69),
                          ))
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    ),
  );
}

Widget _shopTitle({String? text}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        text ?? '',
        style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
      ),
      IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_forward_ios, color: Colors.grey))
    ],
  );
}
