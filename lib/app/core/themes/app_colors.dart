import 'package:flutter/material.dart';

abstract class AppColors {
  // =========================
  // Primary
  // =========================

  static const Color primary = Color(0xFF0EBE7F);

  // Light green from Figma:
  // #0EBE7E4D → 30% opacity
  static const Color primaryLight = Color(0x4D0EBE7E);

  // Darker green from Figma
  static const Color primaryDark = Color(0xFF07D9AD);

  // =========================
  // Secondary
  // =========================

  static const Color secondary = Color(0xFF006C49);

  // No separate light secondary color was provided
  static const Color secondaryLight = Color(0xFF006C49);

  // No separate dark secondary color was provided
  static const Color secondaryDark = Color(0xFF006C49);

  // =========================
  // Text
  // =========================

  static const Color textMain = Color(0xFF000000);

  // #677294E5 → 90% opacity
  static const Color textSub = Color(0xE5677294);

  // #677294
  static const Color textPlaceholder = Color(0xFF677294);

  // #67729429 → ~16% opacity
  static const Color textBorders = Color(0x29677294);

  // =========================
  // Status colors
  // =========================

  // Not provided in the Figma colors you sent.
  // Temporary values so the generator can compile.
  static const Color danger = Color(0xFFE53935);
  static const Color dangerLight = Color(0xFFFFEBEE);

  static const Color success = Color(0xFF0EBE7F);
  static const Color successLight = Color(0x4D0EBE7E);

  static const Color warning = Color(0xFFFFB300);
  static const Color warningLight = Color(0xFFFFF8E1);

  // =========================
  // Basic
  // =========================

  static const Color white = Colors.white;
  static const Color black = Colors.black;

  // Used by the generator as a COLOR.
  static const Color boxShadow = Color(0x14000000);

  // =========================
  // Splash
  // =========================

  // Figma: #61CEFFB8 → 72% opacity
  static const Color backgroundBlue = Color(0xFF61CEFF);
}
