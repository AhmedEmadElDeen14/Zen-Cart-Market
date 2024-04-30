import 'package:flutter/material.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';
import 'package:zen_cart_market/features/home/presentation/widgets/productItem.dart';
import 'package:zen_cart_market/features/home/presentation/widgets/saleAds.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          "Favorite Product",
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
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height*1,
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: .7),
            children: [
              ProductItem(
                title: "Nike Air Max 270 React ENG",
                imagePath: "assets/images/image Product_3.png",
                checkDelete: true,
              ),
              ProductItem(
                title: "Nike Air Max 270 React ENG",
                imagePath: "assets/images/image Product_4.png",
                checkDelete: true,
              ),
              ProductItem(
                title: "Nike Air Max 270 React ENG",
                imagePath: "assets/images/image Product_5.png",
                checkDelete: true,
              ),
              ProductItem(
                title: "MNike Air Max 270 React ENG",
                imagePath: "assets/images/image Product_6.png",
                checkDelete: true,
              ),
              ProductItem(
                title: "Nike Air Max 270 React ENG",
                imagePath: "assets/images/image Product_3.png",
                checkDelete: true,
              ),
              ProductItem(
                title: "Nike Air Max 270 React ENG",
                imagePath: "assets/images/image Product_4.png",
                checkDelete: true,
              ),
              ProductItem(
                title: "Nike Air Max 270 React ENG",
                imagePath: "assets/images/image Product_5.png",
                checkDelete: true,
              ),
              ProductItem(
                title: "MNike Air Max 270 React ENG",
                imagePath: "assets/images/image Product_6.png",
                checkDelete: true,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
