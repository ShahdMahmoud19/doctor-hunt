import 'package:doctor_hunt/translations/strings.g.dart';
import 'package:flutter/material.dart';

class Validators {
  static String? email(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return t.auth.emailRequired;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return t.auth.invalidEmail;
    }

    return null;
  }

  static String? password(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return t.auth.passwordRequired;
    }


    return null;
  }

  static String? name(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return t.auth.nameRequired;
    }
    return null;
  }
}
