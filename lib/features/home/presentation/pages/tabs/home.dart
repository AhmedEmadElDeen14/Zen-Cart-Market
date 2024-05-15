import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as badges;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zen_cart_market/config/routes/routes.dart';
import 'package:zen_cart_market/core/api/api_manager.dart';
import 'package:zen_cart_market/core/cache/shared_pref.dart';
import 'package:zen_cart_market/core/enums/enums.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';
import 'package:zen_cart_market/features/home/data/data_sources/home_ds_impl.dart';
import 'package:zen_cart_market/features/home/data/repositories/home_repo_impl.dart';
import 'package:zen_cart_market/features/home/domain/use_cases/get_brands_useCase.dart';
import 'package:zen_cart_market/features/home/domain/use_cases/get_categories_useCase.dart';
import 'package:zen_cart_market/features/home/domain/use_cases/get_products_usecase.dart';
import 'package:zen_cart_market/features/home/domain/use_cases/get_sub_categories_useCase.dart';
import 'package:zen_cart_market/features/home/presentation/bloc/home_bloc.dart';
import 'package:zen_cart_market/features/home/presentation/widgets/categoryItem.dart';
import 'package:zen_cart_market/features/home/presentation/widgets/productItem.dart';
import 'package:zen_cart_market/features/home/presentation/widgets/saleAds.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = CarouselController();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
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
                )
                  ..add(HomeGetCategoryEvent())
                  ..add(HomeGetBrandsEvent())
                  ..add(HomeGetProductsEvent())),
      ],
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.type == ScreenType.brandsError ||
              state.type == ScreenType.categoryFailures ||
              state.type == ScreenType.productsFailures) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.failures?.message ?? "An error occurred."),
              ),
            );
          }
          // else if (state.type == ScreenType.loading) {
          //   showDialog(
          //     context: context,
          //     builder: (context) => AlertDialog(
          //       title: Text("Loading"),
          //       content: CircularProgressIndicator(),
          //     ),
          //   );
          // }
        },
        builder: (context, state) {
          return state.type == ScreenType.loading
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryBlue,
                  ),
                )
              : Scaffold(
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
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            prefixIcon: Icon(Icons.search,
                                color: AppColors.primaryBlue),
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
                            Navigator.pushNamed(
                                context, RoutesName.favoriteScreen);
                            print(CacheHelper.getToken("Token"));
                          },
                        ),
                        InkWell(
                          child: badges.Badge(
                            position:
                                badges.BadgePosition.topEnd(top: -10, end: -8),
                            badgeContent: Text(
                              "2",
                              style: BodyTextStyle.normalBold
                                  .copyWith(color: AppColors.backgroundColor),
                            ),
                            badgeStyle: badges.BadgeStyle(
                                badgeColor: AppColors.primaryRed),
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
                    padding: EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              CarouselSlider(
                                options: CarouselOptions(
                                  enableInfiniteScroll: false,
                                  enlargeCenterPage: true,
                                  viewportFraction: 1,
                                  initialPage: currentPage,
                                  onPageChanged: (index, reason) =>
                                      setState(() => currentPage = index),
                                ),
                                carouselController: carouselController,
                                items: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, RoutesName.flashSale);
                                    },
                                    child: SaleAds(),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, RoutesName.flashSale);
                                    },
                                    child: SaleAds(),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, RoutesName.flashSale);
                                    },
                                    child: SaleAds(),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, RoutesName.flashSale);
                                    },
                                    child: SaleAds(),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, RoutesName.flashSale);
                                    },
                                    child: SaleAds(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SmoothPageIndicator(
                                  controller:
                                      PageController(initialPage: currentPage),
                                  count: 5,
                                  effect: SlideEffect(
                                    activeDotColor: AppColors.primaryBlue,
                                    dotColor: AppColors.neutralLight,
                                    dotHeight: 8,
                                    dotWidth: 8,
                                  ),
                                  onDotClicked: (index) {}),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Category",
                                    style: HeadingTextStyle.h5
                                        .copyWith(color: AppColors.neutralDark),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      "More Category",
                                      style: HeadingTextStyle.h5.copyWith(
                                          color: AppColors.primaryBlue),
                                    ),
                                  )
                                ],
                              ),
                              state.categoryModel == null
                                  ? SizedBox()
                                  : SizedBox(
                                      height: 150,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          if(index<6){
                                            return CategoryItem(
                                                category: state
                                                    .categoryModel!.data![index]);
                                          }

                                        },
                                        itemCount:
                                            state.categoryModel!.data!.length,
                                      ),
                                    ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Flash Sale",
                                    style: HeadingTextStyle.h5
                                        .copyWith(color: AppColors.neutralDark),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      "See More",
                                      style: HeadingTextStyle.h5.copyWith(
                                          color: AppColors.primaryBlue),
                                    ),
                                  )
                                ],
                              ),
                              state.productModel == null
                                  ? SizedBox()
                                  : SizedBox(
                                      height: 250.h,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          if (index < 20) {
                                            return ProductItem(
                                              data: state
                                                  .productModel?.data?[index],
                                            );
                                          }
                                        },
                                        itemCount:
                                            state.productModel?.data?.length,
                                      ),
                                    ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Mega Sale",
                                    style: HeadingTextStyle.h5
                                        .copyWith(color: AppColors.neutralDark),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      "See More",
                                      style: HeadingTextStyle.h5.copyWith(
                                          color: AppColors.primaryBlue),
                                    ),
                                  )
                                ],
                              ),
                              state.productModel == null
                                  ? SizedBox()
                                  : SizedBox(
                                      height: 250.h,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          if (index >= 20 && index < 40) {
                                            return ProductItem(
                                              data: state
                                                  .productModel?.data?[index],
                                            );
                                          }else{
                                            return SizedBox();
                                          }
                                        },
                                        itemCount:
                                            state.productModel?.data?.length,
                                      ),
                                    ),
                            ],
                          ),
                          Center(
                            child: Container(
                              width: 343.w,
                              height: 206.h,
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/recomended.png"),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    width: 225.w,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Recomended Product",
                                          style: HeadingTextStyle.h2.copyWith(
                                            color: AppColors.backgroundColor,
                                          ),
                                        ),
                                        Text(
                                          "We recommend the best for you",
                                          style: BodyTextStyle.normalRegular
                                              .copyWith(
                                            color: AppColors.backgroundColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          state.productModel == null
                              ? SizedBox()
                              : SizedBox(
                                  height: 500,
                                  child: GridView(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: .7),
                                    children: [
                                      ProductItem(
                                        data: state.productModel?.data?[20],
                                      ),
                                      ProductItem(
                                        data: state.productModel?.data?[18],
                                      ),
                                      ProductItem(
                                        data: state.productModel?.data?[15],
                                      ),
                                      ProductItem(
                                        data: state.productModel?.data?[25],
                                      ),
                                    ],
                                  ),
                                )
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
