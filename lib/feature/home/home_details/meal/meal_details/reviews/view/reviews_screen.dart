import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/feature/home/home_details/meal/controller/meal_controller.dart';
import 'package:getx_architecture_template/feature/home/home_details/meal/meal_details/reviews/controller/reviews_controller.dart';

class ReviewsScreen extends GetView<ReviewsController> {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Puanlama kısmı
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const Text(
                    '4.8',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 32),
                      Icon(Icons.star, color: Colors.amber, size: 32),
                      Icon(Icons.star, color: Colors.amber, size: 32),
                      Icon(Icons.star, color: Colors.amber, size: 32),
                      Icon(Icons.star_half, color: Colors.amber, size: 32),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '(7 Reviews)',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  // Yıldız dağılımı
                  _buildRatingBar(5, 80),
                  _buildRatingBar(4, 60),
                  _buildRatingBar(3, 30),
                  _buildRatingBar(2, 15),
                  _buildRatingBar(1, 10),
                ],
              ),
            ),
          ),
          // Filtre ve sıralama kısmı
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                _buildDropdownButton(),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () {
                    // Sıralama işlevi
                  },
                  icon: const Icon(Icons.sort),
                  label: const Text('Arrange'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Yorumlar Listesi
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    _buildReviewItem(),
                    const SizedBox(height: 16),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBar(int rating, double percentage) {
    return Row(
      children: [
        Text(rating.toString(), style: const TextStyle(fontSize: 16)),
        const SizedBox(width: 4),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: LinearProgressIndicator(
              value: percentage / 100,
              backgroundColor: Colors.grey.shade300,
              color: const Color(0xffF87146),
              minHeight: 8,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownButton() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: 'Star',
        onChanged: (value) {},
        items: const [
          DropdownMenuItem(value: 'Star', child: Text('Star')),
          DropdownMenuItem(value: 'Date', child: Text('Date')),
        ],
        icon: const Icon(Icons.star, color: Colors.amber),
      ),
    );
  }

  Widget _buildReviewItem() {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.account_circle, size: 40, color: Colors.redAccent),
              SizedBox(width: 8),
              Text('Alenzo Endera',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Spacer(),
              Text('03/09/2023',
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < 3 ? Icons.star : Icons.star_border,
                color: Colors.amber,
              );
            }),
          ),
          const SizedBox(height: 8),
          const Text(
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
            style: TextStyle(fontSize: 14),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
