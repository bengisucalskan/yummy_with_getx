import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home_details/category/controller/category_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(() => CategoryController());
  }
}
