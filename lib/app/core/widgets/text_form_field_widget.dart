import 'package:doctor_hunt/app/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData? suffixIcon;
  final bool? obscureText;
  final VoidCallback? onPressed;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const TextFormFieldWidget({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.obscureText,
    this.onPressed,
    this.controller,
    this.keyboardType,
    this.validator,
  });

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(12),
    );
  }

  @override
  Widget build(BuildContext context) {
    final normalColor = AppColors.textPlaceholder.withValues(alpha: 0.2);

    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
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
          enabledBorder: _border(normalColor),
          focusedBorder: _border(normalColor),
          errorBorder: _border(AppColors.danger),
          focusedErrorBorder: _border(AppColors.danger),
        ),
      ),
    );
  }
}
