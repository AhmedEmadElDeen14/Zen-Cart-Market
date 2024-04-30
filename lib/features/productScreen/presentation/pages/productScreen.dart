import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zen_cart_market/config/routes/routes.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';
import 'package:zen_cart_market/features/home/presentation/widgets/productItem.dart';
import 'package:zen_cart_market/features/productScreen/presentation/widgets/colorButton.dart';
import 'package:zen_cart_market/features/productScreen/presentation/widgets/sizeButton.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = CarouselController();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          "Nike Air Max 270 Rea...",
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
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.search,
              color: AppColors.neutralGrey,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.more_vert,
                color: AppColors.neutralGrey,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    initialPage: currentImage,
                    onPageChanged: (index, reason) =>
                        setState(() => currentImage = index),
                  ),
                  carouselController: carouselController,
                  items: [
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/ProductScreen Image.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Image(
                          image: AssetImage(
                              "assets/images/ProductScreen Image.png")),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/ProductScreen Image.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Image(
                          image: AssetImage(
                              "assets/images/ProductScreen Image.png")),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/ProductScreen Image.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Image(
                          image: AssetImage(
                              "assets/images/ProductScreen Image.png")),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/ProductScreen Image.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Image(
                          image: AssetImage(
                              "assets/images/ProductScreen Image.png")),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/ProductScreen Image.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Image(
                          image: AssetImage(
                              "assets/images/ProductScreen Image.png")),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SmoothPageIndicator(
                    controller: PageController(initialPage: currentImage),
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
            Container(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Nike Air Zoom Pegasus 36 Miami",
                          style: HeadingTextStyle.h3.copyWith(
                            color: AppColors.neutralDark,
                          ),
                        ),
                      ),
                      InkWell(
                        child: Icon(
                          Icons.favorite_border,
                          color: AppColors.neutralGrey,
                          size: 28,
                        ),
                        onTap: () {},
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        size: 25,
                        color: AppColors.primaryYellow,
                      ),
                      Icon(
                        Icons.star_rate_rounded,
                        size: 25,
                        color: AppColors.primaryYellow,
                      ),
                      Icon(
                        Icons.star_rate_rounded,
                        size: 25,
                        color: AppColors.primaryYellow,
                      ),
                      Icon(
                        Icons.star_rate_rounded,
                        size: 25,
                        color: AppColors.primaryYellow,
                      ),
                      Icon(
                        Icons.star_rate_rounded,
                        size: 25,
                        color: AppColors.neutralLight,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "\$299.43",
                    style: HeadingTextStyle.h3.copyWith(
                      color: AppColors.primaryBlue,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Select Size",
                    style: HeadingTextStyle.h5.copyWith(
                      color: AppColors.neutralDark,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizeButton(
                          size: "6",
                        ),
                        SizeButton(
                          size: "6.5",
                        ),
                        SizeButton(
                          size: "7.5",
                        ),
                        SizeButton(
                          size: "8",
                        ),
                        SizeButton(
                          size: "8.5",
                        ),
                        SizeButton(
                          size: "9",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Select Color",
                    style: HeadingTextStyle.h5.copyWith(
                      color: AppColors.neutralDark,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ColorButton(color: AppColors.primaryYellow),
                        ColorButton(
                          color: AppColors.primaryBlue,
                        ),
                        ColorButton(
                          color: AppColors.primaryRed,
                        ),
                        ColorButton(
                          color: AppColors.primaryGreen,
                        ),
                        ColorButton(
                          color: AppColors.primaryPurple,
                        ),
                        ColorButton(
                          color: AppColors.neutralDark,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Specification",
                        style: HeadingTextStyle.h5.copyWith(
                          color: AppColors.neutralDark,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Shown:",
                            style: BodyTextStyle.normalRegular.copyWith(
                              color: AppColors.neutralDark,
                            ),
                          ),
                          Text(
                            """Laser
                           Blue/Anthracite/Watermel
                           on/White""",
                            style: BodyTextStyle.normalRegular.copyWith(
                              color: AppColors.neutralGrey,
                            ),
                            textAlign: TextAlign.right,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Style:",
                            style: BodyTextStyle.normalRegular.copyWith(
                              color: AppColors.neutralDark,
                            ),
                          ),
                          Text(
                            "CD0113-400",
                            style: BodyTextStyle.normalRegular.copyWith(
                              color: AppColors.neutralGrey,
                            ),
                            textAlign: TextAlign.right,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "The Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience.",
                        style: BodyTextStyle.normalRegular.copyWith(
                          color: AppColors.neutralGrey,
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Review Product",
                            style: HeadingTextStyle.h5
                                .copyWith(color: AppColors.neutralDark),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, RoutesName.reviewScreen);
                            },
                            child: Text(
                              "See More",
                              style: HeadingTextStyle.h5
                                  .copyWith(color: AppColors.primaryBlue),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rate_rounded,
                            size: 25,
                            color: AppColors.primaryYellow,
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            size: 25,
                            color: AppColors.primaryYellow,
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            size: 25,
                            color: AppColors.primaryYellow,
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            size: 25,
                            color: AppColors.primaryYellow,
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            size: 25,
                            color: AppColors.neutralLight,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "4.5 ",
                            style: CaptionTextStyle.normalBold.copyWith(
                              color: AppColors.neutralGrey,
                            ),
                          ),
                          Text(
                            "(5 Review)",
                            style: CaptionTextStyle.normalRegular.copyWith(
                              color: AppColors.neutralGrey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Image(
                            image:
                                AssetImage("assets/images/Profile Picture.png"),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "James Lawson",
                                style: HeadingTextStyle.h5.copyWith(
                                  color: AppColors.neutralDark,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_rate_rounded,
                                    size: 20,
                                    color: AppColors.primaryYellow,
                                  ),
                                  Icon(
                                    Icons.star_rate_rounded,
                                    size: 20,
                                    color: AppColors.primaryYellow,
                                  ),
                                  Icon(
                                    Icons.star_rate_rounded,
                                    size: 20,
                                    color: AppColors.primaryYellow,
                                  ),
                                  Icon(
                                    Icons.star_rate_rounded,
                                    size: 20,
                                    color: AppColors.primaryYellow,
                                  ),
                                  Icon(
                                    Icons.star_rate_rounded,
                                    size: 20,
                                    color: AppColors.neutralLight,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.",
                        style: BodyTextStyle.normalRegular.copyWith(
                          color: AppColors.neutralGrey,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 15, top: 10),
                            child: Image(
                              image: AssetImage(
                                  "assets/images/Product Picture01.png"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 15, top: 10),
                            child: Image(
                              image: AssetImage(
                                  "assets/images/Product Picture02.png"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 15, top: 10),
                            child: Image(
                              image: AssetImage(
                                  "assets/images/Product Picture03.png"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "December 10, 2016",
                        style: CaptionTextStyle.normalRegular.copyWith(
                          color: AppColors.neutralGrey,
                        ),
                        textAlign: TextAlign.left,
                      )
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
                            "You Might Also Like",
                            style: HeadingTextStyle.h5
                                .copyWith(color: AppColors.neutralDark),
                          ),
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
                  ElevatedButton(
                      onPressed: () {

                      },
                      style: ButtonStyle(
                          alignment: Alignment.center,
                          elevation: MaterialStatePropertyAll(0),
                          backgroundColor: MaterialStatePropertyAll(
                              AppColors.primaryBlue),
                          shape: MaterialStatePropertyAll(
                              ContinuousRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(15)))),
                      child: Container(
                        alignment: Alignment.center,
                        height: 57.h,
                        width: 343.w,
                        child: Text(
                          "Add To Cart",
                          style: FormTextStyle.buttonText.copyWith(
                            color: AppColors.backgroundColor,
                          ),
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
