import 'package:flutter/material.dart';

class XoraTypography {
  const XoraTypography._();

  static const String fontFamily = 'Google Sans';
  static const String logoFontFamily = 'Gliker';

  static const TextStyle display = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.5,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.25,
  );

  static const TextStyle title = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  static const TextStyle body = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle label = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0.4,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  static TextStyle logo(double size) => TextStyle(
        fontFamily: logoFontFamily,
        fontSize: size,
        fontWeight: FontWeight.w700,
        height: 1.1,
      );

  static TextTheme textTheme(Color color) => TextTheme(
        displayLarge: display.copyWith(color: color),
        headlineMedium: headline.copyWith(color: color),
        titleLarge: title.copyWith(color: color),
        titleMedium: subtitle.copyWith(color: color),
        bodyLarge: body.copyWith(color: color, fontSize: 16),
        bodyMedium: body.copyWith(color: color),
        bodySmall: bodySmall.copyWith(color: color),
        labelLarge: label.copyWith(color: color, fontSize: 14),
        labelMedium: label.copyWith(color: color),
        labelSmall: caption.copyWith(color: color),
      );
}

