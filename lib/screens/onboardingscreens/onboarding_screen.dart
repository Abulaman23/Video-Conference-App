import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_conference_app/models/onboarding_model.dart';
import 'package:video_conference_app/screens/welcome_screen.dart';
import 'package:video_conference_app/widgets/onboarding_page_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = LiquidController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pages = [
      OnboardingPageWidget(
        model: OnBoardingModel(
            image: 'assets/images/video_conference_1.jpg',
            title: "Connect Instantly, Anywhere",
            subtitle:
                "Join meetings with a tap. Stay connected, no matter where you are.",
            counterText: "1/3",
            bgColor: Colors.white,
            height: size.height),
      ),
      OnboardingPageWidget(
        model: OnBoardingModel(
            image: 'assets/images/video_conference_2.png',
            title: "Connect Beyond Borders",
            subtitle: "Break the barriers of distance and connect globally.",
            counterText: "2/3",
            bgColor: const Color(0xfffddcdf),
            height: size.height),
      ),
      OnboardingPageWidget(
        model: OnBoardingModel(
            image: 'assets/images/video_conference_3.jpg',
            title: "Meetings Made Simple",
            subtitle: "No complex setups. Just easy, seamless connections.",
            counterText: "3/3",
            bgColor: const Color(0xffffdcbd),
            height: size.height),
      ),
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: pages,
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
            right: 153,
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
                  color: Colors.black26,
                ),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
                backgroundColor: Colors.white,
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.black87,
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
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () {
                controller.jumpToPage(page: 2);
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: AnimatedSmoothIndicator(
              activeIndex: controller.currentPage,
              count: 3,
              effect: const WormEffect(
                activeDotColor: Color(0xff272727),
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
}
