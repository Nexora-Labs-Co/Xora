import 'package:flutter/material.dart';

import '../../theme/xora_colors.dart';
import '../../theme/xora_spacing.dart';

class XoraDivider extends StatelessWidget {
  const XoraDivider({super.key, this.indent = 0});

  final double indent;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.only(left: indent),
      child: Divider(
        color: isDark ? XoraColors.borderDark : XoraColors.border,
        height: XoraSpacing.lg,
      ),
    );
  }
}
