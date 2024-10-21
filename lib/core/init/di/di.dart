import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:getx_architecture_template/core/init/cache/locale_manager.dart';
import 'package:getx_architecture_template/core/init/network/network_manager.dart';
import 'package:getx_architecture_template/firebase_options.dart';
import 'package:getx_architecture_template/product/mixin/env_manager.dart';

final class DependencyInjection {
  DependencyInjection._();
  static init() async {
    await Future.wait([
      EnvManager.loadDotEnv(),
      LocaleManager.prefrencesInit(),
    ]);
    NetworkManager.instance?.coreDio;
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    };
  }
}
