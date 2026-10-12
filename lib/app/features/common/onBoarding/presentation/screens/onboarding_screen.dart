import 'package:doctor_hunt/app/core/router/app_route.dart';
import 'package:doctor_hunt/app/core/widgets/app_background.dart';
import 'package:doctor_hunt/app/core/widgets/button_widget.dart';
import 'package:doctor_hunt/app/features/common/onBoarding/data/models/onboarding_model.dart';
import 'package:doctor_hunt/app/features/common/onBoarding/presentation/widgets/onboarding_page.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/translations/strings.g.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController();
  int currentPage = 0;
  void nextPage(int pagesCount) {
    if (currentPage < pagesCount - 1) {
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
    final t = Translations.of(context);
    final pages = getOnboardingDataList(t);
    return Scaffold(
      body: AppGradientBackground(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) {
                  return OnboardingPage(data: pages[index]);
                },
                controller: pageController,
                itemCount: pages.length,
                onPageChanged: (index) =>
                // setState(() {
                  currentPage = index
               // }),
              ),
            ),
            ButtonWidget(
              onPressed: () => nextPage(pages.length),
              textButton: currentPage == pages.length - 1
                  ? t.onboarding.getStarted
                  : t.common.next,
            ),
            TextButton(
              onPressed: () {
                finishOnboarding();
              },
              child: Text(
                t.common.skip,
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
