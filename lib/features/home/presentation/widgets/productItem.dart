import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zen_cart_market/config/routes/routes.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';
import 'package:zen_cart_market/features/home/data/models/ProductModel.dart';

class ProductItem extends StatelessWidget {
  Product? data;
  bool checkDelete = false;

  ProductItem({required this.data, this.checkDelete = false});

  @override
  Widget build(BuildContext context) {
    double sale = data!.price! - (data!.price! * .24);
    return Container(
      height: 238.h,
      width: 141.w,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          border: Border.all(color: AppColors.neutralLight),
          borderRadius: BorderRadius.circular(5)),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, RoutesName.productScreen,
              arguments: data);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(data?.imageCover ?? ""),
              height: 109.h,
              width: 109.w,
            ),
            data!.title!.length > 25
                ? Text(
                    "${data!.title!.substring(0, 20)}...",
                    style: HeadingTextStyle.h6.copyWith(
                      color: AppColors.neutralDark,
                    ),
                  )
                : Text(
                    data!.title ?? "",
                    style: HeadingTextStyle.h6.copyWith(
                      color: AppColors.neutralDark,
                    ),
                  ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "\$${sale.round()}",
                style: BodyTextStyle.normalBold.copyWith(
                  color: AppColors.primaryBlue,
                ),
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 12,
                  color: AppColors.primaryYellow,
                ),
                Icon(
                  Icons.star,
                  size: 12,
                  color: AppColors.primaryYellow,
                ),
                Icon(
                  Icons.star,
                  size: 12,
                  color: AppColors.primaryYellow,
                ),
                Icon(
                  Icons.star,
                  size: 12,
                  color: AppColors.primaryYellow,
                ),
                Icon(
                  Icons.star,
                  size: 12,
                  color: AppColors.primaryYellow,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "\$${data!.price.toString()}",
                      style: CaptionTextStyle.normalRegular.copyWith(
                        color: AppColors.neutralGrey,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "24% Off",
                      style: CaptionTextStyle.normalBold.copyWith(
                        color: AppColors.primaryRed,
                      ),
                    ),
                  ],
                ),
                checkDelete
                    ? InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.delete,
                          size: 20,
                          color: AppColors.neutralGrey,
                        ),
                      )
                    : SizedBox(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
