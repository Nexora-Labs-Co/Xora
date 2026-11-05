import 'package:flutter/material.dart';


class XoraNexo extends StatelessWidget {
  const XoraNexo({
    super.key,
    required this.child,
    this.leftSidebar,
    this.rightPanel,
    this.leftWidth = 260,
    this.rightWidth = 320,
  });

  final Widget child;
  final Widget? leftSidebar;
  final Widget? rightPanel;
  final double leftWidth;
  final double rightWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (leftSidebar != null)
          SizedBox(width: leftWidth, child: leftSidebar),
        if (leftSidebar != null) const VerticalDivider(width: 1),
        Expanded(child: child),
        if (rightPanel != null) const VerticalDivider(width: 1),
        if (rightPanel != null)
          SizedBox(width: rightWidth, child: rightPanel),
      ],
    );
  }
}

