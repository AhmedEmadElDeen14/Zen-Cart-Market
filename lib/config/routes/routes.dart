import 'package:flutter/material.dart';
import 'package:zen_cart_market/features/favoriteProduct/presentation/pages/favoriteScreen.dart';
import 'package:zen_cart_market/features/flashSale/presentation/pages/flashSale.dart';
import 'package:zen_cart_market/features/home/presentation/pages/homeScreen.dart';
import 'package:zen_cart_market/features/logIn/presentation/pages/login_screen.dart';
import 'package:zen_cart_market/features/notification/presentation/pages/Screens/activityNotification.dart';
import 'package:zen_cart_market/features/notification/presentation/pages/Screens/feedNotification.dart';
import 'package:zen_cart_market/features/notification/presentation/pages/Screens/offerNotification.dart';
import 'package:zen_cart_market/features/notification/presentation/pages/notificationScreen.dart';
import 'package:zen_cart_market/features/productScreen/presentation/pages/productScreen.dart';
import 'package:zen_cart_market/features/productScreen/presentation/pages/reviewScreen.dart';
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
          builder: (context) => ProductScreen(),
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

      default:
        return MaterialPageRoute(
          builder: (context) => unDefineRoute(),
        );
    }
  }

  static Widget unDefineRoute() {
    return const Scaffold(
      body: Center(child: Text("Route Not Found")),
    );
  }
}
