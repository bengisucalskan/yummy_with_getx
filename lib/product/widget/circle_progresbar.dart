import 'package:flutter/material.dart';

class CircleProgressBarLoading extends StatelessWidget {
  const CircleProgressBarLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: Colors.red,
    ));
  }
}
