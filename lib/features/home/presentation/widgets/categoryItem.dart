import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';

class CategoryItem extends StatelessWidget {
  String title;
  String imagePath;

  CategoryItem({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 108.h,
        width: 70.w,
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 70.w,
              height: 70.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: AppColors.neutralLight)),
              child: Image(
                image: AssetImage(imagePath),
              ),
            ),
            Text(
              title,
              style: CaptionTextStyle.normalRegular
                  .copyWith(color: AppColors.neutralGrey),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
