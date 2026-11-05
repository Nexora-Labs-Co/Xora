import 'package:flutter/material.dart';

import '../theme/xora_spacing.dart';

class XoraNexo extends StatelessWidget {
  const XoraNexo({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1280),
        child: Padding(
          padding: const EdgeInsets.all(XoraSpacing.xxl),
          child: child,
        ),
      ),
    );
  }
}
