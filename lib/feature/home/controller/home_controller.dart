import 'dart:isolate';

import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/image/images.dart';
import 'package:getx_architecture_template/feature/home/model/category_item.dart';
import '/feature/home/service/home_service.dart';

import '../model/meal.dart';

class HomeController extends GetxController {
  IHomeService homeService = HomeService();
  final Rxn<Meal?> random = Rxn<Meal?>();
  final Rxn<Meal?> category = Rxn<Meal?>();
  final Rxn<Meal?> area = Rxn<Meal?>();
  final RxBool isLoading = true.obs;
  final RxList<CategoryItem> categoryItems = <CategoryItem>[].obs;
  final RxInt tabIndex = 0.obs;
  final RxList<String?> uniqueCountries = <String>[].obs;
  late ReceivePort receivePort;
  late Isolate randomIsolate, categoryIsolate, areaIsolate;

  @override
  void onInit() {
    getdata();
    _loadCategoryItems();
    super.onInit();
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void _loadCategoryItems() {
    final List<CategoryItem> items = [
      // buradaki iconları düzenle
      CategoryItem(image: AppImages.instance.flashDeals),
      CategoryItem(image: AppImages.instance.niceShop),
      CategoryItem(image: AppImages.instance.points),
      CategoryItem(image: AppImages.instance.rice),
      CategoryItem(image: AppImages.instance.noodles),
      CategoryItem(image: AppImages.instance.vegetable),
      CategoryItem(image: AppImages.instance.bbq),
      CategoryItem(image: AppImages.instance.othet),
      CategoryItem(image: AppImages.instance.othet),
      CategoryItem(image: AppImages.instance.othet),
      CategoryItem(image: AppImages.instance.othet),
      CategoryItem(image: AppImages.instance.othet),
      CategoryItem(image: AppImages.instance.othet),
      CategoryItem(image: AppImages.instance.othet),
    ];
    categoryItems.addAll(items);
  }

  getdata() async {
    isLoading.value = true;
    random.value = (await homeService.getRandom())?.data;
    category.value = (await homeService.getCategory())?.data;
    area.value = (await homeService.getArea())?.data;

    isLoading.value = false;
  }
}
