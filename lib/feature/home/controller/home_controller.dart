import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/image/images.dart';
import 'package:getx_architecture_template/core/extension/image_ex.dart';
import 'package:getx_architecture_template/feature/home/model/category_item.dart';
import '/feature/home/service/home_service.dart';

import '../model/user.dart';

class HomeController extends GetxController {
  IHomeService homeService = HomeService();
  final Rxn<User?> post = Rxn<User?>();
  final RxBool isLoading = true.obs;
  final RxList<CategoryItem> categoryItems = <CategoryItem>[].obs;

  @override
  void onInit() {
    getdata();
    super.onInit();
  }

  void _loadCategoryItems() {
    final List<CategoryItem> items = [
      CategoryItem(
          image: AppImages.instance.flashDeals.assetImage,
          title: "Flash Deals"),
      CategoryItem(
          image: AppImages.instance.niceShop.assetImage, title: "Nice Shop"),
      CategoryItem(
          image: AppImages.instance.points.assetImage, title: "Points"),
      CategoryItem(image: AppImages.instance.rice.assetImage, title: "Rice"),
      CategoryItem(image: AppImages.instance.noodles.assetImage, title: "Rice"),
      CategoryItem(
          image: AppImages.instance.vegetable.assetImage, title: "Rice"),
      CategoryItem(image: AppImages.instance.bbq.assetImage, title: "Rice"),
      CategoryItem(image: AppImages.instance.othet.assetImage, title: "Rice"),
    ];
    categoryItems.addAll(items);
  }

  getdata() async {
    isLoading.value = true;
    post.value = (await homeService.getPosts())?.data;
    isLoading.value = false;
  }
}
