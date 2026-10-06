import 'package:doctor_hunt/app/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import '../../data/onboarding_data.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;

  const OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 400,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -60,
                  right: data.positionRight,
                  left: data.positionLeft,
                  child: CircleAvatar(
                    radius: 150,
                    backgroundColor: AppColors.primary,
                  ),
                ),

                Center(child: Image.asset(data.imagePath, height: 280)),
              ],
            ),
          ),
          const SizedBox(height: 60),
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: context.bold28TextMain,
          ),
          const SizedBox(height: 16),

          Text(
            data.description,
            textAlign: TextAlign.center,
            style: context.regular16TextPlaceholder,
          ),

          const SizedBox(height: 55),
        ],
      ),
    );
  }
}
