import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:garraribikes/screens/SignupPage.dart';
import 'package:garraribikes/constants/Appcolors.dart';
import 'package:garraribikes/screens/landingPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Landingpage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.appColor,
      body: Container(
        child: Image.asset("assets/images/Splash.png",fit: BoxFit.cover,),
      ),

    );
  }
}
