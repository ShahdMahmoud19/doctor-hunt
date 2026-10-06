import 'package:doctor_hunt/app/core/router/app_route.dart';
import 'package:doctor_hunt/app/core/themes/app_colors.dart';
import 'package:doctor_hunt/app/core/utils/app_string.dart';
import 'package:doctor_hunt/app/core/widgets/app_background.dart';
import 'package:doctor_hunt/app/core/widgets/text_form_field_widget.dart';
import 'package:doctor_hunt/app/features/auth/presentation/widgets/auth_widget.dart';
import 'package:doctor_hunt/app/features/auth/presentation/widgets/reset_password_widget.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBackground(
        child: Center(
          
          child: AuthWidget(
            title: AppStrings.signInTitle,
            subtitle: AppStrings.signUpSubtitle,
            textFields: [
              TextFormFieldWidget(
                hintText: AppStrings.email,
                suffixIcon: Icons.check,
              ),
              TextFormFieldWidget(
                hintText: AppStrings.password,
                obscureText: !isPasswordVisible,
                suffixIcon: isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                onPressed: () => setState(() {
                  isPasswordVisible = !isPasswordVisible;
                }),
              ),
            ],
            textButton: AppStrings.login,
            onPressed: () {
              //button action login
            },
            linkPressed: () {
              Navigator.pushNamed(context, AppRoute.register);
            },
            linkText: AppStrings.dontHaveAccount,
            forgotPasswordText: AppStrings.forgotPassword,
            forgotPasswordAction: () {
              showModalBottomSheet(
                backgroundColor: AppColors.white,
                context: context,
                builder: (context) {
                  return AuthWidget(
                    // paddingLeft: 100,
                    googleSignInEnabled: false,
                    title: AppStrings.forgotPassword,
                    subtitle: AppStrings.verificationMessage,
                    textFields: const [
                      TextFormFieldWidget(
                        hintText: AppStrings.email,
                        suffixIcon: Icons.check,
                      ),
                    ],
                    textButton: AppStrings.continueText,
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: AppColors.white,
                        context: context,
                        builder: (context) {
                          return AuthWidget(
                            // paddingLeft: 100,
                            googleSignInEnabled: false,
                            title: AppStrings.enterDigitsCode,
                            subtitle: AppStrings.enterCodeMessage,
                            textFields: const [],
                            textButton: AppStrings.continueText,
                            onPressed: () {
                              showModalBottomSheet(
                                backgroundColor: AppColors.white,
                                context: context,
                                builder: (context) {
                                  return const ResetPasswordBottomSheet();
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
