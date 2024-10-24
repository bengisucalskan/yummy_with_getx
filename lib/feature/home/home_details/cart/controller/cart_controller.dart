import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';

class CartController extends GetxController {
  final RxList<Meals> cartItems = <Meals>[].obs;
  final RxMap<String, int> itemCounts = <String, int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadCartItems();
    fetchMeals();
    logCart();
  }

  Future<void> removeFromCart(String mealId) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      log('Kullanıcı oturumu açmamış');
      return;
    }

    CollectionReference cartRef = FirebaseFirestore.instance
        .collection('carts')
        .doc(user.uid)
        .collection('items');

    try {
      final querySnapshot =
          await cartRef.where('mealId', isEqualTo: mealId).get();

      if (querySnapshot.docs.isNotEmpty) {
        var cartItem = querySnapshot.docs.first;
        if (itemCounts[mealId]! > 1) {
          await cartRef.doc(cartItem.id).update({
            'quantity': FieldValue.increment(
                -1), // quantitiy miktarını firestore da bir azalt
          });
          // UI'da miktarı azaltıyo
          itemCounts[mealId] = itemCounts[mealId]! - 1;
        } else {
          // Ürünü firestore ds  kaldır
          await cartRef.doc(cartItem.id).delete();
          // UI'dan ürünü kaldırıyo
          cartItems.removeWhere((item) => item.idMeal == mealId);
          itemCounts.remove(mealId);
        }
      }
      log('Product removed from cart.');
    } catch (e) {
      log('Error removing product from cart: $e');
    }
  }

  Future<void> loadCartItems() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      log('Kullanıcı oturumu açmamış');
      return;
    }

    /* kullanıcının sepetine erişim sağlayacak Firestore 
    referansı. Firestore'da carts koleksiyonu 
    altında her kullanıcı için  doc var ve bu doclar
    kullanıcının user.uid si  ile isimlendirliyo. Kullanıcının sepetindeki ürünler
     items alt koleksiyonunda saklanıyo. */
    CollectionReference cartRef = FirebaseFirestore.instance
        .collection('carts')
        .doc(user.uid)
        .collection('items');

    try {
      /* querysnapshot koleksiyon sorgusundan döndürülür collection 
      içinde kaç tane doc olduğunu görğp, erişebiliyoz, */
      final querySnapshot = await cartRef.get();

      cartItems.clear();
      itemCounts.clear();
      // her doc bir tane sepet ögesi
      for (var doc in querySnapshot.docs) {
        var data = doc.data() as Map<String, dynamic>;

        // quantity'yi int olarak cast ediyorm firestore dan num olarak geliyo
        int quantity = (data['quantity'] as num).toInt();

        // Ürün zaten varsa, sadece sayısını artırıyo
        if (itemCounts.containsKey(data['mealId'])) {
          itemCounts[data['mealId']] = itemCounts[data['mealId']]! + quantity;
        } else {
          // Ürün yoksa listeye ekliyo
          Meals meal = Meals(
            idMeal: data['mealId'],
            strMeal: data['mealName'],
            strMealThumb: data['mealPhoto'],
          );
          cartItems.add(meal);
          itemCounts[meal.idMeal!] = quantity;
        }
      }

      log('Cart items loaded from Firebase.');
    } catch (e) {
      log('Error loading cart items: $e');
    }
  }

  Future<void> fetchMeals() async {
    // gerekli değill o anki kullanıcıyı gösteriyor
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      log('Kullanıcı oturumu açmamış');
      return;
    }

    // Firestore'dan o anki kullanıcının verilerini alıyoruz
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    try {
      // Sadece oturum açmış kullanıcının verisini çekiyoruz
      DocumentSnapshot userDoc = await users.doc(user.uid).get();

      if (userDoc.exists) {
        // bu kişi firestore da var mı
        log('${userDoc.id} => ${userDoc.data()}', name: 'FETCHED USER MEALS');
      } else {
        log('Kullanıcı verisi bulunamadı.', name: 'FETCHED USER MEALS');
      }
    } catch (error) {
      log("Failed to fetch user data: $error");
    }
  }

  Future<void> logCart() async {
    // dursun diye gerekli değil
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      log('Kullanıcı oturumu açmamış');
      return;
    }

    CollectionReference cartRef = FirebaseFirestore.instance
        .collection('carts')
        .doc(user.uid)
        .collection('items');

    try {
      final querySnapshot = await cartRef.get();

      if (querySnapshot.docs.isEmpty) {
        log('Sepet boş', name: 'USER CART');
      } else {
        querySnapshot.docs.forEach((doc) {
          log('${doc.id} => ${doc.data()}', name: 'USER CART');
        });
      }
    } catch (e) {
      log('Failed to fetch cart items: $e');
    }
  }

  bool get isCartEmpty => cartItems.isEmpty;
}
