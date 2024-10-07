import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/image/images.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/core/extension/image_ex.dart';
import 'package:getx_architecture_template/feature/login/controller/login_controller.dart';
import 'package:getx_architecture_template/feature/login/login_details/signin/view/signin_screen.dart';
import 'package:getx_architecture_template/feature/login/login_details/signup/view/signup_screen.dart';
import 'package:getx_architecture_template/product/widget/continue_with.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            FractionallySizedBox(
              heightFactor: 1.05,
              widthFactor: 1.12,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.instance.breakfastBackGround),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SafeArea(
              minimum: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2),
              child: Padding(
                padding: context.paddingNormalHorizontal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    AppImages.instance.splashYummyLittle.assetImage,
                    SizedBox(height: context.highValue),
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.SIGNIN);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor:
                            Theme.of(context).colorScheme.onTertiary,
                        minimumSize: Size(double.infinity,
                            MediaQuery.of(context).size.height * 0.07),
                      ),
                      child: const Text('Sign in'),
                    ),
                    SizedBox(height: context.lowValue),
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
                            Get.toNamed(Routes.SIGNUP);
                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onTertiary),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
