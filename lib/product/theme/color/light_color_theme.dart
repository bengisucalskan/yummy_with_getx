import '/product/theme/color/i_color_theme.dart';
import 'package:flutter/material.dart';

class LightColor implements IColorTheme {
  @override
  Color? background;

  @override
  Brightness? brightness;

  @override
  ColorScheme? colorScheme;

  @override
  AppColors color = AppColors();

  LightColor() {
    background = color.white2;
    brightness = Brightness.light;
    colorScheme = const ColorScheme.light().copyWith(
        background: color.white2,
        primary: color.white,
        onPrimary: color.white3,
        secondary: color.grey,
        onSecondary: color.black,
        tertiary: color.green,
        onTertiary: color.red,
        surface: color.blue,
        onSurface: color.blue2,
        inversePrimary: color.appleBlack,
        onInverseSurface: color.tBlue);
  }
}
