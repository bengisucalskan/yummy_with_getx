import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';
import 'package:getx_architecture_template/feature/order/controller/order_controller.dart';

class FromCartToOrderController extends GetxController {
  final RxList<Meals> cartItems = <Meals>[].obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      cartItems.assignAll((Get.arguments as List<dynamic>).cast<Meals>());
    }
  }

  // Siparişleri kaydediyoz ve OrderController'a eklliyoruz
  Future<void> saveOrders() async {
    final OrderController orderController = Get.find<OrderController>();
    for (var meal in cartItems) {
      await orderController.addToOrders(meal);
    }
  }
}
