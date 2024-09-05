import 'dart:ui';

import '/product/theme/color/i_color_theme.dart';
import 'package:flutter/src/material/color_scheme.dart';

class DarkColor implements IColorTheme {
  @override
  Color? background;

  @override
  Brightness? brightness;

  @override
  ColorScheme? colorScheme;

  @override
  AppColors color = AppColors();
  DarkColor() {
    background = color.black;
    brightness = Brightness.dark;
    colorScheme = const ColorScheme.dark().copyWith(
        background: color.black,
        primary: color.white,
        onPrimary: color.white3,
        secondary: color.grey,
        onSecondary: color.black,
        tertiary: color.green,
        onTertiary: color.red,
        surface: color.blue,
        onSurface: color.white);
  }
}
