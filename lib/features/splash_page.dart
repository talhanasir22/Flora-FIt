import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:florafit_app/features/onboarding/onboardingPage.dart';
import 'package:florafit_app/Core/apptext.dart';

import 'auth/loginpage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? onboardingComplete = prefs.getBool('onboardingComplete');

    await Future.delayed(const Duration(seconds: 2)); // Simulate splash delay
    if (onboardingComplete == true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnboardingPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Color(0xffF5F5F5),
              radius: 45,
              backgroundImage: AssetImage('assets/Images/Logo.png'),
            ),
            Text("FLoraFit", style: AppText.splashPageTextStyle()),
          ],
        ),
      ),
    );
  }
}
