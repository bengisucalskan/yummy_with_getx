import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/feature/login/login_details/signin/controller/signin_controller.dart';
import 'package:getx_architecture_template/product/widget/appbar.dart';
import 'package:getx_architecture_template/product/widget/continue_with.dart';

class SigninScreen extends GetView<SigninController> {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Sign in',
        onBackPressed: () => Get.back(),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: context.paddingNormalHorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: context.mediumValue),
                const Text('Email', style: TextStyle(fontSize: 16)),
                Padding(
                  padding: context.paddingLow,
                  child: TextField(
                    controller: controller.mailC,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      controller.validateForm();
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your phone number',
                      hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onSecondary,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: context.lowValue),
                const Text('Password', style: TextStyle(fontSize: 16)),
                Padding(
                  padding: context.paddingLow,
                  child: TextField(
                    controller: controller.password,
                    textInputAction: TextInputAction.done,
                    onChanged: (value) {
                      controller.validateForm();
                    },
                    obscureText: controller.obscureText.value,
                    decoration: InputDecoration(
                      hintText: 'Enter password',
                      hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onSecondary,
                          width: 1.0,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(controller.obscureText.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: controller.passwordVisibility,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onTertiary,
                        fontSize: 14),
                  ),
                ),
                SizedBox(height: context.lowValue),
                ElevatedButton(
                  onPressed: controller.isFormValid.value
                      ? () {
                          controller.login();
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: controller.isFormValid.value
                        ? context.colorScheme.primary
                        : Theme.of(context).colorScheme.onSecondary,
                    backgroundColor: controller.isFormValid.value
                        ? context.colorScheme.onTertiary
                        : Theme.of(context).colorScheme.primary,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: const Text('Sign in'),
                ),
                SizedBox(height: context.lowValue),
                const ContinueWith(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Do have an account?',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.SIGNUP);
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onTertiary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
