import '../../../product/mixin/env_manager.dart';
import '/core/init/cache/locale_manager.dart';

import '../network/network_manager.dart';

class DependencyInjection {
  static init() async {
    await Future.wait([
      EnvManager.loadDotEnv(),
      LocaleManager.prefrencesInit(),
    ]);
    NetworkManager.instance?.coreDio;
  }
}
