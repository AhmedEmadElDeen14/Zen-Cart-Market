import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zen_cart_market/config/routes/routes.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          "Notification",
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
      body: Container(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.offerNotification);
              },
              child: Container(
                padding: EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.local_offer_outlined,
                          color: AppColors.primaryBlue,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Offer",
                          style: HeadingTextStyle.h6.copyWith(
                            color: AppColors.neutralDark,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: AppColors.primaryRed,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                          child: Text(
                        "2",
                        style: CaptionTextStyle.normalBold
                            .copyWith(color: Colors.white),
                      )),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.feedNotification);
              },
              child: Container(
                padding: EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.feed_outlined,
                          color: AppColors.primaryBlue,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Feed",
                          style: HeadingTextStyle.h6.copyWith(
                            color: AppColors.neutralDark,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: AppColors.primaryRed,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                          child: Text(
                        "3",
                        style: CaptionTextStyle.normalBold
                            .copyWith(color: Colors.white),
                      )),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.activityNotification);
              },
              child: Container(
                padding: EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.notifications_none_rounded,
                          color: AppColors.primaryBlue,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Acivity",
                          style: HeadingTextStyle.h6.copyWith(
                            color: AppColors.neutralDark,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: AppColors.primaryRed,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                          child: Text(
                        "3",
                        style: CaptionTextStyle.normalBold
                            .copyWith(color: Colors.white),
                      )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
