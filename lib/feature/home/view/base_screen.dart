import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/controller/home_controller.dart';

import '/feature/home/view/home_screen.dart';
import '/feature/login/view/login_screen.dart';

class BaseScreen extends GetView<HomeController> {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (controller.tabIndex.value) {
          case 0:
            return HomeScreen();
          case 1:
            return LoginScreen();

          default:
            return HomeScreen();
        }
      }),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.tabIndex.value,
            type: BottomNavigationBarType.fixed,
            onTap: controller.changeTabIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label:
                      'Home'), // iconları figmadan aldığımda renklerini turuncuya dönüştüremiyorum
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border_rounded), label: 'Favorite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book_sharp), label: 'Order'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.reviews), label: 'Reward'),
            ],
            unselectedItemColor: Colors.grey, // Seçilmemiş ögelerin rengi
            selectedItemColor: Color(0xFFF87146), // Seçilmiş öge rengi
          )),
    );
  }
}
