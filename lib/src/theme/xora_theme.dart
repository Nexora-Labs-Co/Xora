import 'package:flutter/material.dart';

import 'xora_colors.dart';
import 'xora_radius.dart';
import 'xora_spacing.dart';
import 'xora_typography.dart';

class XoraTheme {
  const XoraTheme._();

  static ThemeData light() => _build(XoraColors.lightScheme(), Brightness.light);

  static ThemeData dark() => _build(XoraColors.darkScheme(), Brightness.dark);

  static ThemeData _build(ColorScheme scheme, Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final textPrimary =
        isDark ? XoraColors.textPrimaryDark : XoraColors.textPrimary;
    final textSecondary =
        isDark ? XoraColors.textSecondaryDark : XoraColors.textSecondary;
    final border = isDark ? XoraColors.borderDark : XoraColors.border;
    final surfaceVariant =
        isDark ? XoraColors.surfaceVariantDark : XoraColors.surfaceVariant;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor:
          isDark ? XoraColors.backgroundDark : XoraColors.background,
      textTheme: XoraTypography.textTheme(textPrimary),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: textPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: XoraTypography.title.copyWith(color: textPrimary),
      ),
      cardTheme: CardThemeData(
        color: scheme.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(XoraRadius.lg),
          side: BorderSide(color: border),
        ),
        margin: EdgeInsets.zero,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: XoraSpacing.lg,
            vertical: XoraSpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(XoraRadius.md),
          ),
          textStyle: XoraTypography.label.copyWith(fontSize: 14),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.primary,
          side: BorderSide(color: scheme.primary),
          padding: const EdgeInsets.symmetric(
            horizontal: XoraSpacing.lg,
            vertical: XoraSpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(XoraRadius.md),
          ),
          textStyle: XoraTypography.label.copyWith(fontSize: 14),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: scheme.primary,
          padding: const EdgeInsets.symmetric(
            horizontal: XoraSpacing.md,
            vertical: XoraSpacing.sm,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(XoraRadius.md),
          ),
          textStyle: XoraTypography.label.copyWith(fontSize: 14),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: XoraSpacing.lg,
          vertical: XoraSpacing.md,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(XoraRadius.md),
          borderSide: BorderSide(color: border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(XoraRadius.md),
          borderSide: BorderSide(color: border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(XoraRadius.md),
          borderSide: BorderSide(color: scheme.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(XoraRadius.md),
          borderSide: BorderSide(color: XoraColors.danger),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(XoraRadius.md),
          borderSide: BorderSide(color: XoraColors.danger, width: 1.5),
        ),
        labelStyle: XoraTypography.body.copyWith(color: textSecondary),
        hintStyle: XoraTypography.body.copyWith(color: textSecondary),
        errorStyle: XoraTypography.bodySmall.copyWith(color: XoraColors.danger),
      ),
      dividerTheme: DividerThemeData(
        color: border,
        thickness: 1,
        space: XoraSpacing.lg,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: surfaceVariant,
        selectedColor: scheme.primary.withValues(alpha: 0.12),
        labelStyle: XoraTypography.bodySmall.copyWith(color: textPrimary),
        padding: const EdgeInsets.symmetric(
          horizontal: XoraSpacing.sm,
          vertical: XoraSpacing.xs,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(XoraRadius.full),
          side: BorderSide(color: border),
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return scheme.onPrimary;
          }
          return textSecondary;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return scheme.primary;
          }
          return border;
        }),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return scheme.primary;
          }
          return Colors.transparent;
        }),
        side: BorderSide(color: border, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(XoraRadius.xs),
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return scheme.primary;
          }
          return border;
        }),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: scheme.primary,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: isDark ? XoraColors.surfaceDark : XoraColors.textPrimary,
        contentTextStyle: XoraTypography.body.copyWith(color: XoraColors.textInverse),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(XoraRadius.md),
        ),
        behavior: SnackBarBehavior.floating,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: scheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(XoraRadius.xl),
        ),
        titleTextStyle: XoraTypography.title.copyWith(color: textPrimary),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(XoraRadius.xl),
          ),
        ),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: isDark ? XoraColors.surfaceVariantDark : XoraColors.textPrimary,
          borderRadius: BorderRadius.circular(XoraRadius.sm),
        ),
        textStyle: XoraTypography.caption.copyWith(color: XoraColors.textInverse),
      ),
    );
  }
}
