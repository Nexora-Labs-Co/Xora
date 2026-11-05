import 'package:flutter/material.dart';

import 'nexo_bottom_bar.dart';

class XoraNexo extends StatelessWidget {
  const XoraNexo({
    super.key,
    required this.child,
    this.leftSidebar,
    this.rightPanel,
    this.leftWidth = 260,
    this.rightWidth = 320,
    this.appVersion,
    this.bottomActions = const [],
  });

  final Widget child;
  final Widget? leftSidebar;
  final Widget? rightPanel;
  final double leftWidth;
  final double rightWidth;
  final String? appVersion;
  final List<Widget> bottomActions;

  @override
  Widget build(BuildContext context) {
    final hasBottom = appVersion != null || bottomActions.isNotEmpty;
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              if (leftSidebar != null)
                SizedBox(width: leftWidth, child: leftSidebar),
              if (leftSidebar != null) const VerticalDivider(width: 1),
              Expanded(child: child),
              if (rightPanel != null) const VerticalDivider(width: 1),
              if (rightPanel != null)
                SizedBox(width: rightWidth, child: rightPanel),
            ],
          ),
        ),
        if (hasBottom)
          NexoBottomBar(appVersion: appVersion, actions: bottomActions),
      ],
    );
  }
}

