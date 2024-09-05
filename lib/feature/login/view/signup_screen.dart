import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/login/controller/login_controller.dart';
import 'package:getx_architecture_template/product/widget/continue_with.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key, required this.controller});

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
            'Sign up',
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
                  _signUpText(text: 'Full name'),
                  _signUpTextField(
                    hintText: 'Enter full name',
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 10),
                  _signUpText(text: 'Phone number'),
                  _signUpTextField(
                    hintText: 'Enter yor phone number',
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 10),
                  _signUpText(text: 'Email'),
                  _signUpTextField(
                    hintText: 'Enter email',
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 10),
                  _signUpText(text: 'Password'),
                  _signUpTextField(
                    hintText: 'Enter password',
                    onChanged: (value) {},
                    obscureText: controller.obscureText1,
                    togglePasswordVisibility:
                        controller.togglePasswordVisibility1,
                  ),
                  const SizedBox(height: 10),
                  _signUpText(text: 'Password'),
                  _signUpTextField(
                    hintText: 'Enter password',
                    onChanged: (value) {},
                    obscureText: controller.obscureText2,
                    togglePasswordVisibility:
                        controller.togglePasswordVisibility2,
                  ),
                  const Text(
                    'By clicking Create account, you agree to the system\'s ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 0.1),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Terms and policies',
                        style: TextStyle(
                          color: Color(0xFFF87146),
                        )),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: const Color(0xFFFFFFFF),
                        minimumSize: const Size(double.infinity, 50)),
                    child: const Text('Sign up'),
                  ),
                  const SizedBox(height: 15),
                  const ContinueWith(),
                ],
              ),
            ),
          ),
        ));
  }
}

Widget _signUpText({String? text}) {
  return Text(text ?? '',
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
}

Widget _signUpTextField(
    {String? hintText,
    required void Function(String value) onChanged,
    RxBool? obscureText,
    VoidCallback? togglePasswordVisibility}) {
  return Padding(
    padding: const EdgeInsets.all(9.0),
    child: TextField(
      textInputAction: TextInputAction.next,
      obscureText: obscureText?.value ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 209, 204, 204), width: 0.2)),
        suffixIcon: obscureText != null
            ? IconButton(
                icon: Icon(obscureText.value
                    ? Icons.visibility_off
                    : Icons.visibility),
                onPressed: togglePasswordVisibility,
              )
            : null,
      ),
      onChanged: onChanged,
    ),
  );
}
