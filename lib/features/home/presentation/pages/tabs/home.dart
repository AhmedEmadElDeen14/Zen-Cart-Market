import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zen_cart_market/config/routes/routes.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';
import 'package:zen_cart_market/features/home/presentation/widgets/categoryItem.dart';
import 'package:zen_cart_market/features/home/presentation/widgets/productItem.dart';
import 'package:zen_cart_market/features/home/presentation/widgets/saleAds.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = CarouselController();

    return Container(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    initialPage: currentPage,
                    onPageChanged: (index, reason) =>
                        setState(() => currentPage = index),
                  ),
                  carouselController: carouselController,
                  items: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.flashSale);
                      },
                      child: SaleAds(),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.flashSale);
                      },
                      child: SaleAds(),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.flashSale);
                      },
                      child: SaleAds(),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.flashSale);
                      },
                      child: SaleAds(),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.flashSale);
                      },
                      child: SaleAds(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SmoothPageIndicator(
                    controller: PageController(initialPage: currentPage),
                    count: 5,
                    effect: SlideEffect(
                      activeDotColor: AppColors.primaryBlue,
                      dotColor: AppColors.neutralLight,
                      dotHeight: 8,
                      dotWidth: 8,
                    ),
                    onDotClicked: (index) {}),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Category",
                      style: HeadingTextStyle.h5
                          .copyWith(color: AppColors.neutralDark),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "More Category",
                        style: HeadingTextStyle.h5
                            .copyWith(color: AppColors.primaryBlue),
                      ),
                    )
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryItem(
                        title: "Man Shirt",
                        imagePath: "assets/images/manShirt.png",
                      ),
                      CategoryItem(
                        title: "Dress",
                        imagePath: "assets/images/Dress.png",
                      ),
                      CategoryItem(
                        title: "Man Work Equipment",
                        imagePath: "assets/images/Man Work Equipment.png",
                      ),
                      CategoryItem(
                        title: "Woman Bag",
                        imagePath: "assets/images/Woman Bag.png",
                      ),
                      CategoryItem(
                        title: "Man Shoes",
                        imagePath: "assets/images/Man Shoes.png",
                      ),
                      CategoryItem(
                        title: "High Heels",
                        imagePath: "assets/images/High Heels.png",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Flash Sale",
                      style: HeadingTextStyle.h5
                          .copyWith(color: AppColors.neutralDark),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "See More",
                        style: HeadingTextStyle.h5
                            .copyWith(color: AppColors.primaryBlue),
                      ),
                    )
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ProductItem(
                        title: "FS - Nike Air Max 270 React...",
                        imagePath: "assets/images/image Product.png",
                      ),
                      ProductItem(
                        title: "FS - QUILTED MAXI CROS...",
                        imagePath: "assets/images/image Product_2.png",
                      ),
                      ProductItem(
                        title: "FS - Nike Air Max 270 React...",
                        imagePath: "assets/images/image Product_3.png",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mega Sale",
                      style: HeadingTextStyle.h5
                          .copyWith(color: AppColors.neutralDark),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "See More",
                        style: HeadingTextStyle.h5
                            .copyWith(color: AppColors.primaryBlue),
                      ),
                    )
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ProductItem(
                        title: "MS - Nike Air Max 270 React...",
                        imagePath: "assets/images/image Product_4.png",
                      ),
                      ProductItem(
                        title: "MS - Nike Air Max 270 React...",
                        imagePath: "assets/images/image Product_5.png",
                      ),
                      ProductItem(
                        title: "MS - Nike Air Max 270 React...",
                        imagePath: "assets/images/image Product_6.png",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                width: 343.w,
                height: 206.h,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/recomended.png"),
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
                            "Recomended Product",
                            style: HeadingTextStyle.h2.copyWith(
                              color: AppColors.backgroundColor,
                            ),
                          ),
                          Text(
                            "We recommend the best for you",
                            style: BodyTextStyle.normalRegular.copyWith(
                              color: AppColors.backgroundColor,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 500,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: .7),
                children: [
                  ProductItem(
                    title: "Nike Air Max 270 React ENG",
                    imagePath: "assets/images/image Product_3.png",
                  ),
                  ProductItem(
                    title: "Nike Air Max 270 React ENG",
                    imagePath: "assets/images/image Product_4.png",
                  ),
                  ProductItem(
                    title: "Nike Air Max 270 React ENG",
                    imagePath: "assets/images/image Product_5.png",
                  ),
                  ProductItem(
                    title: "MNike Air Max 270 React ENG",
                    imagePath: "assets/images/image Product_6.png",
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
