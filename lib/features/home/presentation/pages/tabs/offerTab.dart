import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zen_cart_market/config/routes/routes.dart';
import 'package:zen_cart_market/core/api/api_manager.dart';
import 'package:zen_cart_market/core/enums/enums.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';
import 'package:badges/badges.dart' as badges;
import 'package:zen_cart_market/features/home/data/data_sources/home_ds_impl.dart';
import 'package:zen_cart_market/features/home/data/repositories/home_repo_impl.dart';
import 'package:zen_cart_market/features/home/domain/use_cases/get_brands_useCase.dart';
import 'package:zen_cart_market/features/home/domain/use_cases/get_categories_useCase.dart';
import 'package:zen_cart_market/features/home/domain/use_cases/get_products_usecase.dart';
import 'package:zen_cart_market/features/home/domain/use_cases/get_sub_categories_useCase.dart';
import 'package:zen_cart_market/features/home/presentation/bloc/home_bloc.dart';
import 'package:zen_cart_market/features/home/presentation/widgets/productItem.dart';

class OfferTab extends StatelessWidget {
  const OfferTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        getBrandsUseCase: GetBrandsUseCase(
          HomeRepoImpl(
            HomeDSImpl(
              ApiManager(),
            ),
          ),
        ),
        getCategoriesUseCase: GetCategoriesUseCase(
          HomeRepoImpl(
            HomeDSImpl(
              ApiManager(),
            ),
          ),
        ),
        getProductsUseCase: GetProductsUseCase(
          HomeRepoImpl(
            HomeDSImpl(
              ApiManager(),
            ),
          ),
        ),
        getSubCategoriesUseCase: GetSubCategoriesUseCase(
          HomeRepoImpl(
            HomeDSImpl(
              ApiManager(),
            ),
          ),
        ),
      )..add(HomeGetProductsEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.type == ScreenType.productsFailures) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.failures?.message ?? "An error occurred."),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(65.h),
              child: AppBar(
                backgroundColor: Colors.transparent,
                title: Container(
                  height: 46.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColors.neutralLight),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      prefixIcon:
                          Icon(Icons.search, color: AppColors.primaryBlue),
                      hintText: 'Search Product',
                      hintStyle: BodyTextStyle.normalRegular.copyWith(
                        color: AppColors.neutralGrey,
                      ),
                    ),
                  ),
                ),
                actions: [
                  InkWell(
                    child: Icon(
                      Icons.favorite_border,
                      color: AppColors.neutralGrey,
                      size: 28,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.favoriteScreen);
                    },
                  ),
                  InkWell(
                    child: badges.Badge(
                      position: badges.BadgePosition.topEnd(top: -10, end: -8),
                      badgeContent: Text(
                        "2",
                        style: BodyTextStyle.normalBold
                            .copyWith(color: AppColors.backgroundColor),
                      ),
                      badgeStyle:
                          badges.BadgeStyle(badgeColor: AppColors.primaryRed),
                      child: Icon(
                        Icons.notifications_none_rounded,
                        color: AppColors.neutralGrey,
                        size: 28,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                          context, RoutesName.notificationScreen);
                    },
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
                shape: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.neutralLight,
                  ),
                ),
              ),
            ),
            body: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  state.productModel == null
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryBlue,
                          ),
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * .75,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: .7,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return ProductItem(
                                  data: state
                                      .productModel!.data![index]);
                            },
                            itemCount: state.productModel?.data?.length,
                          ),
                        ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
