import 'package:doctor_hunt/app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppGradientBackground extends StatelessWidget {
  final Widget child;

  const AppGradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.backgroundBlue.withValues(alpha: 0.5),
              AppColors.white.withValues(alpha: 0.1),
              AppColors.primary.withValues(alpha: 0.3),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: child,
      ),
    );
  }
}
