import 'package:flutter/material.dart';
import 'package:getx_architecture_template/core/constants/image/images.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/core/extension/image_ex.dart';

class ContinueWith extends StatelessWidget {
  const ContinueWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: const Text(
            'or',
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () {},
          icon: AppImages.instance.iconGoogle.assetImage,
          label: Text("Continue with Google"),
          style: ElevatedButton.styleFrom(
              foregroundColor: context.colorScheme.primary,
              backgroundColor: Color(0xFF5384EE),
              minimumSize: Size(double.infinity, 50)),
        ),
        const SizedBox(height: 10),
        ElevatedButton.icon(
            onPressed: () {},
            icon: AppImages.instance.iconFacebook.assetImage,
            label: Text('Continue with Facebook'),
            style: ElevatedButton.styleFrom(
                foregroundColor: context.colorScheme.primary,
                backgroundColor: Color(0xFF415792),
                minimumSize: Size(double.infinity, 50))),
        const SizedBox(height: 10),
        ElevatedButton.icon(
            onPressed: () {},
            icon: AppImages.instance.iconApple.assetImage,
            label: Text('Continue with GoogleApple'),
            style: ElevatedButton.styleFrom(
                foregroundColor: context.colorScheme.primary,
                backgroundColor: context.colorScheme.inversePrimary,
                minimumSize: Size(double.infinity, 50))),
        const SizedBox(height: 20),
      ],
    );
  }
}
