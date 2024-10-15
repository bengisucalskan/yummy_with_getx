import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/enums/preferences_types.dart';
import 'package:getx_architecture_template/core/init/cache/locale_manager.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';
import 'dart:convert';

class OrderController extends GetxController {
  final RxList<Meals> orderItems = <Meals>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadOrderItems();
  }

  Future<void> removeFromOrder(int index) async {
    final prefs = LocaleManager.instance;
    final orderData = prefs.getStringList(PreferencesTypes.orderList);
    if (orderData != null) {
      try {
        orderData.removeAt(index);

        await prefs.setStringList(PreferencesTypes.orderList, orderData);

        orderItems.removeAt(index);

        print('Order list updated after removal: $orderItems');
      } catch (e) {
        print("Error removing order item: $e");
      }
    }
  }

  Future<void> loadOrderItems() async {
    final prefs = LocaleManager.instance;
    final orderData = prefs.getStringList(PreferencesTypes.orderList);

    if (orderData != null) {
      try {
        orderItems.clear();
        for (String item in orderData) {
          // Gelen veriyi kontrol et ve dinamik olarak şey yap
          final decodedItem = json.decode(item);

          if (decodedItem is Map<String, dynamic>) {
            orderItems.add(Meals.fromJson(decodedItem));
          } else if (decodedItem is List<dynamic>) {
            // Eğer List<dynamic> geliyorsa, her bir öğeyi Meals objesine çevir bu kontrolü çevirirken
            //hhata alıyorum diye koydum
            for (final meal in decodedItem) {
              orderItems.add(Meals.fromJson(meal as Map<String, dynamic>));
            }
          } else {
            print("Unexpected data format: $decodedItem");
          }
        }
        print('Order items loaded: $orderItems');
      } catch (e) {
        print("Error decoding order data: $e");
      }
    }
  }

  bool get isOrderEmpty => orderItems.isEmpty;
}
