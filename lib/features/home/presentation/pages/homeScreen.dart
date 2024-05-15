import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zen_cart_market/config/routes/routes.dart';
import 'package:zen_cart_market/core/api/api_manager.dart';
import 'package:zen_cart_market/core/enums/enums.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';
import 'package:badges/badges.dart' as badges;
import 'package:zen_cart_market/features/cart/data/data_sources/cart_ds_impl.dart';
import 'package:zen_cart_market/features/cart/data/repositories/cart_repo_impl.dart';
import 'package:zen_cart_market/features/cart/domain/use_cases/add_item_useCase.dart';
import 'package:zen_cart_market/features/cart/domain/use_cases/cart_useCase.dart';
import 'package:zen_cart_market/features/cart/domain/use_cases/edit_quantity_useCase.dart';
import 'package:zen_cart_market/features/cart/domain/use_cases/remove_specific_cart_item_useCase.dart';
import 'package:zen_cart_market/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:zen_cart_market/features/cart/presentation/pages/cartScreen.dart';
import 'package:zen_cart_market/features/home/presentation/pages/tabs/accountTab.dart';
import 'package:zen_cart_market/features/home/presentation/pages/tabs/cartTab.dart';
import 'package:zen_cart_market/features/home/presentation/pages/tabs/explore.dart';
import 'package:zen_cart_market/features/home/presentation/pages/tabs/home.dart';
import 'package:zen_cart_market/features/home/presentation/pages/tabs/offerTab.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<AppLayout> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(
        GetCartUseCase(
          CartRepoImpl(
            CartDSImpl(
              ApiManager(),
            ),
          ),
        ),
        EditCartUseCase(
          CartRepoImpl(
            CartDSImpl(
              ApiManager(),
            ),
          ),
        ),
        AddItemUseCase(
          CartRepoImpl(
            CartDSImpl(
              ApiManager(),
            ),
          ),
        ),
        RemoveSpecificCartItemUseCase(
          CartRepoImpl(
            CartDSImpl(
              ApiManager(),
            ),
          ),
        ),
      )..add(GetCartEvent()),
      child: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state.type == ScreenType.cartFailures) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.failures?.message ?? "An error occurred."),
              ),
            );
          }
          if (state.type == ScreenType.cartSuccess) {}
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: tabs[index],
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: index,
                showUnselectedLabels: true,
                backgroundColor: AppColors.backgroundColor,
                unselectedItemColor: AppColors.neutralGrey,
                selectedItemColor: AppColors.primaryBlue,
                onTap: (value) {
                  index = value;
                  BlocProvider.of<CartBloc>(context).add(
                    GetCartEvent(),
                  );
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_filled,
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: "Explore",
                  ),
                  BottomNavigationBarItem(
                    icon: badges.Badge(
                      position: badges.BadgePosition.topEnd(top: -10, end: -8),
                      badgeContent: Text(
                        state.cartModel?.numOfCartItems.toString() ?? "0",
                        style: BodyTextStyle.normalBold
                            .copyWith(color: AppColors.backgroundColor),
                      ),
                      badgeStyle:
                          badges.BadgeStyle(badgeColor: AppColors.primaryRed),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                      ),
                    ),
                    label: "Cart",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.local_offer_outlined),
                    label: "Offer",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "Account",
                  ),
                ]),
          );
        },
      ),
    );
  }

  List<Widget> tabs = [
    HomeTab(),
    ExploreTab(),
    CartScreen(),
    OfferTab(),
    AccountTab()
  ];
}
