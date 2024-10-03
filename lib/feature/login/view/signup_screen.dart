import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/feature/login/controller/login_controller.dart';
import 'package:getx_architecture_template/product/widget/appbar.dart';
import 'package:getx_architecture_template/product/widget/continue_with.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key, required this.controller});

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Sign up',
        onBackPressed: () => Get.back(),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: context.paddingNormalHorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _signUpText(text: 'Full name'),
                _signUpTextField(
                  hintText: 'Enter full name',
                  onChanged: (value) {},
                ),
                SizedBox(height: context.lowValue),
                _signUpText(text: 'Phone number'),
                _signUpTextField(
                  hintText: 'Enter your phone number',
                  onChanged: (value) {},
                ),
                SizedBox(height: context.lowValue),
                _signUpText(text: 'Email'),
                _signUpTextField(
                  hintText: 'Enter email',
                  onChanged: (value) {},
                ),
                SizedBox(height: context.lowValue),
                _signUpText(text: 'Password'),
                _signUpTextField(
                  hintText: 'Enter password',
                  onChanged: (value) {},
                  obscureText: controller.obscureText1,
                  togglePasswordVisibility:
                      controller.togglePasswordVisibility1,
                ),
                SizedBox(height: context.lowValue),
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
                SizedBox(height: context.lowValue),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Terms and policies',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onTertiary,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    minimumSize: Size(double.infinity,
                        MediaQuery.of(context).size.height * 0.07),
                  ),
                  child: const Text('Sign up'),
                ),
                SizedBox(height: context.mediumValue),
                const ContinueWith(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _signUpText({String? text}) {
  return Text(text ?? '',
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
}

Widget _signUpTextField({
  String? hintText,
  required void Function(String value) onChanged,
  RxBool? obscureText,
  VoidCallback? togglePasswordVisibility,
}) {
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
            color: Color.fromARGB(255, 209, 204, 204),
            width: 0.2,
          ),
        ),
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
