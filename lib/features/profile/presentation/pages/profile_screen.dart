import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zen_cart_market/config/routes/routes.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: HeadingTextStyle.h3.copyWith(
            color: AppColors.neutralDark,
          ),
        ),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.neutralGrey,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        shape: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.neutralLight,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.changeName);
                },
                child: Container(
                  child: Row(
                    children: [
                      ClipRect(
                        child: Image(
                          image: AssetImage("assets/images/Profile Picture.png"),
                          width: 72.w,
                          height: 72.h,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ahmed Emad",
                            style: HeadingTextStyle.h5.copyWith(
                              color: AppColors.neutralDark,
                            ),
                          ),
                          Text("@ahmed14",
                              style: BodyTextStyle.normalRegular.copyWith(
                                color: AppColors.neutralGrey,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.genderSelectionScreen);
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(
                              image:
                                  AssetImage("assets/images/gander_icon.png")),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Gender",
                            style: HeadingTextStyle.h4.copyWith(
                              color: AppColors.neutralDark,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Male",
                            style: BodyTextStyle.normalRegular.copyWith(
                              color: AppColors.neutralGrey,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Image(image: AssetImage("assets/images/Vector.png")),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.changeBirthdayScreen);
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(
                              image:
                                  AssetImage("assets/images/birthday_icon.png")),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Birthday",
                            style: HeadingTextStyle.h4.copyWith(
                              color: AppColors.neutralDark,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "12-12-2000",
                            style: BodyTextStyle.normalRegular.copyWith(
                              color: AppColors.neutralGrey,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Image(image: AssetImage("assets/images/Vector.png")),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(
                              image:
                                  AssetImage("assets/images/email_icon.png")),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Email",
                            style: HeadingTextStyle.h4.copyWith(
                              color: AppColors.neutralDark,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "ahmed@gmail.com",
                            style: BodyTextStyle.normalRegular.copyWith(
                              color: AppColors.neutralGrey,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Image(image: AssetImage("assets/images/Vector.png")),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(
                              image:
                                  AssetImage("assets/images/phone_icon.png")),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Phone Number",
                            style: HeadingTextStyle.h4.copyWith(
                              color: AppColors.neutralDark,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "01013020660",
                            style: BodyTextStyle.normalRegular.copyWith(
                              color: AppColors.neutralGrey,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Image(image: AssetImage("assets/images/Vector.png")),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(
                              image:
                                  AssetImage("assets/images/password_icon.png")),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Change Password",
                            style: HeadingTextStyle.h4.copyWith(
                              color: AppColors.neutralDark,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "•••••••••••••••••",
                            style: BodyTextStyle.normalRegular.copyWith(
                              color: AppColors.neutralGrey,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Image(image: AssetImage("assets/images/Vector.png")),
                        ],
                      )
                    ],
                  ),
                ),
              ),
                
            ],
          ),
        ),
      ),
    );
  }
}
