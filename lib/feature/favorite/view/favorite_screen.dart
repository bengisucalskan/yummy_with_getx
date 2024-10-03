import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/favorite/controller/favorite_controller.dart';
import 'package:getx_architecture_template/feature/favorite/view/dishes_screen.dart';

class FavoriteScreen extends GetView<FavoriteController> {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            ButtonsTabBar(
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                unselectedBackgroundColor: const Color(0xFFE8E8E8),
                labelStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                tabs: const [
                  Tab(
                      child: SizedBox(
                    width: 150,
                    child: Text('Dishes'),
                  )),
                  Tab(
                      child: SizedBox(
                    width: 150,
                    child: Text('Restaurant'),
                  )),
                ]),
            const Expanded(
                child: TabBarView(
              children: <Widget>[
                Center(
                  child: DishesScreen(),
                ),
                Center(
                  child: Icon(Icons.abc),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
