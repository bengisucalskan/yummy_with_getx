import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/login/controller/login_controller.dart';
import 'package:getx_architecture_template/feature/login/view/signup_screen.dart';
import 'package:getx_architecture_template/product/widget/continue_with.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key, required this.controller});

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Sign in',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 30),
                    const Text('Phone Number', style: TextStyle(fontSize: 16)),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
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
                                  width: 0.2)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('Password', style: TextStyle(fontSize: 16)),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
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
                                  width: 0.2)),
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
                          style:
                              TextStyle(color: Color(0xFFF87146), fontSize: 14),
                        )),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: controller.login,
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: const Color(0xFFFFFFFF),
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
                )),
          ),
        ));
  }
}
