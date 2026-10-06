import 'package:doctor_hunt/app/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData? suffixIcon;
  final bool? obscureText;
  final VoidCallback? onPressed;
  const TextFormFieldWidget({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.obscureText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: TextFormField(
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: Icon(suffixIcon, color: AppColors.textPlaceholder),
                  onPressed: onPressed,
                )
              : null,
          hintText: hintText,
          hintStyle: context.regular16TextPlaceholder,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.textPlaceholder.withValues(alpha: 0.2),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.textPlaceholder.withValues(alpha: 0.2),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
