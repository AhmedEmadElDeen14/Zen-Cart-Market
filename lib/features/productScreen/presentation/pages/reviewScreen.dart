import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';
import 'package:zen_cart_market/features/home/presentation/widgets/productItem.dart';

import '../../../../config/routes/routes.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          "5 Review",
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
        padding: EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Image(
                        image:
                        AssetImage("assets/images/Profile Picture2.png"),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Laura Octavian",
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
                    "This is really amazing product, i like the design of product, I hope can buy it again!",
                    style: BodyTextStyle.normalRegular.copyWith(
                      color: AppColors.neutralGrey,
                    ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Image(
                        image:
                        AssetImage("assets/images/Profile Picture2.png"),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Laura Octavian",
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
                    "This is really amazing product, i like the design of product, I hope can buy it again!",
                    style: BodyTextStyle.normalRegular.copyWith(
                      color: AppColors.neutralGrey,
                    ),
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

              SizedBox(height: 25,),
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
                      "Write Review",
                      style: FormTextStyle.buttonText.copyWith(
                        color: AppColors.backgroundColor,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
