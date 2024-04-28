import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';

class ProductItem extends StatelessWidget {
  String title;
  String imagePath;

  ProductItem({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 238.h,
      width: 141.w,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          border: Border.all(color: AppColors.neutralLight),
          borderRadius: BorderRadius.circular(5)),
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                imagePath,
              ),
            ),
            Text(
              title,
              style: HeadingTextStyle.h6.copyWith(
                color: AppColors.neutralDark,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "\$299,43",
                style: BodyTextStyle.normalBold.copyWith(
                  color: AppColors.primaryBlue,
                ),
              ),
            ),
            Row(
              children: [
                Icon(Icons.star,size: 12,color: AppColors.primaryYellow,),
                Icon(Icons.star,size: 12,color: AppColors.primaryYellow,),
                Icon(Icons.star,size: 12,color: AppColors.primaryYellow,),
                Icon(Icons.star,size: 12,color: AppColors.primaryYellow,),
                Icon(Icons.star,size: 12,color: AppColors.primaryYellow,),
              ],
            ),
            Row(
              children: [
                Text(
                  "\$534,33",
                  style: CaptionTextStyle.normalRegular.copyWith(
                    color: AppColors.neutralGrey,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "24% Off",
                  style: CaptionTextStyle.normalBold.copyWith(
                    color: AppColors.primaryRed,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
