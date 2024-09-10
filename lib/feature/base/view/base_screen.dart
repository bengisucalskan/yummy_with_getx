import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/base/controller/base_controller.dart';

import '/feature/home/view/home_screen.dart';
import '/feature/login/view/login_screen.dart';

class BaseScreen extends GetView<BaseController> {
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
            onTap: controller.changeTabIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border_rounded), label: 'Favorite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.border_outer_rounded), label: 'Order'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.reviews), label: 'Reward'),
            ],
          )),
    );
  }
}
