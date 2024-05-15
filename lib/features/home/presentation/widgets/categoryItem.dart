import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zen_cart_market/config/routes/routes.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';
import 'package:zen_cart_market/features/home/data/models/CategoryModel.dart';

class CategoryItem extends StatelessWidget {
  Category category;

  CategoryItem({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesName.categoryDetails,arguments: category.id);
      },
      child: Container(
        height: 108.h,
        width: 70.w,
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 70.w,
              height: 70.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: AppColors.neutralLight,
                  ),
                  image: DecorationImage(
                      image: NetworkImage(category.image ?? ""),
                  fit: BoxFit.fill
                  ),),
            ),
            Text(
              category.name ?? "",
              style: CaptionTextStyle.normalRegular
                  .copyWith(color: AppColors.neutralGrey),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
