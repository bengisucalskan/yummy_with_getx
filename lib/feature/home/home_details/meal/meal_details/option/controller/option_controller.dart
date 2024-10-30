import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';
import 'package:getx_architecture_template/feature/home/service/home_service.dart';

class OptionController extends GetxController {
  IHomeService homeService = HomeService();
  final RxList<Meals> mealsById = <Meals>[].obs;
  final RxBool isLoading = true.obs;
  var selectedSize = 'S'.obs;
  var quantity = 1.obs;

  @override
  void onInit() {
    super.onInit();
    String id = Get.parameters['id'] ?? '';
    print("Alınan ID: $id");
    loadMealsForId(id);
  }

  void loadMealsForId(String id) async {
    isLoading.value = true;
    final response = await homeService.fetchMealsById(id);
    if (response?.data?.meals != null) {
      mealsById.value = response?.data?.meals ?? [];
    } else {
      print("API'den gelen meals verisi null.");
    }
    isLoading.value = false;
  }

  void selectSize(String size) {
    selectedSize.value = size;
  }

  void increaseQuantity() {
    quantity.value++;
  }

  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  Future<void> addToCart(Meals meal) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        print('Kullanıcı oturumu açmamış');
        return;
      }

      CollectionReference cartRef = FirebaseFirestore.instance
          .collection('users') //user collection
          .doc(user.uid) // user id doc şekln
          .collection('carts'); // cart alt collection ı

      // Sepette aynı mealId'ye sahip ürün varsa onun üstünde işlem yap, miktarı artsın
      final querySnapshot =
          await cartRef.where('mealId', isEqualTo: meal.idMeal).get();

      if (querySnapshot.docs.isNotEmpty) {
        var cartItem = querySnapshot.docs.first;
        await cartRef.doc(cartItem.id).update({
          'quantity': FieldValue.increment(
              quantity.value), // View'da seçilen miktarı ekle
        });
      } else {
        // Yeni bir öge olark sepete ekliniyo
        await cartRef.add({
          'mealId': meal.idMeal,
          'mealName': meal.strMeal,
          'mealPhoto': meal.strMealThumb,
          'quantity': quantity.value,
        });
      }

      log('Product added to cart successfully.');
    } catch (e) {
      print('Error adding product to cart: $e');
    }
  }
}
