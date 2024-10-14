import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';
import 'dart:convert';

class OrderController extends GetxController {
  final RxList<Meals> orderItems = <Meals>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadOrders();
  }

  Future<void> saveOrders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> jsonList =
        orderItems.map((meal) => jsonEncode(meal.toJson())).toList();
    await prefs.setStringList(
        'orderItems', jsonList); // JSON formatında liste kayydet
  }

  Future<void> loadOrders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? orderData = prefs.getStringList('orderItems');

    if (orderData != null) {
      try {
        // JSON formatındaki String listesini Meals nesnelerine çeviriyo
        orderItems.assignAll(orderData
            .map((order) =>
                Meals.fromJson(jsonDecode(order) as Map<String, dynamic>))
            .toList());
        print('Orders loaded: $orderItems');
      } catch (e) {
        print("Error decoding order data: $e");
      }
    }
  }

  Future<void> addToOrders(Meals meal) async {
    orderItems.add(meal);
    await saveOrders();
  }

  Future<void> removeFromOrders(int index) async {
    orderItems.removeAt(index);
    await saveOrders();
  }

  bool get isOrderEmpty => orderItems.isEmpty;
}
