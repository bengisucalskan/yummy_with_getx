import '../../../core/base/model/IResponseModel.dart';
import '/core/base/service/base_service.dart';
import '/product/network/service_extension.dart';
import '/feature/home/model/user.dart';
import '../../../core/constants/enums/http_request_enum.dart';

abstract class IHomeService {
  Future<IResponseModel<User?>?> getPosts();
}

class HomeService extends IHomeService with BaseService {
  @override
  Future<IResponseModel<User?>?> getPosts() async {
    final response = await networkManager?.send<User>(
      ServicePathEnum.posts.rawValue,
      parseModel: User(),
      type: HttpTypes.GET,
    );
    return response;
  }
}
