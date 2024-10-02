import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/home_details/meal/meal_details/reviews/controller/reviews_controller.dart';

class ReviewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewsController>(ReviewsController.new);
  }
}
