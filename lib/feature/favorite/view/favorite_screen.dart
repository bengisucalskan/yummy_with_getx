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
                unselectedBackgroundColor:
                    Theme.of(context).colorScheme.onPrimary,
                labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary, // çalışmıyo
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
