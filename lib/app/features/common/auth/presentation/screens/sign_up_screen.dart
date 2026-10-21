import 'package:doctor_hunt/app/core/router/app_route.dart';
import 'package:doctor_hunt/app/core/utils/validator.dart';
import 'package:doctor_hunt/app/core/widgets/app_background.dart';
import 'package:doctor_hunt/app/core/widgets/text_form_field_widget.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controllers/auth_cubit.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controllers/auth_state.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/auth_widget.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/check_box_widget.dart';
import 'package:doctor_hunt/translations/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isPasswordVisible = false;

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
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
              if (state is SignUpSuccess) {
                if (state.requiresEmailConfirmation) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(t.auth.accountCreatedConfirmEmail),
                    ),
                  );

                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoute.login,
                    (route) => false,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(t.auth.accountCreated)),
                  );

                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoute.home,
                    (route) => false,
                  );
                }
              } else if (state is AuthError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              final isLoading = state is SignUpLoading;

              return Scaffold(
                body: AppGradientBackground(
                  child: Center(
                    child: Form(
                      key: formKey,
                      child: AuthWidget(
                        title: t.auth.signUpTitle,
                        subtitle: t.auth.signUpSubtitle,
                        textFields: [
                          TextFormFieldWidget(
                            hintText: t.auth.name,
                            controller: nameController,
                            validator: (value) =>
                                Validators.name(value, context),
                          ),
                          TextFormFieldWidget(
                            hintText: t.auth.email,
                            controller: emailController,
                            validator: (value) =>
                                Validators.email(value, context),
                          ),
                          TextFormFieldWidget(
                            hintText: t.auth.password,
                            controller: passwordController,
                            obscureText: !isPasswordVisible,
                            suffixIcon: isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
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
                            ? t.auth.creatingAccount
                            : t.auth.signup,
                        privcyPolicy: CheckBoxWidget(),
                        onPressed: isLoading
                            ? () {}
                            : () {
                                if (!formKey.currentState!.validate()) return;

                                context.read<AuthCubit>().signUp(
                                  name: nameController.text.trim(),
                                  email: emailController.text.trim(),
                                  password: passwordController.text,
                                );
                              },
                        linkPressed: () {
                          Navigator.pushNamed(context, AppRoute.login);
                        },
                        linkText: t.auth.haveAccount,
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