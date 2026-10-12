import 'package:doctor_hunt/app/core/router/app_route.dart';
import 'package:doctor_hunt/translations/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class DoctorHunt extends StatelessWidget {
  const DoctorHunt({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       onGenerateRoute: AppRoute.onGenerateRoute,
       initialRoute: AppRoute.onboarding,
          locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
     // home: SignUpScreen(),
    );
  }
}
