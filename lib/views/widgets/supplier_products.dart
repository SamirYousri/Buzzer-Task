import 'package:auth_task/core/utils/styles/app_colors.dart';
import 'package:auth_task/core/utils/styles/text_style.dart';
import 'package:auth_task/views/widgets/item_product.dart';
import 'package:flutter/material.dart';

class SupplierProducts extends StatelessWidget {
  const SupplierProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteTextColor,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Supplier Products',
          style: AppTextStyles.textStyle16,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.7,
          ),
          itemCount: 15,
          itemBuilder: (context, index) {
            return ItemProduct();
          },
        ),
      ),
    );
  }
}
