import 'package:doctor_hunt/app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:doctor_hunt/app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:doctor_hunt/app/features/onBoarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String onboarding = '/onboarding';
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      // case home:
      //   return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}