import 'package:flutter/material.dart';

class XoraOne extends StatelessWidget {
  const XoraOne({super.key, required this.child, this.topBar, this.bottomBar});

  final Widget child;
  final Widget? topBar;
  final Widget? bottomBar;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            ?topBar,
            Expanded(child: child),
          ],
        ),
        ?(bottomBar == null
            ? null
            : Positioned(left: 0, right: 0, bottom: 0, child: bottomBar!)),
      ],
    );
  }
}
