import 'package:doctor_hunt/app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class ButtonWidget extends StatelessWidget {
  final String textButton;
  final VoidCallback? onPressed;
  const ButtonWidget({super.key, required this.textButton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 280,
        height: 55,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: Text(textButton, style: context.bold18White)),
      ),
    );
  }
}
