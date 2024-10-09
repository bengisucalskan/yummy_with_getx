import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/image/images.dart';
import 'package:getx_architecture_template/core/extension/image_ex.dart';
import 'package:getx_architecture_template/feature/home/controller/home_controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
        title: TextField(
          enableSuggestions: true, // Klavyede önerileri etkinleştir
          autofocus: true,

          decoration: InputDecoration(
            hintText: 'What are you yearning for?',
            hintStyle:
                TextStyle(color: Theme.of(context).colorScheme.secondary),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide.none,
            ),
            prefixIcon: AppImages.instance.search.assetImage,
          ),
          onChanged: (query) {
            // Burada arama sonuçlarına göre liste güncelleme işlemlerini gerçekleştirebilirsiniz
          },
        ),
      ),
    );
  }
}
