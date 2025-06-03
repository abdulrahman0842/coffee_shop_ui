import 'package:coffee_shop_ui/core/theme.dart';
import 'package:coffee_shop_ui/view/home_screen.dart';
import 'package:coffee_shop_ui/view/onboard_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Coffee Shop',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: const OnboardScreen());
  }
}
