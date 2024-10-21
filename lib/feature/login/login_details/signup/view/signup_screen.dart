import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/feature/login/login_details/signup/controller/signup_controller.dart';
import 'package:getx_architecture_template/product/widget/appbar.dart';
import 'package:getx_architecture_template/product/widget/continue_with.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Sign up',
        onBackPressed: () => Get.back(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: context.paddingNormalHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _signUpText(text: 'Full name'),
              _signUpTextField(
                hintText: 'Enter full name',
                controller: controller.fullName,
                onChanged: (value) {
                  controller.validateForm();
                },
              ),
              SizedBox(height: context.lowValue),
              _signUpText(text: 'Phone number'),
              _signUpTextField(
                hintText: 'Enter your phone number',
                controller: controller.phoneNumber,
                onChanged: (value) {
                  controller.validateForm();
                },
              ),
              SizedBox(height: context.lowValue),
              _signUpText(text: 'Email'),
              _signUpTextField(
                hintText: 'Enter email',
                controller: controller.mailC,
                onChanged: (value) {
                  controller.validateForm();
                },
              ),
              SizedBox(height: context.lowValue),
              _signUpText(text: 'Password'),
              Obx(() => _signUpTextField(
                    hintText: 'Enter password',
                    controller: controller.password,
                    obscureText: controller.obscureText,
                    togglePasswordVisibility: controller.passwordVisibility,
                    onChanged: (value) {
                      controller.validateForm();
                    },
                  )),
              SizedBox(height: context.lowValue),
              _signUpText(text: 'Confirm Password'),
              Obx(() => _signUpTextField(
                    hintText: 'Enter password',
                    controller: controller.confirmPasswordController,
                    obscureText: controller.obscureText1,
                    togglePasswordVisibility: controller.passwordVisibility2,
                    onChanged: (value) {
                      controller.validateForm();
                    },
                  )),
              Text(
                'By clicking Create account, you agree to the system\'s ',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
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
              Obx(() => ElevatedButton(
                    onPressed: controller.isFormValid.value
                        ? () {
                            controller.signUp();
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: controller.isFormValid.value
                          ? Theme.of(context).colorScheme.primary
                          : context.colorScheme.onSecondary,
                      backgroundColor: controller.isFormValid.value
                          ? Theme.of(context).colorScheme.onTertiary
                          : context.colorScheme.secondary,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: const Text(
                      'Sign up',
                    ),
                  )),
              SizedBox(height: context.mediumValue),
              const ContinueWith(),
            ],
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
  required TextEditingController controller,
  RxBool? obscureText,
  VoidCallback? togglePasswordVisibility,
  required void Function(String) onChanged,
}) {
  return Padding(
    padding: const EdgeInsets.all(9.0),
    child: TextField(
      controller: controller,
      onChanged: onChanged,
      textInputAction: TextInputAction.next,
      obscureText: obscureText?.value ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
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
            color: Colors.black,
            width: 1.0,
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
    ),
  );
}
