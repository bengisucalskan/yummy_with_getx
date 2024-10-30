import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';

class CancelOrderController extends GetxController {
  Meals? order; // late kullanmıştım Late Initialization Error aldım çevirdim

  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      order = Get.arguments as Meals;
    } else {
      Get.snackbar("Error", "Cancel detail not found");
    }
  }

  Future<void> cancelOrder() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Get.snackbar("Error", "kullanıcı giriş yapmamış");
      return;
    }

    try {
      CollectionReference orderRef = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('orders');

      // Belirtilen order ID'yi Firestore’dan kaldır ?? hepsini kaldırıyo
      final querySnapshot =
          await orderRef.where('mealId', isEqualTo: order?.idMeal).get();
      print('Query results for mealId ${order?.idMeal}: ${querySnapshot.docs}');
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs) {
          await orderRef.doc(doc.id).delete();
        }
        Get.snackbar("Success", "Order canceled successful.");
      } else {
        Get.snackbar("Error", "Order not found Firestore.");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to cancel order: $e");
      print(e);
    }
  }
}
