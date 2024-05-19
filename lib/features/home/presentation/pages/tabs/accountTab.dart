import 'package:flutter/material.dart';
import 'package:zen_cart_market/config/routes/routes.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account",
          style: HeadingTextStyle.h3.copyWith(
            color: AppColors.neutralDark,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.profileScreen);
              },
              child: Container(
                padding: EdgeInsets.all(25),
                child: Row(
                  children: [
                    Image(image: AssetImage("assets/images/profile_icon.png")),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Profile",
                      style: HeadingTextStyle.h4.copyWith(
                        color: AppColors.neutralDark,
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(25),
                child: Row(
                  children: [
                    Image(image: AssetImage("assets/images/order_icon.png")),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Order",
                      style: HeadingTextStyle.h4.copyWith(
                        color: AppColors.neutralDark,
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(25),
                child: Row(
                  children: [
                    Image(image: AssetImage("assets/images/address_icon.png")),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Address",
                      style: HeadingTextStyle.h4.copyWith(
                        color: AppColors.neutralDark,
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(25),
                child: Row(
                  children: [
                    Image(image: AssetImage("assets/images/payment_icon.png")),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Payment",
                      style: HeadingTextStyle.h4.copyWith(
                        color: AppColors.neutralDark,
                      ),
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
