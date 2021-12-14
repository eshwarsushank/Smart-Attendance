import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:attendance/firstpage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child: AnimatedSplashScreen(
          splashIconSize: 200,
          duration: 3000,
          splash: Container(
            child: Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.contain,
            ),
          ),
          nextScreen:First(),
          splashTransition: SplashTransition.scaleTransition,
          pageTransitionType: PageTransitionType.leftToRight,
        ),
      ),
    );
  }
}