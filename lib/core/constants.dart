import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF6C63FF); // اللون الأساسي
  static const Color textColor = Colors.black;
  static const Color hintTextColor = Colors.grey;
}

class AppTextStyles {
  static const TextStyle headingStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const TextStyle hintStyle = TextStyle(
    color: AppColors.hintTextColor,
    fontSize: 16,
  );
}
