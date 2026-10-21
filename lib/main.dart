import 'package:doctor_hunt/app/core/network/supabase_config.dart';
import 'package:doctor_hunt/doctor_hunt.dart';
import 'package:doctor_hunt/translations/strings.g.dart';
import 'package:flutter/material.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await SupabaseConfig.initialize();
  LocaleSettings.useDeviceLocale(); // يستخدم لغة الجهاز
  runApp(TranslationProvider(child: const DoctorHunt()));
}

