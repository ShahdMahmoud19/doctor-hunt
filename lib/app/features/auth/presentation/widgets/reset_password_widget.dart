import 'package:doctor_hunt/app/core/utils/app_string.dart';
import 'package:doctor_hunt/app/core/widgets/text_form_field_widget.dart';
import 'package:doctor_hunt/app/features/auth/presentation/widgets/auth_widget.dart';
import 'package:flutter/material.dart';

class ResetPasswordBottomSheet extends StatefulWidget {
  const ResetPasswordBottomSheet({super.key});

  @override
  State<ResetPasswordBottomSheet> createState() =>
      _ResetPasswordBottomSheetState();
}

class _ResetPasswordBottomSheetState extends State<ResetPasswordBottomSheet> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return AuthWidget(
      googleSignInEnabled: false,
      title: AppStrings.resetPassword,
      subtitle: AppStrings.setNewPassword,
      textFields: [
        TextFormFieldWidget(
          hintText: AppStrings.password,
          obscureText: !isPasswordVisible,
          suffixIcon: isPasswordVisible
              ? Icons.visibility
              : Icons.visibility_off,
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
        ),
        TextFormFieldWidget(
          hintText: AppStrings.confirmPassword,
          obscureText: !isConfirmPasswordVisible,
          suffixIcon: isConfirmPasswordVisible
              ? Icons.visibility
              : Icons.visibility_off,
          onPressed: () {
            setState(() {
              isConfirmPasswordVisible = !isConfirmPasswordVisible;
            });
          },
        ),
      ],
      textButton: AppStrings.updatePassword,
      onPressed: () {},
    );
  }
}
