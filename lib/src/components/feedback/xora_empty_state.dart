import 'package:flutter/material.dart';

import '../../theme/xora_colors.dart';
import '../../theme/xora_spacing.dart';
import '../../theme/xora_typography.dart';

class XoraEmptyState extends StatelessWidget {
  const XoraEmptyState({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.action,
  });

  final String title;
  final String? subtitle;
  final Widget? icon;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(XoraSpacing.xxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              IconTheme(
                data: const IconThemeData(color: XoraColors.textSecondary, size: 48),
                child: icon!,
              ),
              const SizedBox(height: XoraSpacing.lg),
            ],
            Text(
              title,
              style: XoraTypography.title.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: XoraSpacing.sm),
              Text(
                subtitle!,
                style: XoraTypography.body.copyWith(color: XoraColors.textSecondary),
                textAlign: TextAlign.center,
              ),
            ],
            if (action != null) ...[
              const SizedBox(height: XoraSpacing.lg),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
