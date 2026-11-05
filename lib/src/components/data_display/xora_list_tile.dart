import 'package:flutter/material.dart';

import '../../theme/xora_colors.dart';
import '../../theme/xora_radius.dart';
import '../../theme/xora_spacing.dart';
import '../../theme/xora_typography.dart';

class XoraListTile extends StatelessWidget {
  const XoraListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
  });

  final Widget title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(XoraRadius.md),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: XoraSpacing.lg,
          vertical: XoraSpacing.md,
        ),
        child: Row(
          children: [
            if (leading != null) ...[
              leading!,
              const SizedBox(width: XoraSpacing.md),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTextStyle(
                    style: XoraTypography.subtitle.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    child: title,
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: XoraSpacing.xxs),
                    DefaultTextStyle(
                      style: XoraTypography.bodySmall.copyWith(
                        color: XoraColors.textSecondary,
                      ),
                      child: subtitle!,
                    ),
                  ],
                ],
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: XoraSpacing.md),
              trailing!,
            ],
          ],
        ),
      ),
    );
  }
}
