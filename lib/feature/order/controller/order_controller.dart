import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';

class OrderController extends GetxController {
  final RxList<Meals> orderItems = <Meals>[].obs;

  @override
  void onInit() {
    super.onInit();
    listenToOrderUpdates();
  }

  void listenToOrderUpdates() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('orders')
        .snapshots()
        .listen((snapshot) {
      orderItems.clear();

      for (var doc in snapshot.docs) {
        var data = doc.data() as Map<String, dynamic>;

        Meals meal = Meals(
          idMeal: data['mealId'],
          strMeal: data['mealName'],
          strMealThumb: data['mealPhoto'],
        );
        orderItems.add(meal);
      }
      print('Order items updated from Firebase.');
    });
  }

  Future<void> removeFromOrder(String mealId) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print('Kullanıcı oturumu açmamış');
      return;
    }

    CollectionReference orderRef = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('orders');

    try {
      final querySnapshot =
          await orderRef.where('mealId', isEqualTo: mealId).get();

      for (var doc in querySnapshot.docs) {
        await orderRef.doc(doc.id).delete();
      }
      print('Order item removed from Firebase.');
    } catch (e) {
      print("Error removing order item from Firebase: $e");
    }
  }

  bool get isOrderEmpty => orderItems.isEmpty;
}
