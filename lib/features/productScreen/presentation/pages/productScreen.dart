import 'package:animated_rating_stars/animated_rating_stars.dart';
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
import 'package:zen_cart_market/features/cart/data/data_sources/cart_ds_impl.dart';
import 'package:zen_cart_market/features/cart/data/repositories/cart_repo_impl.dart';
import 'package:zen_cart_market/features/cart/domain/use_cases/add_item_useCase.dart';
import 'package:zen_cart_market/features/cart/domain/use_cases/cart_useCase.dart';
import 'package:zen_cart_market/features/cart/domain/use_cases/edit_quantity_useCase.dart';
import 'package:zen_cart_market/features/cart/domain/use_cases/remove_specific_cart_item_useCase.dart';
import 'package:zen_cart_market/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:zen_cart_market/features/favoriteProduct/data/data_sources/wishlist_ds_impl.dart';
import 'package:zen_cart_market/features/favoriteProduct/data/repositories/wishlist_repo_impl.dart';
import 'package:zen_cart_market/features/favoriteProduct/domain/use_cases/add_product_to_wishlist_useCase.dart';
import 'package:zen_cart_market/features/favoriteProduct/domain/use_cases/delete_product_from_wishlist.dart';
import 'package:zen_cart_market/features/favoriteProduct/domain/use_cases/wishlist_useCase.dart';
import 'package:zen_cart_market/features/favoriteProduct/presentation/bloc/wishlist_bloc.dart';
import 'package:zen_cart_market/features/home/data/models/ProductModel.dart';
import 'package:zen_cart_market/features/home/presentation/widgets/productItem.dart';
import 'package:zen_cart_market/features/productScreen/presentation/widgets/colorButton.dart';
import 'package:zen_cart_market/features/productScreen/presentation/widgets/sizeButton.dart';

class ProductScreen extends StatefulWidget {
  Product product;

