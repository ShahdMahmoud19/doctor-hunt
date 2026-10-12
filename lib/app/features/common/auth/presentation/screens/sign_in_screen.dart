import 'package:doctor_hunt/app/core/router/app_route.dart';
import 'package:doctor_hunt/app/core/themes/app_colors.dart';
import 'package:doctor_hunt/app/core/widgets/app_background.dart';
import 'package:doctor_hunt/app/core/widgets/text_form_field_widget.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/auth_widget.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/reset_password_widget.dart';
import 'package:doctor_hunt/translations/strings.g.dart';
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
            title: t.auth.signInTitle,
            subtitle: t.auth.signUpSubtitle,
            textFields: [
              TextFormFieldWidget(
                hintText: t.auth.email,
                suffixIcon: Icons.check,
              ),
              TextFormFieldWidget(
                hintText: t.auth.password,
                obscureText: !isPasswordVisible,
                suffixIcon: isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                onPressed: () => setState(() {
                  isPasswordVisible = !isPasswordVisible;
                }),
              ),
            ],
            textButton: t.auth.login,
            onPressed: () {
              //button action login
            },
            linkPressed: () {
              Navigator.pushNamed(context, AppRoute.register);
            },
            linkText: t.auth.dontHaveAccount,
            forgotPasswordText: t.auth.forgotPassword,
            forgotPasswordAction: () {
              showModalBottomSheet(
                backgroundColor: AppColors.white,
                context: context,
                builder: (context) {
                  return AuthWidget(
                    // paddingLeft: 100,
                    googleSignInEnabled: false,
                    title: t.auth.forgotPassword,
                    subtitle: t.auth.verificationMessage,
                    textFields:  [
                      TextFormFieldWidget(
                        hintText: t.auth.email,
                        suffixIcon: Icons.check,
                      ),
                    ],
                    textButton: t.common.continueText,
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: AppColors.white,
                        context: context,
                        builder: (context) {
                          return AuthWidget(
                            // paddingLeft: 100,
                            googleSignInEnabled: false,
                            title: t.auth.enterDigitsCode,
                            subtitle: t.auth.enterCodeMessage,
                            textFields: const [],
                            textButton: t.common.continueText,
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
