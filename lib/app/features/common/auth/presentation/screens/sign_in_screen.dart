import 'package:doctor_hunt/app/core/router/app_route.dart';
import 'package:doctor_hunt/app/core/themes/app_colors.dart';
import 'package:doctor_hunt/app/core/utils/validator.dart';
import 'package:doctor_hunt/app/core/widgets/app_background.dart';
import 'package:doctor_hunt/app/core/widgets/text_form_field_widget.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/auth_widget.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/reset_password_widget.dart';
import 'package:doctor_hunt/translations/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controllers/auth_cubit.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controllers/auth_state.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isPasswordVisible = false;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: Builder(
        builder: (context) {
          return BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is SignInSuccess) {
                Navigator.pushReplacementNamed(context, AppRoute.home);
              } else if (state is AuthError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: AppColors.danger,
                  ),
                );
              }
            },
            builder: (context, state) {
              final isLoading = state is SignInLoading;
              return Scaffold(
                body: AppGradientBackground(
                  child: Center(
                    child: Form(
                      key: formKey,
                      child: AuthWidget(
                        title: t.auth.signInTitle,
                        subtitle: t.auth.signUpSubtitle,
                        textFields: [
                          TextFormFieldWidget(
                            hintText: t.auth.email,
                            suffixIcon: Icons.check,
                            controller: emailController,
                            validator: (value) =>
                                Validators.email(value, context),
                          ),
                          TextFormFieldWidget(
                            hintText: t.auth.password,
                            obscureText: !isPasswordVisible,
                            suffixIcon: isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            controller: passwordController,
                            validator: (value) =>
                                Validators.password(value, context),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                        ],
                        textButton: isLoading ? t.auth.signingIn : t.auth.login,
                        onPressed: isLoading
                            ? () {}
                            : () {
                                if (!formKey.currentState!.validate()) return;
                                context.read<AuthCubit>().signIn(
                                  email: emailController.text.trim(),
                                  password: passwordController.text,
                                );
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
                                googleSignInEnabled: false,
                                title: t.auth.forgotPassword,
                                subtitle: t.auth.verificationMessage,
                                textFields: [
                                  TextFormFieldWidget(
                                    hintText: t.auth.email,
                                    suffixIcon: Icons.check,
                                    controller: emailController,
                                  ),
                                ],
                                textButton: t.common.continueText,
                                onPressed: () {
                                  showModalBottomSheet(
                                    backgroundColor: AppColors.white,
                                    context: context,
                                    builder: (context) {
                                      return AuthWidget(
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
                ),
              );
            },
          );
        },
      ),
    );
  }
}