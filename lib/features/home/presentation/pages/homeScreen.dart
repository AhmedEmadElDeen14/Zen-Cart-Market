import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';
import 'package:badges/badges.dart' as badges;
import 'package:zen_cart_market/features/home/presentation/pages/tabs/accountTab.dart';
import 'package:zen_cart_market/features/home/presentation/pages/tabs/cartTab.dart';
import 'package:zen_cart_market/features/home/presentation/pages/tabs/explore.dart';
import 'package:zen_cart_market/features/home/presentation/pages/tabs/home.dart';
import 'package:zen_cart_market/features/home/presentation/pages/tabs/offerTab.dart';
import 'package:zen_cart_market/features/home/presentation/widgets/categoryItem.dart';
import 'package:zen_cart_market/features/home/presentation/widgets/productItem.dart';
import 'package:zen_cart_market/features/home/presentation/widgets/saleAds.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<AppLayout> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Container(
          height: 46.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.neutralLight)),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              prefixIcon: Icon(Icons.search, color: AppColors.primaryBlue),
              hintText: 'Search Product',
              hintStyle: BodyTextStyle.normalRegular.copyWith(
                color: AppColors.neutralGrey,
              ),
            ),
          ),
        ),
        actions: [
          InkWell(
            child: Icon(
              Icons.favorite_border,
              color: AppColors.neutralGrey,
              size: 28,
            ),
            onTap: () {},
          ),
          InkWell(
            child: badges.Badge(
              position: badges.BadgePosition.topEnd(top: -10, end: -8),
              badgeContent: Text(
                "2",
                style: BodyTextStyle.normalBold
                    .copyWith(color: AppColors.backgroundColor),
              ),
              child: Icon(
                Icons.notifications_none_rounded,
                color: AppColors.neutralGrey,
                size: 28,
              ),
            ),
            onTap: () {},
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: tabs[index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          showUnselectedLabels: true,
          backgroundColor: AppColors.backgroundColor,
          unselectedItemColor: AppColors.neutralGrey,
          selectedItemColor: AppColors.primaryBlue,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer_outlined),
              label: "Offer",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Account",
            ),
          ]),
    );
  }

  List<Widget> tabs=[
    HomeTab(),
    ExploreTab(),
    CartTab(),
    OfferTab(),
    AccountTab()
  ];

}
