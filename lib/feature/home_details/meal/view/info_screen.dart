import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home_details/meal/controller/meal_controller.dart';

class InfoScreen extends GetView<MealController> {
  const InfoScreen({super.key});

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
          'Restaurant information',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //harita görüntüsü
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 130,
                width: double.infinity,
                color: Colors.grey,
                child: const Center(child: Icon(Icons.home, size: 50)),
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 8),
                Text('NYC, Broadway ave 79',
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
              ],
            ),
            const Divider(height: 32),
            const Text('About us',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad. ',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'See more...',
                style: TextStyle(color: Color(0xffF87146)),
              ),
            ),
            const Divider(height: 32),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Monday-Friday', style: TextStyle(fontSize: 16)),
                Text('10:00 - 22.00',
                    style: TextStyle(fontSize: 16, color: Color(0xffF87146))),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Saturday-Sunday', style: TextStyle(fontSize: 16)),
                Text('12:00 - 20.00',
                    style: TextStyle(fontSize: 16, color: Color(0xffF87146))),
              ],
            ),
            const Divider(height: 32),
            const Row(
              children: [
                Text('Phone number', style: TextStyle(fontSize: 16)),
                Spacer(),
                Text('056056591',
                    style: TextStyle(fontSize: 16, color: Color(0xffF87146))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
