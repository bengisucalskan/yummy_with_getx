import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/feature/home/home_details/meal/meal_details/reviews/controller/reviews_controller.dart';
import 'package:getx_architecture_template/product/widget/appbar.dart';

class ReviewsScreen extends GetWidget<ReviewsController> {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Reviews',
        onBackPressed: () => Get.back(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Puanlama kısmı
          Padding(
            padding: context.paddingNormal,
            child: Container(
              padding: context.paddingNormal,
              decoration: BoxDecoration(
                color: const Color(0xffF2F2F2), // bi ara değiştir
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
                  context.sizedBoxlow,
                  Text(
                    '(7 Reviews)',
                    style: TextStyle(
                        fontSize: 16, color: context.colorScheme.secondary),
                  ),
                  context.sizedBoxMedium,
                  _buildRatingBar(5, 80, context),
                  _buildRatingBar(4, 60, context),
                  _buildRatingBar(3, 30, context),
                  _buildRatingBar(2, 15, context),
                  _buildRatingBar(1, 10, context),
                ],
              ),
            ),
          ),
          // Filtre ve sıralama kısmı
          Padding(
            padding: context.paddingNormalHorizontal,
            child: Row(
              children: [
                _buildDropdownButton(),
                context.sizedBoxlow,
                ElevatedButton.icon(
                  onPressed: () {
                    // Sıralama işlevi
                  },
                  icon: const Icon(Icons.sort),
                  label: const Text('Arrange'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.onSecondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
          context.sizedBoxMedium,
          // Yorumlar Listesi
          Expanded(
            child: ListView.builder(
              padding: context.paddingNormalHorizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    _buildReviewItem(
                        context), // context'i burada geçiriyoruz çünkü extensionları görmüyo
                    context.sizedBoxlow,
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBar(int rating, double percentage, BuildContext context) {
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
              color: Theme.of(context).colorScheme.onTertiary,
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

  Widget _buildReviewItem(BuildContext context) {
    return Container(
      padding: context.paddingNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.account_circle,
                  size: 40, color: context.colorScheme.onTertiary),
              context.sizedBoxlow,
              const Text(
                'Alenzo Endera',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                '03/09/2023',
                style: TextStyle(
                    fontSize: 14, color: context.colorScheme.secondary),
              ),
            ],
          ),
          context.sizedBoxlow,
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < 3 ? Icons.star : Icons.star_border,
                color: Colors.amber,
              );
            }),
          ),
          context.sizedBoxlow,
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
