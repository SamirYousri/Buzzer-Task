import 'package:auth_task/core/utils/styles/app_colors.dart';
import 'package:auth_task/core/utils/styles/text_style.dart';
import 'package:flutter/material.dart';

class ItemCustomer extends StatelessWidget {
  const ItemCustomer(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle});
  final String image;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image.asset(image),
          title: Text(
            title,
            style: AppTextStyles.textStyle14.copyWith(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            subTitle,
            style: AppTextStyles.textStyle12,
          ),
          trailing: SizedBox(width: 70, child: customStar()),
        ),
        Text(
            "Hotel Booking System is complete Hotel Booking IT Solution comes with Hotel Quotation Booking System for travel agent, tour operator and hotel chains to collect the inventory of hotels from multiple sources .",
            style:
                AppTextStyles.textStyle12.copyWith(color: AppColors.textColor)),
      ],
    );
  }

  Row customStar() {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star,
          color: index < 4 ? AppColors.buttonColor : AppColors.hintTextColor,
          size: 12,
        ),
      ),
    );
  }
}
