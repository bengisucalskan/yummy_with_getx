import 'package:flutter/material.dart';
import 'package:getx_architecture_template/product/widget/circle_progresbar.dart';

extension ImageExtension on String {
  Image get assetImage => Image.asset(this,
      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error));

  Image get networkImage => Image.network(
        this,
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
        loadingBuilder: (context, child, loadingProgress) =>
            const CircleProgressBarLoading(),
      );
}
