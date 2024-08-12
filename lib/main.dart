import 'package:flutter/material.dart';
import 'package:video_conference_app/screens/AddContactsScreen.dart';
import 'package:video_conference_app/screens/home_screen.dart';
import 'package:video_conference_app/screens/onboardingscreens/onboarding_screen_1.dart';
import 'package:video_conference_app/screens/signup_screen_2.dart';
import 'package:video_conference_app/screens/splash_screen.dart';
import 'package:video_conference_app/utils/themes.dart';
//import 'package:video_conference_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home:  HomeScreen(),
    );
  }
}
