import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/image/images.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';
import 'package:getx_architecture_template/core/extension/image_ex.dart';
import 'package:getx_architecture_template/feature/favorite/view/favorite_screen.dart';
import 'package:getx_architecture_template/feature/home/controller/home_controller.dart';
import 'package:getx_architecture_template/feature/home/view/home_screen.dart';
import 'package:getx_architecture_template/feature/order/view/order_screen.dart';
import 'package:getx_architecture_template/feature/reward/view/reward_screen.dart';
import 'package:getx_architecture_template/product/widget/appbar.dart';
import 'package:getx_architecture_template/product/widget/drawer.dart';

class BaseScreen extends GetView<HomeController> {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: _buildAppBar(context),
        drawer: controller.tabIndex.value == 0 ? const CustomDrawer() : null,
        body: _buildBody(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.tabIndex.value,
          type: BottomNavigationBarType.fixed,
          onTap: controller.changeTabIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_sharp),
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.reviews),
              label: 'Reward',
            ),
          ],
          unselectedItemColor: Theme.of(context).colorScheme.secondary,
          selectedItemColor: Theme.of(context).colorScheme.onTertiary,
        ),
      );
    });
  }

  Widget _buildBody() {
    switch (controller.tabIndex.value) {
      case 0:
        return const HomeScreen();
      case 1:
        return const FavoriteScreen();
      case 2:
        return const OrderScreen();
      case 3:
        return const RewardScreen();
      default:
        return const HomeScreen();
    }
  }

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    switch (controller.tabIndex.value) {
      case 0:
        return AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text('NYCBroadwayekleme yap'),
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
        );
      case 1:
        return const CustomAppBar(
          title: 'Favorite List',
          showBackButton: false,
        );
      case 2:
        return const CustomAppBar(
          title: 'Order',
          showBackButton: false,
        );
      case 3:
        return const CustomAppBar(
          title: 'Exchange Rewards',
          showBackButton: false,
        );
      default:
        return null;
    }
  }
}
