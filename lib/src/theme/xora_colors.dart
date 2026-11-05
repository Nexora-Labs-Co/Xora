import 'package:flutter/material.dart';

class XoraColors {
  const XoraColors._();

  static const Color primary = Color(0xFFA50021);
  static const Color primaryHover = Color(0xFF8A001C);
  static const Color primaryPressed = Color(0xFF6F0017);
  static const Color onPrimary = Color(0xFFEBF5EE);

  static const Color secondary = Color(0xFF0EA5E9);
  static const Color secondaryHover = Color(0xFF0284C7);
  static const Color onSecondary = Color(0xFFEBF5EE);

  static const Color accent = Color(0xFFF59E0B);
  static const Color onAccent = Color(0xFF090C02);

  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color danger = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  static const Color background = Color(0xFFEBF5EE);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFDCE9E0);
  static const Color border = Color(0xFFB7C9BC);
  static const Color divider = Color(0xFFB7C9BC);

  static const Color textPrimary = Color(0xFF090C02);
  static const Color textSecondary = Color(0xFF3A4030);
  static const Color textDisabled = Color(0xFF7A8470);
  static const Color textInverse = Color(0xFFEBF5EE);

  static const Color backgroundDark = Color(0xFF090C02);
  static const Color surfaceDark = Color(0xFF141A0E);
  static const Color surfaceVariantDark = Color(0xFF1F2918);
  static const Color borderDark = Color(0xFF3A4030);
  static const Color textPrimaryDark = Color(0xFFEBF5EE);
  static const Color textSecondaryDark = Color(0xFFB7C9BC);

  static ColorScheme lightScheme() => const ColorScheme(
        brightness: Brightness.light,
        primary: primary,
        onPrimary: onPrimary,
        secondary: secondary,
        onSecondary: onSecondary,
        tertiary: accent,
        onTertiary: onAccent,
        error: danger,
        onError: onPrimary,
        surface: surface,
        onSurface: textPrimary,
        surfaceContainerHighest: surfaceVariant,
        outline: border,
      );

  static ColorScheme darkScheme() => const ColorScheme(
        brightness: Brightness.dark,
        primary: primary,
        onPrimary: onPrimary,
        secondary: secondary,
        onSecondary: onSecondary,
        tertiary: accent,
        onTertiary: onAccent,
        error: danger,
        onError: onPrimary,
        surface: surfaceDark,
        onSurface: textPrimaryDark,
        surfaceContainerHighest: surfaceVariantDark,
        outline: borderDark,
      );
}

