import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';

class ChangeName extends StatelessWidget {
  ChangeName({super.key});

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Name",
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
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height*.84,
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "First Name",
                          style: HeadingTextStyle.h4.copyWith(
                            color: AppColors.neutralDark,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: firstNameController,
                          decoration: InputDecoration(

                            hintText: "Ahmed",
                            hintStyle: FormTextStyle.normal
                                .copyWith(color: AppColors.neutralGrey),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.primaryBlue),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.primaryRed,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.neutralLight),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Last Name",
                          style: HeadingTextStyle.h4.copyWith(
                            color: AppColors.neutralDark,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: lastNameController,
                          decoration: InputDecoration(
                            hintText: "Emad",
                            hintStyle: FormTextStyle.normal
                                .copyWith(color: AppColors.neutralGrey),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.primaryBlue),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.primaryRed,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.neutralLight),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            alignment: Alignment.center,
                            elevation: MaterialStatePropertyAll(0),
                            backgroundColor:
                                MaterialStatePropertyAll(AppColors.primaryBlue),
                            shape: MaterialStatePropertyAll(
                                ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)))),
                        child: Container(
                          alignment: Alignment.center,
                          height: 57.h,
                          width: 343.w,
                          child: Text(
                            "Save",
                            style: FormTextStyle.buttonText.copyWith(
                              color: AppColors.backgroundColor,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
