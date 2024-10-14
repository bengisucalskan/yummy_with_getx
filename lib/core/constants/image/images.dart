import 'package:flutter/material.dart';

import '../../extension/string_extension.dart';

class AppImages {
  AppImages._init();
  static AppImages? _instace;
  static AppImages get instance => _instace ??= AppImages._init();

  String approvalsIcon = 'test'.toPNG;
  String backButton = 'back_button'.toPNG;
  String notification = 'notification'.toPNG;
  String bag = 'bag'.toPNG;
  String discountShape = 'discount-shape'.toPNG;
  String ellipse = 'ellipse'.toPNG;
  String iconApple = 'icon_apple'.toPNG;
  String iconFacebook = 'icon_facebook'.toPNG;
  String iconGoogle = 'icon_google'.toPNG;
  String location = 'location'.toPNG;
  String search = 'search-normal'.toPNG;
  String breakfastBackGround = 'breakfast_background'.toPNG;
  String splashYummyBig = 'splash_yummy_big'.toPNG;
  String splashYummyLittle = 'splash_yummy_little'.toPNG;
  String wallet = 'wallet'.toPNG;
  String discover = 'discover'.toPNG;
  String delicious = 'delicious_exm'.toPNG;
  String show = 'show'.toPNG;
  String discount = 'discount_exm'.toPNG;
  String highlight = 'highlights_exm'.toPNG;
  String restaurant = 'restaurant_exm'.toPNG;
  String recommended = 'recommended'.toPNG;
  String favorite = 'favorite'.toPNG;
  String order = 'order'.toPNG;
  String reward = 'reward'.toPNG;
  String smilingFace = 'smiling_face'.toPNG;
  String cirlce = 'circle'.toPNG;
  String map = 'map'.toPNG;
  String cry = 'cry_face'.toPNG;

  String flashDeals = 'flash_deals'.toPNG;
  String niceShop = 'nice_shop'.toPNG;
  String points = 'points'.toPNG;
  String rice = 'rice'.toPNG;
  String noodles = 'noodles'.toPNG;
  String vegetable = 'vegetable'.toPNG;
  String bbq = 'bbq'.toPNG;
  String othet = 'other'.toPNG;
  String homeShop = 'home_shop_exm'.toPNG;
  String reviewsIcon = 'reviews_icon'.toPNG;
}
