import 'package:flutter/material.dart';
import 'package:zen_cart_market/core/utils/components.dart';
import 'package:zen_cart_market/features/cart/presentation/pages/cartScreen.dart';
import 'package:zen_cart_market/features/categoryDetails/presentation/pages/categoryDetails.dart';
import 'package:zen_cart_market/features/favoriteProduct/presentation/pages/favoriteScreen.dart';
import 'package:zen_cart_market/features/flashSale/presentation/pages/flashSale.dart';
import 'package:zen_cart_market/features/home/data/models/ProductModel.dart';
import 'package:zen_cart_market/features/home/presentation/pages/homeScreen.dart';
import 'package:zen_cart_market/features/logIn/presentation/pages/login_screen.dart';
import 'package:zen_cart_market/features/notification/presentation/pages/Screens/activityNotification.dart';
import 'package:zen_cart_market/features/notification/presentation/pages/Screens/feedNotification.dart';
import 'package:zen_cart_market/features/notification/presentation/pages/Screens/offerNotification.dart';
import 'package:zen_cart_market/features/notification/presentation/pages/notificationScreen.dart';
import 'package:zen_cart_market/features/productScreen/presentation/pages/productScreen.dart';
import 'package:zen_cart_market/features/productScreen/presentation/pages/reviewScreen.dart';
import 'package:zen_cart_market/features/profile/presentation/pages/profile_screen.dart';
import 'package:zen_cart_market/features/profile/presentation/pages/sub_pages/ChangeBirthdayScreen.dart';
import 'package:zen_cart_market/features/profile/presentation/pages/sub_pages/GenderSelectionScreen.dart';
import 'package:zen_cart_market/features/profile/presentation/pages/sub_pages/change_name.dart';
import 'package:zen_cart_market/features/register/presentation/pages/register.dart';
import 'package:zen_cart_market/features/splash/presentation/pages/splash_screen.dart';

class RoutesName {
  static const String splash = "/";
  static const String login = "login";
  static const String register = "register";
  static const String appLayout = "appLayout";
  static const String flashSale = "flashSale";
  static const String productScreen = "productScreen";
  static const String favoriteScreen = "favoriteScreen";
  static const String reviewScreen = "reviewScreen";
  static const String notificationScreen = "notificationScreen";
  static const String activityNotification = "activityNotification";
  static const String feedNotification = "feedNotification";
  static const String offerNotification = "offerNotification";
  static const String cartScreen = "cartScreen";
  static const String categoryDetails = "categoryDetails";
  static const String profileScreen = "profileScreen";
  static const String changeName = "changeName";
  static const String genderSelectionScreen = "genderSelectionScreen";
  static const String changeBirthdayScreen = "changeBirthdayScreen";
}

class AppRoutes {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case RoutesName.register:
        return MaterialPageRoute(
          builder: (context) => RegisterScreen(),
        );
      case RoutesName.appLayout:
        return MaterialPageRoute(
          builder: (context) => AppLayout(),
        );
      case RoutesName.flashSale:
        return MaterialPageRoute(
          builder: (context) => FlashSale(),
        );
      case RoutesName.productScreen:
        return MaterialPageRoute(
          builder: (context) => ProductScreen(
            product: settings.arguments as Product,
          ),
        );
      case RoutesName.favoriteScreen:
        return MaterialPageRoute(
          builder: (context) => FavoriteScreen(),
        );
      case RoutesName.reviewScreen:
        return MaterialPageRoute(
          builder: (context) => ReviewScreen(),
        );
      case RoutesName.notificationScreen:
        return MaterialPageRoute(
          builder: (context) => NotificationScreen(),
        );
      case RoutesName.activityNotification:
        return MaterialPageRoute(
          builder: (context) => ActivityNotification(),
        );
      case RoutesName.feedNotification:
        return MaterialPageRoute(
          builder: (context) => FeedNotification(),
        );
      case RoutesName.offerNotification:
        return MaterialPageRoute(
          builder: (context) => OfferNotification(),
        );
      case RoutesName.cartScreen:
        return MaterialPageRoute(
          builder: (context) => CartScreen(),
        );
      case RoutesName.categoryDetails:
        return MaterialPageRoute(
          builder: (context) => CategoryDetails(
            categoryId: settings.arguments as String,
          ),
        );
      case RoutesName.profileScreen:
        return MaterialPageRoute(
          builder: (context) => ProfileScreen(),
        );
      case RoutesName.changeName:
        return MaterialPageRoute(
          builder: (context) => ChangeName(),
        );
      case RoutesName.genderSelectionScreen:
        return MaterialPageRoute(
          builder: (context) => GenderSelectionScreen(),
        );
      case RoutesName.changeBirthdayScreen:
        return MaterialPageRoute(
          builder: (context) => ChangeBirthdayScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => unDefineRoute(),
        );
    }
  }
}
