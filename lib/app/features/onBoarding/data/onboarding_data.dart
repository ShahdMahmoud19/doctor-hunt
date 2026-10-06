import 'package:doctor_hunt/app/core/utils/app_string.dart';
import 'package:doctor_hunt/app/core/utils/image_assets.dart';

class OnboardingData {
  final String title;
  final String description;
  final String imagePath;
  final double? positionRight;
  final double? positionLeft;

  OnboardingData({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.positionRight,
    required this.positionLeft,
  });
}

List<OnboardingData> onboardingDataList = [
  OnboardingData(
    title: AppStrings.onboardingTitle1,
    description: AppStrings.onboardingDescription,
    imagePath: ImageAssets.onboarding1,
    positionRight: 180,
    positionLeft: null,
  ),
  OnboardingData(
    title: AppStrings.onboardingTitle2,
    description: AppStrings.onboardingDescription,
    imagePath: ImageAssets.onboarding2,
    positionRight: null,
    positionLeft: 180,
  ),
  OnboardingData(
    title: AppStrings.onboardingTitle3,
    description: AppStrings.onboardingDescription,
    imagePath: ImageAssets.onboarding3,
    positionRight: 180,
    positionLeft: null,
  ),
];
