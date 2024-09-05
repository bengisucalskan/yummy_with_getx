import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image(image: AssetImage('assets/images/splash_yummy_big.png')),
        ),
      ),
    );
  }
}
