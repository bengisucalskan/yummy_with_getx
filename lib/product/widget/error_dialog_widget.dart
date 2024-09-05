import 'dart:io';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ErrorDialogWidget extends StatelessWidget {
  final String errorMessage;

  const ErrorDialogWidget({super.key, required this.errorMessage});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: (Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              errorMessage,
              style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              width: 30.w,
              child: IconButton(
                  onPressed: () {
                    exit(0);
                  },
                  icon: const Row(
                    children: [
                      Text("Close App"),
                      Spacer(),
                      Icon(Icons.close),
                    ],
                  )),
            )
          ],
        )),
      )),
    );
  }
}
