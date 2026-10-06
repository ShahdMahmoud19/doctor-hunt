import 'package:doctor_hunt/app/core/router/app_route.dart';
import 'package:doctor_hunt/app/core/utils/app_string.dart';
import 'package:doctor_hunt/app/core/widgets/app_background.dart';
import 'package:doctor_hunt/app/core/widgets/text_form_field_widget.dart';
import 'package:doctor_hunt/app/features/auth/presentation/widgets/auth_widget.dart';
import 'package:doctor_hunt/app/features/auth/presentation/widgets/check_box_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBackground(
        child: Center(
          child: AuthWidget(
           // paddingLeft: 40,
            title: AppStrings.signUpTitle,
            subtitle: AppStrings.signUpSubtitle,
            textFields: [
              TextFormFieldWidget(hintText: AppStrings.name),
              TextFormFieldWidget(hintText: AppStrings.email),
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
            textButton: AppStrings.signup,
            privcyPolicy: CheckBoxWidget(),
            onPressed: () {
              //button action signup
            },
            linkPressed: () {
              Navigator.pushNamed(context, AppRoute.login);
            },
            linkText: AppStrings.haveAccount,
          ),
        ),
      ),
    );
  }
}
