// ignore_for_file: use_super_parameters

import 'package:auth_task/core/utils/styles/app_colors.dart';
import 'package:auth_task/core/utils/styles/text_style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final String? Function(String?)? validator;
  final bool obscureText;
  final VoidCallback? onIconPressed;
  final TextInputType? keyboardType;
  final bool? isEnabled;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.validator,
    this.obscureText = false,
    this.onIconPressed,
    this.keyboardType,
    this.isEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        enabled: isEnabled,
        style: TextStyle(color: AppColors.whiteTextColor),
        keyboardType: keyboardType,
        cursorColor: AppColors.whiteTextColor,
        validator: validator,
        controller: controller,
        obscureText: isPassword ? obscureText : false,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.whiteTextColor,
            ),
          ),
          hintText: hintText,
          hintStyle: AppTextStyles.textStyle14,
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: onIconPressed,
                )
              : null,
        ),
      ),
    );
  }
}
