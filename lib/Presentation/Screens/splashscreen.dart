import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'LandingPage.dart';

class PlashScreen extends StatefulWidget {
  @override
  _PlashScreenState createState() => _PlashScreenState();
}

class _PlashScreenState extends State<PlashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      image: Image.asset("asset/images/splash.png"),
      seconds: 14,
      backgroundColor: Colors.white,
      navigateAfterSeconds: new LandingPage(),
    );
  }
}
