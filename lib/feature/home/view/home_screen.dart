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
                          fontSize: 25.0, fontWeight: FontWeight.bold)),
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
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.categoryItems.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    var item = controller.categoryItems[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset(item.image, fit: BoxFit.cover),
                        ),
                        Text(item.title, style: TextStyle(fontSize: 12)),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}
