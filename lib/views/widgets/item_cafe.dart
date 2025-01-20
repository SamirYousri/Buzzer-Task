import 'package:auth_task/core/utils/styles/app_colors.dart';
import 'package:auth_task/core/utils/styles/text_style.dart';
import 'package:flutter/material.dart';

class ItemCafe extends StatelessWidget {
  const ItemCafe(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.adress,
      this.onTap,
      required this.image});
  final String image;
  final String title;
  final String subTitle;
  final String adress;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: onTap != null ? null : 90,
        decoration: BoxDecoration(
            border: onTap != null
                ? Border.all(color: AppColors.hintTextColor)
                : null,
            color: onTap != null ? AppColors.whiteTextColor : null,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          spacing: 15,
          children: [
            Image.asset(image),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customStar(),
                Text(
                  title,
                  style: AppTextStyles.textStyle20
                      .copyWith(color: AppColors.textColor),
                ),
                Text(
                  subTitle,
                  style: AppTextStyles.textStyle14
                      .copyWith(color: AppColors.redColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppColors.primaryColor,
                      size: 20,
                    ),
                    Text(
                      adress,
                      style: AppTextStyles.textStyle12,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
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
