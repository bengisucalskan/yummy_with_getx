import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/home_details/search/controller/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(SearchController.new);
  }
}
