import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';

class OfferNotification extends StatelessWidget {
  const OfferNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          "Offer",
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
                    child: Icon(
                      Icons.local_offer_outlined,
                      color: AppColors.primaryBlue,
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
                          "The Best Title",
                          style: HeadingTextStyle.h5.copyWith(
                            color: AppColors.neutralDark,
                          ),
                        ),
                        Text(
                          "Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo",
                          style: BodyTextStyle.normalRegular.copyWith(
                            color: AppColors.neutralGrey,
                          ),
                        ),
                        Text(
                          "April 30, 2014 1:01 PM",
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
                    child: Icon(
                      Icons.local_offer_outlined,
                      color: AppColors.primaryBlue,
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
                          "SUMMER OFFER 98% Cashback",
                          style: HeadingTextStyle.h5.copyWith(
                            color: AppColors.neutralDark,
                          ),
                        ),
                        Text(
                          "Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor",
                          style: BodyTextStyle.normalRegular.copyWith(
                            color: AppColors.neutralGrey,
                          ),
                        ),
                        Text(
                          "April 30, 2014 1:01 PM",
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
                    child: Icon(
                      Icons.local_offer_outlined,
                      color: AppColors.primaryBlue,
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
                          "Special Offer 25% OFF",
                          style: HeadingTextStyle.h5.copyWith(
                            color: AppColors.neutralDark,
                          ),
                        ),
                        Text(
                          "Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo",
                          style: BodyTextStyle.normalRegular.copyWith(
                            color: AppColors.neutralGrey,
                          ),
                        ),
                        Text(
                          "April 30, 2014 1:01 PM",
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
