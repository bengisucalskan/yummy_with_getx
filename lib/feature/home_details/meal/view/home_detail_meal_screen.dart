import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/image/images.dart';
import 'package:getx_architecture_template/core/extension/image_ex.dart';
import 'package:getx_architecture_template/feature/home_details/meal/controller/meal_controller.dart';

class HomeDetailMealScreen extends GetView<MealController> {
  const HomeDetailMealScreen({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                // Resim ve geri butonu olan kısım
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.instance.delicious), //D
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 120,
                  left: 30,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -40,
                  left: 25,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    backgroundImage:
                        AssetImage(AppImages.instance.delicious), //D
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            // İsim ve adres bölümü
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        //D
                        'vvvvvv',
                        style: TextStyle(
                          color: Color(0xff332C45),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "NYC, Broadway ave 79",
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "Opening",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.warning_amber_outlined,
                            color: Colors.black54,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "⭐4.8 (1.2k)",
                        style: TextStyle(fontSize: 13),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_basket_outlined,
                              size: 16, color: Colors.black45)),
                      const Text(
                        "99+ orders",
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          //Reviews sayfası
                        },
                        child: const Text(
                          "Reviews",
                          style: TextStyle(
                            color: Color(0xff332C45),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              decoration: BoxDecoration(
                                color: Color(0xff332C45),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                //D
                                child: Text(
                                  controller.mealsById[index].strCategory ?? '',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25.0,
                top: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'For You',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff332C45)),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios,
                          color: Colors.grey, size: 19))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
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
                          AppImages.instance.delicious.assetImage, //D
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                //D
                                'Pizza Hut',
                                style: const TextStyle(
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
                                        fontSize: 13.0, color: Colors.grey),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.favorite_border_sharp,
                                        color:
                                            Color.fromARGB(255, 216, 115, 69),
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
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 25.0,
              ),
              child: Text('Recommended For You',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      AppImages.instance.recommended.assetImage, //D
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            //D
                            'Hamburger',
                            style: TextStyle(
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
                                    fontSize: 13.0, color: Colors.grey),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite_border_sharp,
                                    color: Color.fromARGB(255, 216, 115, 69),
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
          ],
        ),
      ),
    ));
  }
}
