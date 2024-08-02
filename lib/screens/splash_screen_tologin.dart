import 'package:flutter/material.dart';
import 'package:video_conference_app/screens/home_screen.dart';
import 'package:video_conference_app/utils/colors.dart';

class SplashScreenToLogin extends StatefulWidget {
  const SplashScreenToLogin({super.key});

  @override
  State<SplashScreenToLogin> createState() => _SplashScreenToLoginState();
}

class _SplashScreenToLoginState extends State<SplashScreenToLogin> {
  bool animate = false;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 2000),
                top: animate ? 0 : -30,
                left: animate ? 0 : -30,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  opacity: animate ? 1 : 0,
                  child: const Image(
                    image: AssetImage(
                      'assets/images/splash_icon.png',
                    ),
                    height: 100,
                    opacity: AlwaysStoppedAnimation(0.8),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 2500),
                top: 40,
                left: animate ? 25 : 40,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2500),
                  opacity: animate ? 1 : 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Conferencia',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        'Make things easier. \nUse this for easy connections.',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 2000),
                bottom: animate ? 41 : 0,
                right: animate ? -90 : 0,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  opacity: animate ? 1 : 0,
                  child: const Image(
                    image: AssetImage('assets/images/splash_screen.png'),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 2000),
                bottom: animate ? 60 : 0,
                right: animate ? 30 : 0,
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() => animate = true);
    await Future.delayed(const Duration(milliseconds: 3000));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}
