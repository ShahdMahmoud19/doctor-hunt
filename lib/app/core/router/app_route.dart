import 'package:doctor_hunt/app/features/admin/home/presentation/screens/admin_home_screen.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/screens/admin_sign_in_screen.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/screens/sign_in_screen.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/screens/sign_up_screen.dart';
import 'package:doctor_hunt/app/features/common/onBoarding/presentation/screens/onboarding_screen.dart';
import 'package:doctor_hunt/app/features/common/role_selection/presentation/screens/role_selection_screen.dart';
import 'package:doctor_hunt/app/features/patient/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String onboarding = '/onboarding';
  static const String chooseRole = '/chooseRole';
  static const String adminLogin = '/adminLogin';
  static const String adminHome = '/adminHome';
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case chooseRole:
        return MaterialPageRoute(builder: (_) => const RoleSelectionScreen());
      case adminLogin:
        return MaterialPageRoute(builder: (_) => const AdminSignInScreen());
      case adminHome:
        return MaterialPageRoute(builder: (_) => const AdminHomeScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
