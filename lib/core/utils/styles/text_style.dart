// ignore_for_file: constant_identifier_names

import 'package:auth_task/core/utils/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle textStyle24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const TextStyle textStyle45 = TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const TextStyle textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteTextColor,
  );

  static const TextStyle textStyle15 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );
  static const TextStyle textStyle14 = TextStyle(
    fontSize: 14,
    color: AppColors.whiteTextColor,
  );

  static const TextStyle textStyle12 = TextStyle(
    fontSize: 12,
    color: AppColors.hintTextColor,
  );

  static const TextStyle textStyle16 = TextStyle(
    color: AppColors.whiteTextColor,
    fontSize: 16,
  );

  static const TextStyle textStyle16_bold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const TextStyle textStyle16_UnderLine = TextStyle(
    fontSize: 16,
    color: AppColors.buttonColor,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.buttonColor,
    decorationThickness: 2,
  );

  static const TextStyle textStyleLineThrough12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: AppColors.hintTextColor,
    decoration: TextDecoration.lineThrough,
    decorationColor: AppColors.hintTextColor,
    decorationThickness: 2,
  );
}
