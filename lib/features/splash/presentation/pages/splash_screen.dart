import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zen_cart_market/config/routes/routes.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});



  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false);
    });
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: Center(child: Image(image: AssetImage(AppImages.logoWhite))),
    );
  }
}
