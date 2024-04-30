import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';

class ColorButton extends StatefulWidget {

  Color color;

  ColorButton({super.key, required this.color});

  @override
  State<ColorButton> createState() => _ColorButtonState();
}

class _ColorButtonState extends State<ColorButton> {
  bool check = false;


  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        check = true;
        setState(() {
        });
      },
      borderRadius: BorderRadius.circular(66),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.neutralLight),
              borderRadius: BorderRadius.circular(66),
              color: widget.color,
            ),
          ),
          check == true
              ? Container(
                  width: 16.w,
                  height: 16.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(66),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
