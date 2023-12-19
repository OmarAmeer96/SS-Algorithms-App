import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:ss_algorithms_app/Features/home/views/home_view.dart';
import 'package:ss_algorithms_app/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset("assets/json/Animation_splash.json"),
      backgroundColor: kScaffoldBackgroundColor,
      nextScreen: const HomeView(),
      splashIconSize: 200,
      duration: 1400,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
