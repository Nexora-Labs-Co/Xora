import 'package:flutter/material.dart';

import '../../theme/xora_colors.dart';
import '../../theme/xora_radius.dart';
import '../../theme/xora_spacing.dart';
import '../../theme/xora_typography.dart';

enum XoraBadgeVariant { neutral, primary, success, warning, danger, info }

class XoraBadge extends StatelessWidget {
  const XoraBadge({
    super.key,
    required this.label,
    this.variant = XoraBadgeVariant.neutral,
    this.icon,
  });

  final String label;
  final XoraBadgeVariant variant;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final (bg, fg) = switch (variant) {
      XoraBadgeVariant.neutral => (XoraColors.surfaceVariant, XoraColors.textSecondary),
      XoraBadgeVariant.primary => (XoraColors.primary.withValues(alpha: 0.12), XoraColors.primary),
      XoraBadgeVariant.success => (XoraColors.success.withValues(alpha: 0.12), XoraColors.success),
      XoraBadgeVariant.warning => (XoraColors.warning.withValues(alpha: 0.12), XoraColors.warning),
      XoraBadgeVariant.danger => (XoraColors.danger.withValues(alpha: 0.12), XoraColors.danger),
      XoraBadgeVariant.info => (XoraColors.info.withValues(alpha: 0.12), XoraColors.info),
    };
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: XoraSpacing.sm,
        vertical: XoraSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(XoraRadius.full),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[icon!, const SizedBox(width: XoraSpacing.xs)],
          Text(label, style: XoraTypography.caption.copyWith(color: fg, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
