import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';

class SaleAds extends StatelessWidget {
  const SaleAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 343.w,
        height: 206.h,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Promotion Image.png"),
                    fit: BoxFit.fill),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: 225.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Super Flash Sale 50% Off",
                    style: HeadingTextStyle.h2.copyWith(
                      color: AppColors.backgroundColor,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            "08",
                            style: HeadingTextStyle.h4.copyWith(
                              color: AppColors.neutralDark,
                            ),
                          ),
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: AppColors.backgroundColor,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        Text(
                          ":",
                          style: BodyTextStyle.mediumBold.copyWith(
                            color: AppColors.backgroundColor,
                          ),
                        ),
                        Container(
                          child: Text(
                            "34",
                            style: HeadingTextStyle.h4.copyWith(
                              color: AppColors.neutralDark,
                            ),
                          ),
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: AppColors.backgroundColor,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        Text(
                          ":",
                          style: BodyTextStyle.mediumBold.copyWith(
                            color: AppColors.backgroundColor,
                          ),
                        ),
                        Container(
                          child: Text(
                            "52",
                            style: HeadingTextStyle.h4.copyWith(
                              color: AppColors.neutralDark,
                            ),
                          ),
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: AppColors.backgroundColor,
                              borderRadius: BorderRadius.circular(5)),
                        ),


                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
