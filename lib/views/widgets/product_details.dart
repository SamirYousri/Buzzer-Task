// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:auth_task/core/utils/styles/app_colors.dart';
import 'package:auth_task/core/utils/styles/text_style.dart';
import 'package:auth_task/views/widgets/item_cafe.dart';
import 'package:auth_task/views/widgets/item_customer.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  productDetails(),
                  const Divider(thickness: 2),
                  supplierSection(),
                  const Divider(thickness: 2),
                  descriptionSection(),
                  const Divider(thickness: 2),
                  customerReviewsSection(),
                ],
              ),
            ),
          ),
          bottomBar(),
        ],
      ),
    );
  }

  Column productDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/images/Mask group (1).png'),
        const SizedBox(height: 8),
        customStar(),
        const SizedBox(height: 8),
        Text(
          'Butter Sandwish',
          style: AppTextStyles.textStyle20.copyWith(color: AppColors.textColor),
        ),
        Row(
          children: [
            Text(
              'SAR 79',
              style: AppTextStyles.textStyle16_bold
                  .copyWith(color: AppColors.primaryColor),
            ),
            const SizedBox(width: 5),
            Text(
              'SAR 89',
              style: AppTextStyles.textStyleLineThrough12,
            ),
          ],
        ),
      ],
    );
  }

  AppBar getAppBar() {
    return AppBar(
      foregroundColor: AppColors.whiteTextColor,
      backgroundColor: AppColors.primaryColor,
      title: Text(
        'Supplier Products',
        style: AppTextStyles.textStyle16,
      ),
    );
  }

  Widget customStar() {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star,
          color: index < 4 ? AppColors.buttonColor : AppColors.hintTextColor,
          size: 25,
        ),
      ),
    );
  }

  Widget supplierSection() {
    return Column(
      spacing: 10,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Supplier',
              style: AppTextStyles.textStyle20
                  .copyWith(color: AppColors.textColor),
            ),
            Text(
              'Rate Supplier',
              style: AppTextStyles.textStyle16_UnderLine,
            ),
          ],
        ),
        ItemCafe(
          image: 'assets/images/Rectangle 52 (1).png',
          title: 'The Skye',
          subTitle: 'Restaurant',
          adress: 'Main Market Riyadh, KSA',
        ),
      ],
    );
  }

  Widget descriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          'Description',
          style: AppTextStyles.textStyle20.copyWith(color: AppColors.textColor),
        ),
        Text(
          "Serving French cuisine and owned by the Comisar family and located since 1966 at 114 E. 6th Street in Cincinnati, Ohio, The move also means the end of La Normandie restaurant, a tavern and chophouse below the Maisonette. One of Cincinnati's most celebrated restaurants, the Maisonette earned the Mobil Travel Guide's five-star rating for 41 consecutive years. the Maisonette received the five-star ...  ",
          style: AppTextStyles.textStyle12,
        ),
      ],
    );
  }

  Widget customerReviewsSection() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Customer Reviews',
            style:
                AppTextStyles.textStyle20.copyWith(color: AppColors.textColor),
          ),
          ItemCustomer(
            image: 'assets/images/Ellipse 19.png',
            title: 'Linda',
            subTitle: 'Jun 28, 2021',
          ),
          const Divider(thickness: 2),
          ItemCustomer(
            image: 'assets/images/Ellipse 19.png',
            title: 'Linda',
            subTitle: 'Jun 28, 2021',
          ),
        ],
      ),
    );
  }

  Widget bottomBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            quantityButton(Icons.remove, () {
              if (quantity > 0) {
                setState(() {
                  quantity--;
                });
              }
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '$quantity',
                style: AppTextStyles.textStyle16_bold,
              ),
            ),
            quantityButton(Icons.add, () {
              setState(() {
                quantity++;
              });
            }),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'ADD TO BASKET',
                  style: AppTextStyles.textStyle16.copyWith(
                    color: AppColors.textColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget quantityButton(IconData icon, VoidCallback onPressed) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.hintTextColor),
        color: icon == Icons.add ? AppColors.textColor : Colors.white,
      ),
      child: Center(
        child: IconButton(
          icon: Icon(
            icon,
            color: icon == Icons.add
                ? AppColors.whiteTextColor
                : AppColors.textColor,
            size: 20,
          ),
          padding: EdgeInsets.zero,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
