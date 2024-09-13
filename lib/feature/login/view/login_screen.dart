import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/image/images.dart';
import 'package:getx_architecture_template/core/extension/image_ex.dart';
import 'package:getx_architecture_template/feature/login/controller/login_controller.dart';
import 'package:getx_architecture_template/feature/login/view/signin_screen.dart';
import 'package:getx_architecture_template/feature/login/view/signup_screen.dart';
import 'package:getx_architecture_template/product/widget/continue_with.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        /* appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                ThemeService().changeTheme();
              },
              icon: const Icon(Icons.change_circle)),
        ), */
        body: SafeArea(
            child: Stack(
          children: <Widget>[
            FractionallySizedBox(
              heightFactor: 1.05,
              widthFactor: 1.12,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              AppImages.instance.breakfastBackGround),
                          fit: BoxFit.fill))),
            ),
            SafeArea(
              minimum: const EdgeInsets.only(top: 160),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    AppImages.instance.splashYummyLittle.assetImage,
                    const SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(SigninScreen(
                          controller: controller,
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xFFF87146),
                          minimumSize: const Size(double.infinity, 50)),
                      child: const Text('Sign in'),
                    ),
                    const SizedBox(height: 15),
                    const ContinueWith(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Do have an account?',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(SignupScreen(controller: controller));
                          },
                          child: const Text('Sign up',
                              style: TextStyle(color: Color(0xFFF87146))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        )));
  }
}
