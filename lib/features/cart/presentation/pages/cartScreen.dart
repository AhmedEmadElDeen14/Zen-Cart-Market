import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zen_cart_market/core/api/api_manager.dart';
import 'package:zen_cart_market/core/enums/enums.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';
import 'package:zen_cart_market/features/cart/data/data_sources/cart_ds_impl.dart';
import 'package:zen_cart_market/features/cart/data/repositories/cart_repo_impl.dart';
import 'package:zen_cart_market/features/cart/domain/use_cases/add_item_useCase.dart';
import 'package:zen_cart_market/features/cart/domain/use_cases/cart_useCase.dart';
import 'package:zen_cart_market/features/cart/domain/use_cases/edit_quantity_useCase.dart';
import 'package:zen_cart_market/features/cart/domain/use_cases/remove_specific_cart_item_useCase.dart';
import 'package:zen_cart_market/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:zen_cart_market/features/cart/presentation/widgets/cartItem.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  Future<void> _refresh(BuildContext context) async {
    BlocProvider.of<CartBloc>(context).add(GetCartEvent());
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));
  }

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
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(65.h),
              child: AppBar(
                title: Text(
                  "Your Cart",
                  style: HeadingTextStyle.h2.copyWith(
                    color: AppColors.neutralDark,
                  ),
                ),
                shape: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.neutralLight,
                  ),
                ),
              ),
            ),
            body: state.type == ScreenType.loading || state.cartModel == null
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryBlue,
                    ),
                  )
                : state.cartModel!.numOfCartItems == 0
                    ? RefreshIndicator(
                      onRefresh: () => _refresh(context),
                      child: Center(
                          child: Text(
                          "Your Cart is Empty",
                          style: HeadingTextStyle.h3.copyWith(
                            color: AppColors.neutralDark,
                          ),
                        )),
                    )
                    : RefreshIndicator(
                        onRefresh: () => _refresh(context),
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.all(25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              state.type == ScreenType.cartFailures ||
                                      state.type == ScreenType.loading
                                  ? SizedBox()
                                  : ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        if (state.cartModel?.data!
                                                .products![index] ==
                                            null) {
                                          return SizedBox();
                                        } else {
                                          return CartItem(
                                            product: state.cartModel?.data!
                                                .products![index],
                                            quantity: state.cartModel?.data!
                                                    .products![index].count ??
                                                0,
                                            onQuantityChanged: (newQuantity) {
                                              BlocProvider.of<CartBloc>(context)
                                                  .add(
                                                EditQuantityEvent(
                                                  numOfQuantity: newQuantity,
                                                  productId: state
                                                          .cartModel
                                                          ?.data!
                                                          .products![index]
                                                          .product!
                                                          .id ??
                                                      "",
                                                ),
                                              );
                                            },
                                            onDeleteItem: () =>
                                                _refresh(context),
                                          );
                                        }
                                      },
                                      itemCount:
                                          state.cartModel?.numOfCartItems,
                                    ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 56.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          topLeft: Radius.circular(10),
                                        ),
                                        border: Border(
                                          left: BorderSide(
                                              color: AppColors.neutralLight),
                                          top: BorderSide(
                                              color: AppColors.neutralLight),
                                          bottom: BorderSide(
                                              color: AppColors.neutralLight),
                                        ),
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: "Enter Coupon Code",
                                          hintStyle:
                                              FormTextStyle.normal.copyWith(
                                            color: AppColors.neutralGrey,
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 87.w,
                                      height: 56.h,
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryBlue,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text("Apply",
                                          style:
                                              BodyTextStyle.mediumBold.copyWith(
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(color: AppColors.neutralLight),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Items (${state.cartModel?.numOfCartItems ?? ""})",
                                            style: BodyTextStyle.mediumRegular
                                                .copyWith(
                                              color: AppColors.neutralGrey,
                                            ),
                                          ),
                                          Text(
                                            "\$${state.cartModel?.data!.totalCartPrice}",
                                            style: BodyTextStyle.mediumRegular
                                                .copyWith(
                                              color: AppColors.neutralDark,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Shipping",
                                            style: BodyTextStyle.mediumRegular
                                                .copyWith(
                                              color: AppColors.neutralGrey,
                                            ),
                                          ),
                                          state.cartModel?.data!
                                                      .totalCartPrice ==
                                                  0
                                              ? Text(
                                                  "\$0",
                                                  style: BodyTextStyle
                                                      .mediumRegular
                                                      .copyWith(
                                                    color:
                                                        AppColors.neutralDark,
                                                  ),
                                                )
                                              : Text(
                                                  "\$40",
                                                  style: BodyTextStyle
                                                      .mediumRegular
                                                      .copyWith(
                                                    color:
                                                        AppColors.neutralDark,
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Import charges",
                                            style: BodyTextStyle.mediumRegular
                                                .copyWith(
                                              color: AppColors.neutralGrey,
                                            ),
                                          ),
                                          state.cartModel?.data!
                                                      .totalCartPrice ==
                                                  0
                                              ? Text(
                                                  "\$0",
                                                  style: BodyTextStyle
                                                      .mediumRegular
                                                      .copyWith(
                                                    color:
                                                        AppColors.neutralDark,
                                                  ),
                                                )
                                              : Text(
                                                  "\$128.00",
                                                  style: BodyTextStyle
                                                      .mediumRegular
                                                      .copyWith(
                                                    color:
                                                        AppColors.neutralDark,
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      indent: 10,
                                      thickness: 2,
                                      color: AppColors.neutralLight,
                                      endIndent: 10,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Total Price",
                                            style: HeadingTextStyle.h5.copyWith(
                                              color: AppColors.neutralDark,
                                            ),
                                          ),
                                          state.cartModel?.data!
                                                      .totalCartPrice ==
                                                  0
                                              ? Text(
                                                  "\$0",
                                                  style: BodyTextStyle
                                                      .mediumRegular
                                                      .copyWith(
                                                    color:
                                                        AppColors.neutralDark,
                                                  ),
                                                )
                                              : Text(
                                                  "\$${(state.cartModel?.data!.totalCartPrice ?? 0) + 128 + 40}",
                                                  style: HeadingTextStyle.h5
                                                      .copyWith(
                                                    color:
                                                        AppColors.primaryBlue,
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  alignment: Alignment.center,
                                  elevation: MaterialStatePropertyAll(0),
                                  backgroundColor: MaterialStatePropertyAll(
                                      AppColors.primaryBlue),
                                  shape: MaterialStatePropertyAll(
                                      ContinuousRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 57.h,
                                  width: 343.w,
                                  child: Text(
                                    "Check Out",
                                    style: FormTextStyle.buttonText.copyWith(
                                      color: AppColors.backgroundColor,
                                    ),
                                  ),
                                ),
                              ),
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
