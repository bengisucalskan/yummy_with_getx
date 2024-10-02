import 'package:get/get.dart';

class CartController extends GetxController {
  final RxList cartItem = RxList.empty(growable: true); //  modelden türeyecek

  @override
  void onInit() {
    super.onInit();
  }

  bool get isCartEmpty =>
      cartItem.isEmpty; // liste boşsa (şimdilik sepet boşken kullancam)
}
