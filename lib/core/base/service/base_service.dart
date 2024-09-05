import '../../init/network/ICoreDio.dart';
import '../../init/network/network_manager.dart';

mixin BaseService {
  ICoreDioNullSafety? get networkManager => NetworkManager.instance?.coreDio;
}
