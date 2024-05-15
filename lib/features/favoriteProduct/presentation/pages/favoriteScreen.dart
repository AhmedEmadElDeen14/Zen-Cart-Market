import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zen_cart_market/core/api/api_manager.dart';
import 'package:zen_cart_market/core/enums/enums.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';
import 'package:zen_cart_market/features/favoriteProduct/data/data_sources/wishlist_ds_impl.dart';
import 'package:zen_cart_market/features/favoriteProduct/data/repositories/wishlist_repo_impl.dart';
import 'package:zen_cart_market/features/favoriteProduct/domain/use_cases/add_product_to_wishlist_useCase.dart';
import 'package:zen_cart_market/features/favoriteProduct/domain/use_cases/delete_product_from_wishlist.dart';
import 'package:zen_cart_market/features/favoriteProduct/domain/use_cases/wishlist_useCase.dart';
import 'package:zen_cart_market/features/favoriteProduct/presentation/bloc/wishlist_bloc.dart';
import 'package:zen_cart_market/features/favoriteProduct/presentation/widgets/wishlistItem.dart';
import 'package:zen_cart_market/features/home/presentation/widgets/productItem.dart';
import 'package:zen_cart_market/features/home/presentation/widgets/saleAds.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistBloc(
        WishlistUseCase(
          WishlistRepoImpl(
            WishlistDsImpl(
              ApiManager(),
            ),
          ),
        ),
        AddProductToWishlistUseCase(
          WishlistRepoImpl(
            WishlistDsImpl(
              ApiManager(),
            ),
          ),
        ),
        DeleteProductFromWishlistUseCase(
          WishlistRepoImpl(
            WishlistDsImpl(
              ApiManager(),
            ),
          ),
        ),
      )..add(GetWishlistEvent()),
      child: BlocConsumer<WishlistBloc, WishlistState>(
        listener: (context, state) {
          if (state.type == ScreenType.wishlistFailures) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.failures?.message ?? "An error occurred."),
              ),
            );
          }
          if (state.type == ScreenType.wishlistSuccess) {
            print("---------------------------------------wishlist Success");
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: AppBar(
              title: Text(
                "Favorite Product",
                style:
                    HeadingTextStyle.h4.copyWith(color: AppColors.neutralDark),
              ),
              backgroundColor: AppColors.backgroundColor,
              iconTheme: IconThemeData(color: AppColors.neutralGrey),
              leading: GestureDetector(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.neutralGrey,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                child: state.wishlistModel == null ||
                        state.type == ScreenType.loading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: .7),
                        itemBuilder: (context, index) {
                          return WishlistItem(
                            data: state.wishlistModel!.data![index],
                          );
                        },
                        itemCount: state.wishlistModel!.data!.length,
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
