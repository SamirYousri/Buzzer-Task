import 'package:auth_task/core/utils/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class ThemeManager {
  static ThemeData getAppTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.backGroundColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        backgroundColor: AppColors.primaryColor,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: AppColors.primaryColor),
      ),
    );
  }
}
