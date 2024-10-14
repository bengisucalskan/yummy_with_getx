import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/feature/home/home_details/my_account/account/account_details/personel_info/controller/personel_info_controller.dart';
import 'package:getx_architecture_template/product/widget/appbar.dart';

class PersonelInfoScreen extends GetView<PersonelInfoController> {
  const PersonelInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Personal Information',
        onBackPressed: Get.back,
      ),
      body: Padding(
        padding: context.paddingNormalHorizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text('Name'),
              subtitle: const Text('Dang Dinh Bao'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            Divider(color: context.colorScheme.secondary),
            ListTile(
              title: const Text('Email'),
              subtitle: const Text('dangdinhbao0318@gmail.com'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            Divider(color: context.colorScheme.secondary),
            ListTile(
              title: const Text('Date of birth'),
              subtitle: const Text('07/03/2003'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            Divider(color: context.colorScheme.secondary),
            ListTile(
              title: const Text('Gender'),
              subtitle: const Text('Male'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    padding: context.paddingLowVertical,
                    backgroundColor: context.colorScheme.secondary,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Save',
                    style: TextStyle(color: context.colorScheme.onSecondary),
                  ),
                ),
              ),
            ),
            context.sizedBoxHigh
          ],
        ),
      ),
    );
  }
}
