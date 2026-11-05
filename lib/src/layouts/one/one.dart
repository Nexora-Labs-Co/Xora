import 'package:flutter/material.dart';

import '../../theme/xora_spacing.dart';

class XoraOne extends StatelessWidget {
  const XoraOne({
    super.key,
    required this.child,
    this.topBar,
    this.bottomBar,
  });

  final Widget child;
  final Widget? topBar;
  final Widget? bottomBar;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ?topBar,
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(XoraSpacing.lg),
            child: child,
          ),
        ),
        ?bottomBar,
      ],
    );
  }
}

