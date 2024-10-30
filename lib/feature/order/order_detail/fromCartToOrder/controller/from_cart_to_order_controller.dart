import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';

class FromCartToOrderController extends GetxController {
  final RxList<Meals> cartItems = <Meals>[].obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      cartItems.assignAll((Get.arguments as List<dynamic>)
          .cast<Meals>()); // cart screenden argüan olarak alıyoz
    }
  }

  Future<void> addToOrder(List<Meals> meals) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print('Kullanıcı oturumu açmamış');
      return;
    }

    CollectionReference orderRef = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('orders'); // orders koleksiyonu

    try {
      for (var meal in meals) {
        await orderRef.add({
          'mealId': meal.idMeal,
          'mealName': meal.strMeal,
          'mealPhoto': meal.strMealThumb,
          'orderDate': DateTime.now().toIso8601String(), // o anki tarih
        });
      }
      print('Orders added to Firebase.');
    } catch (e) {
      print("Error adding orders to Firebase: $e");
    }
  }
}
