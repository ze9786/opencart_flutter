import 'package:flutter/material.dart';
import 'package:opencart/main.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      image: Image.asset('images/logo.png'),
      backgroundColor: Colors.white,
      photoSize: 100.0,
      navigateAfterSeconds: MyHomePage(),
    );
  }
}
