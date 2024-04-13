import 'dart:async';
import 'package:e_com_project_new/custom/custom_styles.dart';
import 'package:e_com_project_new/examples_pakages.dart';
import 'package:e_com_project_new/screens/landing%20screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screens/home_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
      Duration(seconds: 15),
      () {
        fetchData();
      },
    );
  }

  fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var check = prefs.getBool('LoggedIn');
    if (check != null) {
      if (check) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => WelcomeScreen(),
          ),
        );
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomeScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Lottie.network(
                  'https://lottie.host/b0485278-3fe2-4f7b-bcd9-e860f6b7627c/296yrwB6Hh.json'),
            ),
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Fluffing up the virtual pillows of comfort for your shopping journey...',
                    textStyle: mtextStyle18(color: Colors.black),
                    textAlign: TextAlign.center,
                    speed: const Duration(milliseconds: 200),
                  ),
                ],
                totalRepeatCount: 4,
                displayFullTextOnTap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
