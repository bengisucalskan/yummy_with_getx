import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/feature/login/controller/login_controller.dart';
import 'package:getx_architecture_template/feature/login/view/signup_screen.dart';
import 'package:getx_architecture_template/product/widget/appbar.dart';
import 'package:getx_architecture_template/product/widget/continue_with.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key, required this.controller});

  final LoginController controller;

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
                const Text('Phone Number', style: TextStyle(fontSize: 16)),
                Padding(
                  padding: context.paddingLow,
                  child: TextField(
                    controller: controller
                        .phoneController, // Telefon numarası için masked text controller
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter your phone number',
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 209, 204, 204),
                          width: 0.2,
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
                    textInputAction: TextInputAction.done,
                    obscureText: controller.obscureText.value,
                    decoration: InputDecoration(
                      hintText: 'Enter password',
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 209, 204, 204),
                          width: 0.2,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(controller.obscureText.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                    ),
                    onChanged: controller.updatePassword,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(color: Color(0xFFF87146), fontSize: 14),
                  ),
                ),
                SizedBox(height: context.lowValue),
                ElevatedButton(
                  onPressed: controller.login,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: const Color(0xFFFFFFFF),
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
                        Get.to(SignupScreen(controller: controller));
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Color(0xFFF87146)),
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
