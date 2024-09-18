import '../../../core/base/model/IResponseModel.dart';
import '/core/base/service/base_service.dart';
import '/product/network/service_extension.dart';
import '/feature/home/model/meal.dart';
import '../../../core/constants/enums/http_request_enum.dart';

abstract class IHomeService {
  Future<IResponseModel<Meal?>?> getPosts();
}

class HomeService extends IHomeService with BaseService {
  @override
  Future<IResponseModel<Meal?>?> getPosts() async {
    final response = await networkManager?.send<Meal>(
      ServicePathEnum.search.rawValue,
      parseModel: Meal(),
      type: HttpTypes.GET,
    );

    return response;
  }
}
