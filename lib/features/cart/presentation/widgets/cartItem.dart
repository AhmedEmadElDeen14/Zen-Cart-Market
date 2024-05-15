import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zen_cart_market/core/api/api_manager.dart';
import 'package:zen_cart_market/core/enums/enums.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';
import 'package:zen_cart_market/features/cart/data/data_sources/cart_ds_impl.dart';
import 'package:zen_cart_market/features/cart/data/models/CartModel.dart';
import 'package:zen_cart_market/features/cart/data/repositories/cart_repo_impl.dart';
import 'package:zen_cart_market/features/cart/domain/use_cases/add_item_useCase.dart';
import 'package:zen_cart_market/features/cart/domain/use_cases/cart_useCase.dart';
import 'package:zen_cart_market/features/cart/domain/use_cases/edit_quantity_useCase.dart';
import 'package:zen_cart_market/features/cart/domain/use_cases/remove_specific_cart_item_useCase.dart';
import 'package:zen_cart_market/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:zen_cart_market/features/cart/presentation/widgets/quantityButton.dart';

class CartItem extends StatefulWidget {
  final Products? product;
  final int quantity;
  final Function(int) onQuantityChanged;

  CartItem(
      {super.key,
      this.product,
      required this.quantity,
      required this.onQuantityChanged});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 0;

  @override
  void initState() {
    super.initState();
    quantity = widget.quantity;
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
      ),
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
          return Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.neutralLight)),
            child: Row(
              children: [
                Image(
                  image:
                      NetworkImage(widget.product!.product!.imageCover ?? ""),
                  height: 72.h,
                  width: 72.w,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.product!.product!.title ?? "",
                                style: HeadingTextStyle.h5.copyWith(
                                  color: AppColors.neutralDark,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {},
                              child: FaIcon(
                                FontAwesomeIcons.solidHeart,
                                color: AppColors.primaryRed,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                BlocProvider.of<CartBloc>(context).add(
                                    RemoveSpecificCartItemEvent(
                                        productId:
                                            widget.product?.product?.id ??
                                                "15"));
                                widget.onQuantityChanged(quantity);
                              },
                              child: FaIcon(
                                FontAwesomeIcons.trash,
                                color: AppColors.neutralGrey,
                              ),
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            state.cartModel == null ||
                                    state.type == ScreenType.cartFailures
                                ? Text(
                                    "\$${widget.product!.price}",
                                    style: HeadingTextStyle.h5.copyWith(
                                      color: AppColors.primaryBlue,
                                    ),
                                  )
                                : Text(
                                    "\$${state.cartModel!.data!.products!.where((element) => widget.product!.id == element.id).first.price.toString()}",
                                    style: HeadingTextStyle.h5.copyWith(
                                      color: AppColors.primaryBlue,
                                    ),
                                  ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (quantity > 0) {
                                      setState(() {
                                        quantity--;
                                        widget.onQuantityChanged(quantity);
                                      });
                                    }
                                    BlocProvider.of<CartBloc>(context).add(
                                      EditQuantityEvent(
                                        numOfQuantity: widget.quantity,
                                        productId:
                                            widget.product!.product!.id ?? "",
                                      ),
                                    );
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
                                        left: BorderSide(
                                            color: AppColors.neutralLight),
                                        top: BorderSide(
                                            color: AppColors.neutralLight),
                                        bottom: BorderSide(
                                            color: AppColors.neutralLight),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                    width: 40.w,
                                    height: 24.h,
                                    color: AppColors.neutralLight,
                                    alignment: Alignment.center,
                                    child: state.cartModel == null ||
                                            state.type ==
                                                ScreenType.cartFailures
                                        ? Text(
                                            widget.product!.count.toString(),
                                            style: HeadingTextStyle.h5.copyWith(
                                              color: AppColors.neutralGrey,
                                            ),
                                          )
                                        : Text(
                                            state.cartModel!.data!.products!
                                                .where((element) =>
                                                    widget.product!.id ==
                                                    element.id)
                                                .first
                                                .count
                                                .toString(),
                                            style: HeadingTextStyle.h5.copyWith(
                                              color: AppColors.neutralGrey,
                                            ),
                                          )),
                                InkWell(
                                  onTap: () {
                                    if (quantity > 0) {
                                      setState(() {
                                        quantity++;
                                        widget.onQuantityChanged(quantity);
                                      });
                                    }
                                    BlocProvider.of<CartBloc>(context).add(
                                        EditQuantityEvent(
                                            numOfQuantity: widget.quantity,
                                            productId:
                                                widget.product!.product!.id ??
                                                    ""));
                                    BlocProvider.of<CartBloc>(context).add(
                                      GetCartEvent(),
                                    );
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
                                        right: BorderSide(
                                            color: AppColors.neutralLight),
                                        top: BorderSide(
                                            color: AppColors.neutralLight),
                                        bottom: BorderSide(
                                            color: AppColors.neutralLight),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
