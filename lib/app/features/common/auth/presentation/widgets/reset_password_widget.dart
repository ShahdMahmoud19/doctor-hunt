import 'package:doctor_hunt/app/core/widgets/text_form_field_widget.dart';
import 'package:doctor_hunt/translations/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/auth_widget.dart';
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
      title: t.auth.resetPassword,
      subtitle: t.auth.setNewPassword,
      textFields: [
        TextFormFieldWidget(
          hintText: t.auth.password,
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
          hintText: t.auth.confirmPassword,
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
      textButton: t.auth.updatePassword,
      onPressed: () {},
    );
  }
}
