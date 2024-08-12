import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_conference_app/screens/welcome_screen.dart';

import '../../models/OnBoardingModel1.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  final controller = LiquidController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pages = [
      OnBoardingModel1(
        animationPath: 'assets/json_animation/animate3.json',
        title: "Meet Anywhere Anytime",
        subtitle: "",
        counterText: "1/3",
        height: size.height,
        bgColor: Color(0xFFECD9D9),
      ),
      OnBoardingModel1(
        animationPath: 'assets/json_animation/animate2.json',
        title: "Unite Beyond Borders",
        subtitle: "",
        counterText: "2/3",
        bgColor: Color(0xFFECD9D9),
        height: size.height,
      ),
      OnBoardingModel1(
        animationPath: 'assets/json_animation/animate1.json',
        title: "Conferences Made Easy",
        subtitle: "",
        counterText: "3/3",
        bgColor: Color(0xFFECD9D9),
        height: size.height,
      ),
    ];

    return Scaffold(
      backgroundColor: Color(0xFFF5F2F4),
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: pages.map((page) => buildPage(page)).toList(),
            liquidController: controller,
            onPageChangeCallback: onPageChangeCallback,
            slideIconWidget: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            enableSideReveal: true,
            waveType: WaveType.circularReveal,
          ),
          Positioned(
            bottom: 40,
            right: 140,
            child: OutlinedButton(
              onPressed: () {
                if (controller.currentPage == pages.length - 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomeScreen(),
                    ),
                  );
                } else {
                  int nextPage = controller.currentPage + 1;
                  controller.animateToPage(page: nextPage);
                }
              },
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  color: Color(0x383392ff),
                ),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
                backgroundColor: Colors.white,
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xffaeb0b2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: AnimatedSmoothIndicator(
              activeIndex: controller.currentPage,
              count: pages.length,
              effect: const WormEffect(
                activeDotColor: Color(0xb26c56fd),
                dotHeight: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onPageChangeCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }

  Widget buildPage(OnBoardingModel1 page) {
    return Container(
      color: page.bgColor,
      height: page.height,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      // Add padding to avoid text cutoff
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            page.animationPath,
            height: page.height * 0.6,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 5),
          Text(
            page.title,
            style: GoogleFonts.dancingScript(
              textStyle: TextStyle(
                fontSize: 33, // Adjust size as needed
                fontWeight: FontWeight.w900, // Adjust weight as needed
                color: Color(0xFF6C56FD),
                letterSpacing: 1.2, // Adjust spacing if needed
              ),
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 2,
          ),
          SizedBox(height: 50),
          Text(
            page.subtitle,
            style: GoogleFonts.dancingScript(
              textStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 2,
          ),
          SizedBox(height: 40),
          Text(
            page.counterText,
            style: GoogleFonts.dancingScript(
              textStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
