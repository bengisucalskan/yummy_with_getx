import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/init/di/di.dart';
import 'package:getx_architecture_template/core/init/lang/locales.g.dart';
import 'package:getx_architecture_template/core/init/route/app_pages.dart';
import 'package:getx_architecture_template/core/init/theme/theme_service.dart';
import 'package:getx_architecture_template/product/theme/app_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeManager.createTheme(AppThemeLight()),
          darkTheme: ThemeManager.createTheme(AppThemeDark()),
          themeMode: ThemeService().getTheme(),
          translationsKeys: AppTranslation.translations,
          locale: Get.deviceLocale,
          fallbackLocale: const Locale('tr', 'TR'),
          getPages: AppPages.routes,
          initialRoute: AppPages.INITIAL,
        );
      },
    );
  }
}
