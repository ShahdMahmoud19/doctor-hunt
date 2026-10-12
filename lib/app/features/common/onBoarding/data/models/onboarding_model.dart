import 'package:doctor_hunt/app/core/utils/image_assets.dart';
import 'package:doctor_hunt/translations/strings.g.dart';

class OnboardingModel {
  final String title;
  final String description;
  final String imagePath;
  final double? positionRight;
  final double? positionLeft;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.positionRight,
    required this.positionLeft,
  });
}

List<OnboardingModel> getOnboardingDataList(Translations t) => [
  OnboardingModel(
    title: t.onboarding.title1,
    description: t.onboarding.description,
    imagePath: ImageAssets.onboarding1,
    positionRight: 180,
    positionLeft: null,
  ),
  OnboardingModel(
    title: t.onboarding.title2,
    description: t.onboarding.description,
    imagePath: ImageAssets.onboarding2,
    positionRight: null,
    positionLeft: 180,
  ),
  OnboardingModel(
    title: t.onboarding.title3,
    description: t.onboarding.description,
    imagePath: ImageAssets.onboarding3,
    positionRight: 180,
    positionLeft: null,
  ),
];
