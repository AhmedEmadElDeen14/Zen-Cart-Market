import 'package:flutter/material.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';
import 'package:zen_cart_market/features/home/presentation/widgets/productItem.dart';
import 'package:zen_cart_market/features/home/presentation/widgets/saleAds.dart';

class FlashSale extends StatelessWidget {
  const FlashSale({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          "Super Flash Sale",
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
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.search,
                color: AppColors.neutralGrey,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SaleAds(),
            SizedBox(
              height: 500,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: .7),
                children: [

                ],
              ),
            )
        
          ],
        ),
      ),
    );
  }
}
