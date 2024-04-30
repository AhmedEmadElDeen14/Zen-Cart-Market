import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';

class FeedNotification extends StatelessWidget {
  const FeedNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          "Feed",
          style: HeadingTextStyle.h4.copyWith(color: AppColors.neutralDark),
        ),
        backgroundColor: AppColors.backgroundColor,
        iconTheme: IconThemeData(color: AppColors.neutralGrey),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.neutralGrey,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Image(
                      image: AssetImage(
                        "assets/images/image Product.png",
                      ),
                      height: 48.h,
                      width: 48.w,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "New Product",
                          style: HeadingTextStyle.h5.copyWith(
                            color: AppColors.neutralDark,
                          ),
                        ),
                        Text(
                          "Nike Air Zoom Pegasus 36 Miami - Special For your Activity",
                          style: BodyTextStyle.normalRegular.copyWith(
                            color: AppColors.neutralGrey,
                          ),
                        ),
                        Text(
                          "June 3, 2015 5:06 PM",
                          style: CaptionTextStyle.normalRegular.copyWith(
                            color: AppColors.neutralDark,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Image(
                      image: AssetImage(
                        "assets/images/image Product_3.png",
                      ),
                      height: 48.h,
                      width: 48.w,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Best Product",
                          style: HeadingTextStyle.h5.copyWith(
                            color: AppColors.neutralDark,
                          ),
                        ),
                        Text(
                          "Nike Air Zoom Pegasus 36 Miami - Special For your Activity",
                          style: BodyTextStyle.normalRegular.copyWith(
                            color: AppColors.neutralGrey,
                          ),
                        ),
                        Text(
                          "June 3, 2015 5:06 PM",
                          style: CaptionTextStyle.normalRegular.copyWith(
                            color: AppColors.neutralDark,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Image(
                      image: AssetImage(
                        "assets/images/image Product_5.png",
                      ),
                      height: 48.h,
                      width: 48.w,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "New Product",
                          style: HeadingTextStyle.h5.copyWith(
                            color: AppColors.neutralDark,
                          ),
                        ),
                        Text(
                          "Nike Air Zoom Pegasus 36 Miami - Special For your Activity",
                          style: BodyTextStyle.normalRegular.copyWith(
                            color: AppColors.neutralGrey,
                          ),
                        ),
                        Text(
                          "June 3, 2015 5:06 PM",
                          style: CaptionTextStyle.normalRegular.copyWith(
                            color: AppColors.neutralDark,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
