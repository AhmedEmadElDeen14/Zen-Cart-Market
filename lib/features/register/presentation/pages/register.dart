import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zen_cart_market/config/routes/routes.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/app_images.dart';
import 'package:zen_cart_market/core/utils/styles.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image(image: AssetImage(AppImages.logoBlue)),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Let's Get Start",
                      style: HeadingTextStyle.h4
                          .copyWith(color: AppColors.neutralDark),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Create an new account",
                      style: BodyTextStyle.normalRegular
                          .copyWith(color: AppColors.neutralGrey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: AppColors.neutralGrey,
                          ),
                          hintText: "Full Name",
                          hintStyle: FormTextStyle.normal
                              .copyWith(color: AppColors.neutralGrey),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.primaryBlue),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.primaryRed,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.neutralLight),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: emailController,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: AppColors.neutralGrey,
                          ),
                          hintText: "Your Email",
                          hintStyle: FormTextStyle.normal
                              .copyWith(color: AppColors.neutralGrey),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.primaryBlue),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.primaryRed,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.neutralLight),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: AppColors.neutralGrey,
                          ),
                          hintText: "Password",
                          hintStyle: FormTextStyle.normal
                              .copyWith(color: AppColors.neutralGrey),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.primaryBlue),
                          ),
                          focusColor: AppColors.primaryBlue,
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.primaryRed,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.neutralLight),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: AppColors.neutralGrey,
                          ),
                          hintText: "Password Again",
                          hintStyle: FormTextStyle.normal
                              .copyWith(color: AppColors.neutralGrey),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.primaryBlue),
                          ),
                          focusColor: AppColors.primaryBlue,
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.primaryRed,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.neutralLight),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                          onPressed: () {},
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
                              "Sign Up",
                              style: FormTextStyle.buttonText.copyWith(
                                color: AppColors.backgroundColor,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "have a account? ",
                      style: FormTextStyle.normal,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.login);
                      },
                      child: Text("Sign In",
                          style: LinkTextStyle.normal
                              .copyWith(color: AppColors.primaryBlue)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
