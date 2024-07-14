import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:opal_user_app/utils/app_colors.dart';
import 'package:opal_user_app/views/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/icon/opal.png', // Replace with the path to your Lottie JSON file
                fit: BoxFit.cover,
                width: 200, // Adjust the width and height as needed
                height: 200,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SpinKitThreeBounce(
                color: AppColors.primaryColor,
                size: 25.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
