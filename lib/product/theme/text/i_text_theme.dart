import 'package:flutter/material.dart';

abstract class ITextTheme {
  final Color? primaryColor;
  TextStyle? title1;
  TextStyle? title2;
  TextStyle? title3;
  TextStyle? title4;

  TextStyle? button1;
  TextStyle? button2;
  TextStyle? button3;

  TextStyle? paragraph1;
  TextStyle? paragraph2;

  String? fontFamily;

  ITextTheme(this.primaryColor);
}
