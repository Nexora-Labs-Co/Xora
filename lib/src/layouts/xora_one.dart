import 'package:flutter/material.dart';

import '../theme/xora_spacing.dart';

class XoraOne extends StatelessWidget {
  const XoraOne({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(XoraSpacing.lg),
      child: child,
    );
  }
}
