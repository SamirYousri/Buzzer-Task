import 'package:auth_task/core/utils/styles/app_colors.dart';
import 'package:auth_task/views/widgets/custom_search_text_field.dart';
import 'package:auth_task/views/widgets/item_cafe.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        appBar(context),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(0),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
                child: ItemCafe(
                  onTap: () {
                    Navigator.pushNamed(context, '/supplierProducts');
                  },
                  image: 'assets/images/Rectangle 52 (1).png',
                  title: 'The Skye',
                  subTitle: 'Restaurant',
                  adress: 'Main Market Riyadh,KSA',
                ),
              );
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }

  Container appBar(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.2,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 25,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 20,
              children: [
                Icon(
                  Icons.list,
                  color: AppColors.whiteTextColor,
                  size: 25,
                ),
                Text(
                  'Buzzer App',
                  style: TextStyle(
                    color: AppColors.whiteTextColor,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            CustomSearchTextField()
          ],
        ),
      ),
    );
  }
}
