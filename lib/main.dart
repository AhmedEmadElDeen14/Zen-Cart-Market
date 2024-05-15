import 'package:flutter/material.dart';
import 'package:zen_cart_market/core/cache/shared_pref.dart';
import 'package:zen_cart_market/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  CacheHelper.init();

  runApp(const MyApp());
}


