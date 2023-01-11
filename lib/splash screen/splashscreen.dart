import 'dart:async';

import 'package:ardram/Home/view/home_screen.dart';
import 'package:ardram/ardram%20onboarding/ardram_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    pageRouting();
  }

  Future<void> pageRouting() async {
    final pref = await SharedPreferences.getInstance();
    bool? val = pref.getBool('isLogin');

    if (val == null || val == false) {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>const ArdramOnboarding())));
    } else {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreen())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Center(
              child:Image.asset('assets/images/ardramlogo1.png')
            )
          ],
        ),
      ),
    );
  }
}
