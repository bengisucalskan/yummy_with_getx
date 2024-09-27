import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_architecture_template/feature/favorite/view/dishes_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Favorite List',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                  backgroundColor: Color(0xFF332C45),
                  unselectedBackgroundColor: Color(0xFFE8E8E8),
                  unselectedLabelStyle:
                      TextStyle(color: Colors.pink), // rengi niye değişmiyo
                  labelStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
