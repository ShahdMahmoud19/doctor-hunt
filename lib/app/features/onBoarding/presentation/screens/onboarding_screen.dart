import 'package:doctor_hunt/app/core/router/app_route.dart';
import 'package:doctor_hunt/app/core/utils/app_string.dart';
import 'package:doctor_hunt/app/core/widgets/app_background.dart';
import 'package:doctor_hunt/app/core/widgets/button_widget.dart';
import 'package:doctor_hunt/app/features/onBoarding/data/onboarding_data.dart';
import 'package:doctor_hunt/app/features/onBoarding/presentation/widgets/onboarding_page.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController();
  int currentPage = 0;
  void nextPage() {
    if (currentPage < onboardingDataList.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      finishOnboarding();
    }
  }

  void finishOnboarding() {
    Navigator.pushReplacementNamed(context, AppRoute.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBackground(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) {
                  return OnboardingPage(data: onboardingDataList[index]);
                },
                controller: pageController,
                itemCount: onboardingDataList.length,
                onPageChanged: (index) => setState(() {
                  currentPage = index;
                }),
              ),
            ),
            ButtonWidget(
              onPressed: nextPage,
              textButton: currentPage == onboardingDataList.length - 1
                  ? AppStrings.getStarted
                  : AppStrings.next,
            ),
            TextButton(
              onPressed: () {
                finishOnboarding();
              },
              child: Text(
                AppStrings.skip,
                style: context.regular16TextPlaceholder,
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
