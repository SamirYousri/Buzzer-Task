import 'package:auth_task/core/utils/styles/app_colors.dart';
import 'package:auth_task/core/utils/styles/text_style.dart';
import 'package:flutter/material.dart';

class ItemProduct extends StatelessWidget {
  const ItemProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/productDetails');
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: 190,
              decoration: BoxDecoration(
                color: AppColors.whiteTextColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.hintTextColor),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 10,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customStar(),
                        Text(
                          'Featured',
                          style: AppTextStyles.textStyle12
                              .copyWith(color: AppColors.textColor),
                        )
                      ],
                    ),
                    Text('Butter Sandwish',
                        style: AppTextStyles.textStyle16_bold),
                    Text(
                      'Par Lane Hotle',
                      style: AppTextStyles.textStyle14
                          .copyWith(color: AppColors.hintTextColor),
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Text(
                          'Resturant',
                          style: AppTextStyles.textStyle14
                              .copyWith(color: AppColors.redColor),
                        ),
                        Spacer(),
                        Text(
                          'SAR 89',
                          style: AppTextStyles.textStyleLineThrough12,
                        ),
                        Text(
                          'SAR 79',
                          style: AppTextStyles.textStyle12.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -100,
              right: 0,
              left: 0,
              child: Image.asset(
                'assets/images/Mask group.png',
              ),
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
