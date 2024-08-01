import 'package:flutter/material.dart';
import 'package:video_conference_app/models/onboarding_model.dart';

class OnboardingPageWidget extends StatelessWidget {
  const OnboardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            width: double.infinity,
            height: model.height * 0.42,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                model.title,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                model.subtitle,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black38,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Text(
            model.counterText,
            style: const TextStyle(
              color: Colors.black38,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
