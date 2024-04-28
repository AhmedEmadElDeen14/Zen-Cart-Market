import 'package:flutter/material.dart';
import 'package:zen_cart_market/features/home/presentation/pages/homeScreen.dart';
import 'package:zen_cart_market/features/logIn/presentation/pages/login_screen.dart';
import 'package:zen_cart_market/features/register/presentation/pages/register.dart';
import 'package:zen_cart_market/features/splash/presentation/pages/splash_screen.dart';

class RoutesName {
  static const String splash = "/";
  static const String login = "login";
  static const String register = "register";
  static const String appLayout = "appLayout";
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
