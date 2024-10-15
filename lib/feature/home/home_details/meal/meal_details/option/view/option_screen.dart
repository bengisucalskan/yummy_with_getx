import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/constants/routes/navigation_constants.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';
import 'package:getx_architecture_template/feature/home/home_details/meal/meal_details/option/controller/option_controller.dart';
import 'package:getx_architecture_template/feature/home/model/meal.dart';
import 'package:getx_architecture_template/product/widget/appbar.dart';
import 'package:getx_architecture_template/product/widget/circle_progresbar.dart';

// ignore: public_member_api_docs
class OptionScreen extends GetView<OptionController> {
  const OptionScreen({required this.id, super.key});
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Option',
          onBackPressed: Get.back,
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const CircleProgressBarLoading();
          } else {
            final meal = controller.mealsById.first;
            return SingleChildScrollView(
              child: Padding(
                padding: context.paddingNormalHorizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProductImage(meal),
                    context.sizedBoxlow,
                    _buildProductInfo(context, meal),
                    context.sizedBoxMedium,
                    _buildQuantitySelector(),
                    Divider(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    _buildSizeSelector(context),
                    _buildToppingSelector(context, meal),
                    _buildNotesSection(context),
                    _buildAddToCartButton(context, meal),
                  ],
                ),
              ),
            );
          }
        }));
  }

  Widget _buildProductImage(Meals meal) {
    return Container(
      height: 200, // köşeye sıfırla bi ara
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(meal.strMealThumb ?? ''),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProductInfo(BuildContext context, Meals meal) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                meal.strMeal ?? '',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
        context.sizedBoxlow,
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Read more',
            style: TextStyle(color: Theme.of(context).colorScheme.onTertiary),
          ),
        ),
      ],
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Quantity',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Obx(() => Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    controller.decreaseQuantity();
                  },
                ),
                Text(
                  '${controller.quantity.value}',
                  style: const TextStyle(fontSize: 16),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    controller.increaseQuantity();
                  },
                ),
              ],
            )),
      ],
    );
  }

  Widget _buildSizeSelector(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Size',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                _buildChoiceChip('S', context),
                _buildChoiceChip('L', context),
                _buildChoiceChip('XL', context),
              ],
            ),
          ],
        ),
        context.sizedBoxMedium,
      ],
    );
  }

  Widget _buildChoiceChip(String size, BuildContext context) {
    return Obx(() {
      final isSelected = controller.selectedSize.value == size;
      return ChoiceChip(
        label: Text(size),
        selected: isSelected,
        onSelected: (bool selected) {
          if (selected) {
            controller.selectSize(size);
          }
        },
        selectedColor: Theme.of(context).colorScheme.tertiary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        labelStyle: TextStyle(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.tertiary,
        ),
        checkmarkColor: context.colorScheme.primary,
      );
    });
  }

  Widget _buildToppingSelector(BuildContext context, Meals meal) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Topping',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        _buildToppingItem('${meal.strIngredient1}', 3, context),
        Divider(
          color: Theme.of(context).colorScheme.secondary,
        ),
        _buildToppingItem('${meal.strIngredient2}', 3.02, context),
        Divider(
          color: Theme.of(context).colorScheme.secondary,
        ),
        _buildToppingItem('${meal.strIngredient3}', 3, context),
        Divider(
          color: Theme.of(context).colorScheme.secondary,
        ),
        _buildToppingItem('${meal.strIngredient4}', 2, context),
        Divider(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ],
    );
  }

  Widget _buildToppingItem(
    String title,
    double price,
    BuildContext context,
  ) {
    return Padding(
      padding: context.paddingLowVertical,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {},
              ),
              const Text('1x'),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
              ),
            ],
          ),
          Text(title),
          Text('\$$price'),
        ],
      ),
    );
  }

  Widget _buildNotesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Notes', style: TextStyle(fontSize: 16)),
        context.sizedBoxlow,
        TextField(
          decoration: InputDecoration(
            hintText: 'Do you have something to say to the restaurant?',
            hintStyle:
                TextStyle(color: Theme.of(context).colorScheme.secondary),
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
                vertical: 40.0,
                horizontal: 10), // bunu theme dönüştürmek için bak
          ),
        ),
      ],
    );
  }

  Widget _buildAddToCartButton(BuildContext context, Meals meal) {
    return Padding(
      padding: context.paddingNormalVertical,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            controller.addToCart(meal);

            Get.toNamed(Routes.CART);
          },
          style: ElevatedButton.styleFrom(
            padding: context.paddingNormalVertical,
            backgroundColor: Theme.of(context).colorScheme.onTertiary,
            minimumSize: const Size(300, 40),
            textStyle: const TextStyle(fontSize: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(r'Add to Cart - $23'),
        ),
      ),
    );
  }
}
