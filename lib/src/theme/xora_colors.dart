import 'package:flutter/material.dart';

class XoraColors {
  const XoraColors._();

  static const Color primary = Color(0xFF4F46E5);
  static const Color primaryHover = Color(0xFF4338CA);
  static const Color primaryPressed = Color(0xFF3730A3);
  static const Color onPrimary = Color(0xFFFFFFFF);

  static const Color secondary = Color(0xFF0EA5E9);
  static const Color secondaryHover = Color(0xFF0284C7);
  static const Color onSecondary = Color(0xFFFFFFFF);

  static const Color accent = Color(0xFFF59E0B);
  static const Color onAccent = Color(0xFF1F2937);

  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color danger = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  static const Color background = Color(0xFFF9FAFB);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF3F4F6);
  static const Color border = Color(0xFFE5E7EB);
  static const Color divider = Color(0xFFE5E7EB);

  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textDisabled = Color(0xFF9CA3AF);
  static const Color textInverse = Color(0xFFFFFFFF);

  static const Color backgroundDark = Color(0xFF0B1020);
  static const Color surfaceDark = Color(0xFF111827);
  static const Color surfaceVariantDark = Color(0xFF1F2937);
  static const Color borderDark = Color(0xFF374151);
  static const Color textPrimaryDark = Color(0xFFF9FAFB);
  static const Color textSecondaryDark = Color(0xFF9CA3AF);

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
