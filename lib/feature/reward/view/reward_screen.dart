import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home_details/meal/controller/meal_controller.dart';

class RewardScreen extends GetView<MealController> {
  const RewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Exchange Rewards'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Your points',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Stack(
                        children: [
                          Container(
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          Positioned(
                            left: 40,
                            child: Container(
                              height: 10,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Color(0xff332C45),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Text(
                                '20',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Color(0xffF87146),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'yummy',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xffF87146)),
                              ),
                            ],
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.card_giftcard),
                            label: const Text('Exchange'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff332C45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // QR Code Section
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Scan QR code to earn\nmore points',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      //Verticaldivider koydum ekrana gelmedi
                      Icon(
                        Icons.qr_code_scanner,
                        color: Color(0xffF87146),
                        size: 48,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // TabBar Section
                const Text(
                  'Exchange Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                // Tab Bar için yapı
                ButtonsTabBar(
                  backgroundColor: Color(0xFF332C45),
                  unselectedBackgroundColor: Color(0xFFE8E8E8),
                  unselectedLabelStyle: TextStyle(color: Color(0xFF332C45)),
                  radius: 20,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  // rengi niye değişmiyo
                  labelStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  tabs: const [
                    Tab(
                      text: "For You",
                    ),
                    Tab(
                      text: "Highlights of April",
                    ),
                    Tab(
                      text: "Different cultures",
                    ),
                    Tab(
                      text: "Promotion",
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Tab Bar View
                const SizedBox(
                  height: 300,
                  child: TabBarView(
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'For You Content',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Highlights of April Content',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'For You Content',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'For You Content',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
