import 'package:doctor_hunt/app/core/router/app_route.dart';
import 'package:doctor_hunt/app/core/widgets/app_background.dart';
import 'package:doctor_hunt/app/core/widgets/text_form_field_widget.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/auth_widget.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/check_box_widget.dart';
import 'package:doctor_hunt/translations/strings.g.dart';
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
            title: t.auth.signUpTitle,
            subtitle: t.auth.signUpSubtitle,
            textFields: [
              TextFormFieldWidget(hintText: t.auth.name),
              TextFormFieldWidget(hintText: t.auth.email),
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
            textButton: t.auth.signup,
            privcyPolicy: CheckBoxWidget(),
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoute.home);
            },
            linkPressed: () {
              Navigator.pushNamed(context, AppRoute.login);
            },
            linkText: t.auth.haveAccount,
          ),
        ),
      ),
    );
  }
}
