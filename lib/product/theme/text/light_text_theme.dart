import '/product/theme/text/i_text_theme.dart';
import 'package:flutter/material.dart';

class LightTextTheme implements ITextTheme {
  @override
  TextStyle? title1;

  @override
  TextStyle? title2;

  @override
  TextStyle? title3;

  @override
  TextStyle? title4;

  @override
  TextStyle? button1;

  @override
  TextStyle? button2;

  @override
  TextStyle? button3;

  @override
  TextStyle? paragraph1;

  @override
  TextStyle? paragraph2;

  @override
  String? fontFamily;

  @override
  Color? primaryColor;
  LightTextTheme() {
    title1 =
        const TextStyle(fontWeight: FontWeight.w500, fontStyle: FontStyle.normal, fontSize: 30);
    title2 =
        const TextStyle(fontWeight: FontWeight.w700, fontStyle: FontStyle.normal, fontSize: 24);
    title3 =
        const TextStyle(fontWeight: FontWeight.w500, fontStyle: FontStyle.normal, fontSize: 18);
    title4 =
        const TextStyle(fontWeight: FontWeight.w500, fontStyle: FontStyle.normal, fontSize: 16);
    button1 =
        const TextStyle(fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontSize: 16);
    button2 =
        const TextStyle(fontWeight: FontWeight.w500, fontStyle: FontStyle.normal, fontSize: 14);
    button3 =
        const TextStyle(fontWeight: FontWeight.w500, fontStyle: FontStyle.normal, fontSize: 12);
    paragraph1 =
        const TextStyle(fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontSize: 14);
    paragraph2 =
        const TextStyle(fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontSize: 12);
  }
}
