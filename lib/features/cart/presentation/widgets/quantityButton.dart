import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';

class QuantityButton extends StatefulWidget {
  QuantityButton({super.key});

  @override
  State<QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  int numOfProduct = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            if (numOfProduct > 1) {
              numOfProduct--;
              setState(() {});
            }
          },
          child: Container(
            height: 24.h,
            width: 32.w,
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.minus,
                size: 20,
                color: AppColors.neutralGrey,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                topLeft: Radius.circular(5),
              ),
              border: Border(
                left: BorderSide(color: AppColors.neutralLight),
                top: BorderSide(color: AppColors.neutralLight),
                bottom: BorderSide(color: AppColors.neutralLight),
              ),
            ),
          ),
        ),
        Container(
          width: 40.w,
          height: 24.h,
          color: AppColors.neutralLight,
          alignment: Alignment.center,
          child: Text(
            numOfProduct.toString(),
            style: HeadingTextStyle.h5.copyWith(
              color: AppColors.neutralGrey,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            numOfProduct++;
            setState(() {});
          },
          child: Container(
            height: 24.h,
            width: 32.w,
            child: Icon(
              Icons.add,
              color: AppColors.neutralGrey,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              border: Border(
                right: BorderSide(color: AppColors.neutralLight),
                top: BorderSide(color: AppColors.neutralLight),
                bottom: BorderSide(color: AppColors.neutralLight),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
