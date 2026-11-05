import 'package:flutter/material.dart';

import 'xora_breakpoints.dart';

class XoraResponsive extends StatelessWidget {
  const XoraResponsive({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= XoraBreakpoints.tablet && desktop != null) {
      return desktop!;
    }
    if (width >= XoraBreakpoints.mobile && tablet != null) {
      return tablet!;
    }
    return mobile;
  }
}

