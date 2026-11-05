import 'package:flutter/material.dart';

import '../../theme/xora_colors.dart';
import '../../theme/xora_radius.dart';
import '../../theme/xora_shadows.dart';
import '../../theme/xora_spacing.dart';

class XoraCard extends StatelessWidget {
  const XoraCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(XoraSpacing.lg),
    this.onTap,
    this.elevated = false,
    this.border = true,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final bool elevated;
  final bool border;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? XoraColors.borderDark : XoraColors.border;
    final card = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(XoraRadius.lg),
        border: border ? Border.all(color: borderColor) : null,
        boxShadow: elevated ? XoraShadows.md : null,
      ),
      child: child,
    );
    if (onTap == null) return card;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(XoraRadius.lg),
      child: card,
    );
  }
}
