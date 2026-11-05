import 'package:flutter/material.dart';

import '../../theme/xora_colors.dart';
import '../../theme/xora_radius.dart';
import '../../theme/xora_spacing.dart';
import '../../theme/xora_typography.dart';

enum XoraButtonVariant { primary, secondary, outline, ghost, danger }
enum XoraButtonSize { sm, md, lg }

class XoraButton extends StatelessWidget {
  const XoraButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = XoraButtonVariant.primary,
    this.size = XoraButtonSize.md,
    this.icon,
    this.loading = false,
    this.fullWidth = false,
    this.disabled = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final XoraButtonVariant variant;
  final XoraButtonSize size;
  final Widget? icon;
  final bool loading;
  final bool fullWidth;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final effectiveDisabled = disabled || loading || onPressed == null;

    final padding = switch (size) {
      XoraButtonSize.sm => const EdgeInsets.symmetric(
          horizontal: XoraSpacing.md,
          vertical: XoraSpacing.xs,
        ),
      XoraButtonSize.md => const EdgeInsets.symmetric(
          horizontal: XoraSpacing.lg,
          vertical: XoraSpacing.md,
        ),
      XoraButtonSize.lg => const EdgeInsets.symmetric(
          horizontal: XoraSpacing.xl,
          vertical: XoraSpacing.lg,
        ),
    };

    final textStyle = switch (size) {
      XoraButtonSize.sm => XoraTypography.label.copyWith(fontSize: 12),
      XoraButtonSize.md => XoraTypography.label.copyWith(fontSize: 14),
      XoraButtonSize.lg => XoraTypography.label.copyWith(fontSize: 16),
    };

    final (bg, fg, border) = switch (variant) {
      XoraButtonVariant.primary => (scheme.primary, scheme.onPrimary, Colors.transparent),
      XoraButtonVariant.secondary => (XoraColors.secondary, XoraColors.onSecondary, Colors.transparent),
      XoraButtonVariant.outline => (Colors.transparent, scheme.primary, scheme.primary),
      XoraButtonVariant.ghost => (Colors.transparent, scheme.primary, Colors.transparent),
      XoraButtonVariant.danger => (XoraColors.danger, XoraColors.onPrimary, Colors.transparent),
    };

    final iconSize = switch (size) {
      XoraButtonSize.sm => 14.0,
      XoraButtonSize.md => 16.0,
      XoraButtonSize.lg => 18.0,
    };

    final child = loading
        ? SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(fg),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                IconTheme(
                  data: IconThemeData(color: fg, size: iconSize),
                  child: icon!,
                ),
                const SizedBox(width: XoraSpacing.sm),
              ],
              Text(label, style: textStyle.copyWith(color: fg)),
            ],
          );

    final button = Material(
      color: effectiveDisabled ? bg.withValues(alpha: 0.5) : bg,
      borderRadius: BorderRadius.circular(XoraRadius.md),
      child: InkWell(
        onTap: effectiveDisabled ? null : onPressed,
        borderRadius: BorderRadius.circular(XoraRadius.md),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            border: Border.all(
              color: effectiveDisabled ? border.withValues(alpha: 0.5) : border,
            ),
            borderRadius: BorderRadius.circular(XoraRadius.md),
          ),
          child: Center(child: child),
        ),
      ),
    );

    if (fullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }
    return button;
  }
}
