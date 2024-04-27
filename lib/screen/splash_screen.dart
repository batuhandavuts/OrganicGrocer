import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grocery_app/loginscreens/login/otp_view.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/widgets/bottom_navigator.dart';

class SplashScreen extends StatefulWidget {
  final OTPView Function(dynamic context)? builder;

  const SplashScreen({Key? key, this.builder});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomNavigation(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorsLiteGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/success_logo.png",
              width: 500,
              height: 500,
            ),
          ],
        ),
      ),
    );
  }
}
