import 'package:flutter/material.dart';

import '../../theme/xora_spacing.dart';

class XoraSlate extends StatelessWidget {
  const XoraSlate({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 840),
        child: Padding(
          padding: const EdgeInsets.all(XoraSpacing.xl),
          child: child,
        ),
      ),
    );
  }
}

