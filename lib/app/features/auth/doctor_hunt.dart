import 'package:doctor_hunt/app/core/router/app_route.dart';
import 'package:flutter/material.dart';

class DoctorHunt extends StatelessWidget {
  const DoctorHunt({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(fontFamily: 'Rubik'),
       onGenerateRoute: AppRoute.onGenerateRoute,
       initialRoute: AppRoute.onboarding,
     // home: SignUpScreen(),
    );
  }
}
