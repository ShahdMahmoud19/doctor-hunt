import 'package:doctor_hunt/app/core/router/app_route.dart';
import 'package:doctor_hunt/app/core/themes/app_colors.dart';
import 'package:doctor_hunt/app/core/utils/validator.dart';
import 'package:doctor_hunt/app/core/widgets/app_background.dart';
import 'package:doctor_hunt/app/core/widgets/text_form_field_widget.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controllers/auth_cubit.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controllers/auth_state.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/auth_widget.dart';
import 'package:doctor_hunt/translations/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminSignInScreen extends StatefulWidget {
  const AdminSignInScreen({super.key});

  @override
  State<AdminSignInScreen> createState() => _AdminSignInScreenState();
}

class _AdminSignInScreenState extends State<AdminSignInScreen> {
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

  void showMessage(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? AppColors.danger : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: Builder(
        builder: (context) {
          return BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AdminSignInSuccess) {
                Navigator.pushReplacementNamed(context, AppRoute.adminHome);
                showMessage(t.auth.adminLoginSuccess);
              } else if (state is AdminAccessDenied) {
                showMessage(t.auth.adminAccessDenied, isError: true);
              } else if (state is AuthError) {
                showMessage(state.message, isError: true);
              }
            },
            builder: (context, state) {
              final isLoading = state is AdminSignInLoading;

              return Scaffold(
                body: AppGradientBackground(
                  child: SafeArea(
                    child: Center(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Form(
                          key: formKey,
                          child: AuthWidget(
                            title: t.auth.adminSignIn,
                            subtitle: t.auth.adminSignInSubtitle,
                            googleSignInEnabled: false,
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
                            textButton: isLoading
                                ? t.auth.signingIn
                                : t.auth.login,
                            onPressed: isLoading
                                ? () {}
                                : () {
                                    if (!formKey.currentState!.validate()) {
                                      return;
                                    }

                                    context.read<AuthCubit>().adminSignIn(
                                      email: emailController.text.trim(),
                                      password: passwordController.text,
                                    );
                                  },
                            forgotPasswordText: t.auth.forgotPassword,
                            forgotPasswordAction: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: AppColors.white,
                                isScrollControlled: true,
                                builder: (sheetContext) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(
                                        sheetContext,
                                      ).viewInsets.bottom,
                                    ),
                                    child: AuthWidget(
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
                                        Navigator.pop(sheetContext);
                                        context.read<AuthCubit>().resetPassword(
                                          email: emailController.text.trim(),
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
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