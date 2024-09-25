import '../../../core/base/model/IResponseModel.dart';
import '/core/base/service/base_service.dart';
import '/product/network/service_extension.dart';
import '/feature/home/model/meal.dart';
import '../../../core/constants/enums/http_request_enum.dart';

abstract class IHomeService {
  Future<IResponseModel<Meal?>?> getRandom();
  Future<IResponseModel<Meal?>?> getCategory();
  Future<IResponseModel<Meal?>?> getArea();
  Future<IResponseModel<Meal?>?> fetchMealsByArea(String country);
  Future<IResponseModel<Meal?>?> fetchMealsByCategory(String categories);
  Future<IResponseModel<Meal?>?> fetchMealsById(String id);

  fetchMealsByCountry(String country) {}
}

class HomeService extends IHomeService with BaseService {
  @override
  Future<IResponseModel<Meal?>?> getRandom() async {
    final response = await networkManager?.send<Meal>(
      ServicePathEnum.random.rawValue,
      parseModel: Meal(),
      type: HttpTypes.GET,
    );

    return response;
  }

  @override
  Future<IResponseModel<Meal?>?> getCategory() async {
    final response = await networkManager?.send<Meal>(
      ServicePathEnum.category.rawValue,
      parseModel: Meal(),
      type: HttpTypes.GET,
    );

    return response;
  }

  @override
  Future<IResponseModel<Meal?>?> getArea() async {
    final response = await networkManager?.send<Meal>(
      ServicePathEnum.area.rawValue,
      parseModel: Meal(),
      type: HttpTypes.GET,
    );

    return response;
  }

  @override
  Future<IResponseModel<Meal?>?> fetchMealsByArea(String country) async {
    final response = await networkManager?.send<Meal>(
      "/filter.php?a=$country",
      parseModel: Meal(),
      type: HttpTypes.GET,
    );

    return response;
  }

  @override
  Future<IResponseModel<Meal?>?> fetchMealsByCategory(String categories) async {
    final response = await networkManager?.send<Meal>(
      "/filter.php?c=$categories",
      parseModel: Meal(),
      type: HttpTypes.GET,
    );
    return response;
  }

  @override
  Future<IResponseModel<Meal?>?> fetchMealsById(String id) async {
    final response = await networkManager?.send<Meal>(
      "lookup.php?i=$id",
      parseModel: Meal(),
      type: HttpTypes.GET,
    );
    return response;
  }
}
