import 'package:flutter/material.dart';

class NexoCanvas extends StatelessWidget {
  const NexoCanvas({
    super.key,
    required this.child,
    this.toolbar,
  });

  final Widget child;
  final Widget? toolbar;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ?toolbar,
        Expanded(child: child),
      ],
    );
  }
}

