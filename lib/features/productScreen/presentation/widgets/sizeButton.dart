import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';

class SizeButton extends StatelessWidget {
  String size;

  SizeButton({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: 48.w,
        height: 48.h,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.neutralLight),
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            size,
            style: HeadingTextStyle.h5.copyWith(color: AppColors.neutralDark),
          ),
        ),
      ),
    );
  }
}
