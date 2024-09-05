import '/product/theme/color/dark_color_theme.dart';
import '/product/theme/color/i_color_theme.dart';
import '/product/theme/color/light_color_theme.dart';
import '/product/theme/text/dart_theme.dart';
import '/product/theme/text/i_text_theme.dart';
import '/product/theme/text/light_text_theme.dart';
import 'package:flutter/material.dart';

abstract class ITheme {
  ITextTheme get textTheme;
  IColorTheme get colorTheme;
}

class AppThemeLight extends ITheme {
  @override
  IColorTheme get colorTheme => LightColor();

  @override
  ITextTheme get textTheme => LightTextTheme();
}

class AppThemeDark extends ITheme {
  @override
  IColorTheme get colorTheme => DarkColor();

  @override
  ITextTheme get textTheme => DarkTextTheme();
}

abstract class ThemeManager {
  static ThemeData createTheme(ITheme theme) {
    return ThemeData(
        textTheme: textTheme(theme),
        fontFamily: theme.textTheme.fontFamily,
        scaffoldBackgroundColor: theme.colorTheme.colorScheme?.background,
        colorScheme: theme.colorTheme.colorScheme?.copyWith());
  }

  static TextTheme textTheme(ITheme theme) {
    return TextTheme(
        displayLarge: theme.textTheme.title1,
        headlineLarge: theme.textTheme.title2,
        headlineMedium: theme.textTheme.title3,
        headlineSmall: theme.textTheme.title4,
        bodyLarge: theme.textTheme.button1,
        bodyMedium: theme.textTheme.button2,
        bodySmall: theme.textTheme.button3,
        labelLarge: theme.textTheme.paragraph1,
        labelMedium: theme.textTheme.paragraph2);
  }
}