  ProductScreen({super.key, required this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int currentImage = 0;
  bool isFavorite = false;


  bool isValidUri(String uri) {
    return uri.startsWith('http://') || uri.startsWith('https://');
  }



  @override
  void initState() {
    super.initState();
    // Initialize the favorite status based on the product ID
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<WishlistBloc>(context).add(GetWishlistEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = CarouselController();
    double sale = widget.product.price! - (widget.product.price! * .24);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
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
        ),
        BlocProvider(
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
        ),
      ],
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
            for (var product in state.wishlistModel?.data ?? []) {
              if (widget.product.id == product.id) {
                isFavorite = true;
              }
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: AppBar(
              title: Text(
                widget.product.title ?? "",
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
              actions: [
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.search,
                    color: AppColors.neutralGrey,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.more_vert,
                      color: AppColors.neutralGrey,
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      CarouselSlider.builder(
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          viewportFraction: 1,
                          initialPage: currentImage,
                          onPageChanged: (index, reason) =>
                              setState(() => currentImage = index),
                        ),
                        carouselController: carouselController,
                        itemCount: widget.product.images!.length,
                        itemBuilder:
                            (BuildContext context, int index, int realIndex) {
                          String imageUri = widget.product.images![index];
                          if (isValidUri(imageUri)) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image.network(imageUri),
                            );
                          }else{
                            String url = "https://ecommerce.routemisr.com/Route-Academy-products/${imageUri}";
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image.network(url),
                            );
                          }

                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SmoothPageIndicator(
                          controller: PageController(initialPage: currentImage),
                          count: widget.product.images!.length,
                          effect: SlideEffect(
                            activeDotColor: AppColors.primaryBlue,
                            dotColor: AppColors.neutralLight,
                            dotHeight: 8,
                            dotWidth: 8,
                          ),
                          onDotClicked: (index) {}),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.product.title ?? "",
                                style: HeadingTextStyle.h3.copyWith(
                                  color: AppColors.neutralDark,
                                ),
                              ),
                            ),
                            isFavorite
                                ? InkWell(
                                    child: Icon(
                                      Icons.favorite,
                                      color: AppColors.primaryRed,
                                      size: 28,
                                    ),
                                    onTap: () {
                                      BlocProvider.of<WishlistBloc>(context)
                                          .add(DeleteProductFromWishlistEvent(
                                              productId:
                                                  widget.product.id ?? ""));

                                    },
                                  )
                                : InkWell(
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: AppColors.neutralGrey,
                                      size: 28,
                                    ),
                                    onTap: () {
                                      BlocProvider.of<WishlistBloc>(context)
                                          .add(AddProductToWishlistEvent(
                                              productId:
                                                  widget.product.id ?? ""));
                                    },
                                  ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        AnimatedRatingStars(
                          initialRating:
                              widget.product.ratingsAverage!.toDouble(),
                          onChanged: (double) {},
                          customFilledIcon: Icons.star,
                          customHalfFilledIcon: Icons.star_half,
                          customEmptyIcon: Icons.star_border,
                          starSize: 20,
                          readOnly: true,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Text(
                              "\$${sale.round()}",
                              style: HeadingTextStyle.h3.copyWith(
                                color: AppColors.primaryBlue,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "\$${widget.product.price}",
                              style: HeadingTextStyle.h6.copyWith(
                                  color: AppColors.neutralGrey,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Select Size",
                          style: HeadingTextStyle.h5.copyWith(
                            color: AppColors.neutralDark,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizeButton(
                                size: "6",
                              ),
                              SizeButton(
                                size: "6.5",
                              ),
                              SizeButton(
                                size: "7.5",
                              ),
                              SizeButton(
                                size: "8",
                              ),
                              SizeButton(
                                size: "8.5",
                              ),
                              SizeButton(
                                size: "9",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Select Color",
                          style: HeadingTextStyle.h5.copyWith(
                            color: AppColors.neutralDark,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ColorButton(color: AppColors.primaryYellow),
                              ColorButton(
                                color: AppColors.primaryBlue,
                              ),
                              ColorButton(
                                color: AppColors.primaryRed,
                              ),
                              ColorButton(
                                color: AppColors.primaryGreen,
                              ),
                              ColorButton(
                                color: AppColors.primaryPurple,
                              ),
                              ColorButton(
                                color: AppColors.neutralDark,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Specification",
                              style: HeadingTextStyle.h5.copyWith(
                                color: AppColors.neutralDark,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Shown:",
                                  style: BodyTextStyle.normalRegular.copyWith(
                                    color: AppColors.neutralDark,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    widget.product.slug ?? "",
                                    style: BodyTextStyle.normalRegular.copyWith(
                                      color: AppColors.neutralGrey,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "Style:",
                                  style: BodyTextStyle.normalRegular.copyWith(
                                    color: AppColors.neutralDark,
                                  ),
                                ),
                                Text(
                                  "CD0113-400",
                                  style: BodyTextStyle.normalRegular.copyWith(
                                    color: AppColors.neutralGrey,
                                  ),
                                  textAlign: TextAlign.right,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              widget.product.description ?? "",
                              style: BodyTextStyle.normalRegular.copyWith(
                                color: AppColors.neutralGrey,
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Review Product",
                                  style: HeadingTextStyle.h5
                                      .copyWith(color: AppColors.neutralDark),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RoutesName.reviewScreen);
                                  },
                                  child: Text(
                                    "See More",
                                    style: HeadingTextStyle.h5
                                        .copyWith(color: AppColors.primaryBlue),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                AnimatedRatingStars(
                                  initialRating:
                                      widget.product.ratingsAverage!.toDouble(),
                                  onChanged: (double) {},
                                  customFilledIcon: Icons.star,
                                  customHalfFilledIcon: Icons.star_half,
                                  customEmptyIcon: Icons.star_border,
                                  starSize: 20,
                                  readOnly: true,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "${widget.product.ratingsAverage} ",
                                  style: CaptionTextStyle.normalBold.copyWith(
                                    color: AppColors.neutralGrey,
                                  ),
                                ),
                                Text(
                                  "(${widget.product.ratingsQuantity} Review)",
                                  style:
                                      CaptionTextStyle.normalRegular.copyWith(
                                    color: AppColors.neutralGrey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Image(
                                  image: AssetImage(
                                      "assets/images/Profile Picture.png"),
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "James Lawson",
                                      style: HeadingTextStyle.h5.copyWith(
                                        color: AppColors.neutralDark,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star_rate_rounded,
                                          size: 20,
                                          color: AppColors.primaryYellow,
                                        ),
                                        Icon(
                                          Icons.star_rate_rounded,
                                          size: 20,
                                          color: AppColors.primaryYellow,
                                        ),
                                        Icon(
                                          Icons.star_rate_rounded,
                                          size: 20,
                                          color: AppColors.primaryYellow,
                                        ),
                                        Icon(
                                          Icons.star_rate_rounded,
                                          size: 20,
                                          color: AppColors.primaryYellow,
                                        ),
                                        Icon(
                                          Icons.star_rate_rounded,
                                          size: 20,
                                          color: AppColors.neutralLight,
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.",
                              style: BodyTextStyle.normalRegular.copyWith(
                                color: AppColors.neutralGrey,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 15, top: 10),
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/Product Picture01.png"),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 15, top: 10),
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/Product Picture02.png"),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 15, top: 10),
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/Product Picture03.png"),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "December 10, 2016",
                              style: CaptionTextStyle.normalRegular.copyWith(
                                color: AppColors.neutralGrey,
                              ),
                              textAlign: TextAlign.left,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 25,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       "You Might Also Like",
                            //       style: HeadingTextStyle.h5
                            //           .copyWith(color: AppColors.neutralDark),
                            //     ),
                            //   ],
                            // ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  // ProductItem(
                                  //   title: "FS - Nike Air Max 270 React...",
                                  //   imagePath: "assets/images/image Product.png",
                                  // ),
                                  // ProductItem(
                                  //   title: "FS - QUILTED MAXI CROS...",
                                  //   imagePath: "assets/images/image Product_2.png",
                                  // ),
                                  // ProductItem(
                                  //   title: "FS - Nike Air Max 270 React...",
                                  //   imagePath: "assets/images/image Product_3.png",
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<CartBloc>(context).add(
                                  AddItemEvent(
                                      productId: widget.product.id ?? ""));
                              Navigator.pushNamed(
                                  context, RoutesName.cartScreen);
                            },
                            style: ButtonStyle(
                                alignment: Alignment.center,
                                elevation: MaterialStatePropertyAll(0),
                                backgroundColor: MaterialStatePropertyAll(
                                    AppColors.primaryBlue),
                                shape: MaterialStatePropertyAll(
                                    ContinuousRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)))),
                            child: Container(
                              alignment: Alignment.center,
                              height: 57.h,
                              width: 343.w,
                              child: Text(
                                "Add To Cart",
                                style: FormTextStyle.buttonText.copyWith(
                                  color: AppColors.backgroundColor,
                                ),
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
