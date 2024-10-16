import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/home_details/my_account/account/account_details/personel_edit/controller/personal_edit_controller.dart';
import 'package:getx_architecture_template/product/widget/appbar.dart';

class PersonalEditScreen extends GetView<PersonalEditController> {
  const PersonalEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Personal Editing',
        onBackPressed: Get.back,
      ),
    );
  }
}
