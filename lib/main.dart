import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ss_algorithms_app/Core/utils/app_state.dart';
import 'package:ss_algorithms_app/Features/splash/views/splash_screen.dart';
import 'package:ss_algorithms_app/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AppState(),
      child: MaterialApp(
        title: 'Software Security Algorithms',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kScaffoldBackgroundColor,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
