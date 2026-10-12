import 'package:doctor_hunt/doctor_hunt.dart';
import 'package:doctor_hunt/translations/strings.g.dart';
import 'package:flutter/material.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale(); // يستخدم لغة الجهاز
  runApp(TranslationProvider(child: const DoctorHunt()));
}

