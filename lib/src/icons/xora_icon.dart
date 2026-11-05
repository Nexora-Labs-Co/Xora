import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme/xora_colors.dart';

class XoraIcon extends StatefulWidget {
  const XoraIcon(
    this.icon, {
    super.key,
    this.size,
    this.color,
    this.semanticLabel,
    this.hoverable = true,
  });

  final FaIconData icon;
  final double? size;
  final Color? color;
  final String? semanticLabel;
  final bool hoverable;

  @override
  State<XoraIcon> createState() => _XoraIconState();
}

class _XoraIconState extends State<XoraIcon> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);
    final size = widget.size ?? iconTheme.size ?? 24;
    final baseColor = widget.color ?? iconTheme.color;
    final color = widget.hoverable && _hovering
        ? XoraColors.primary
        : baseColor;
    Widget icon = FaIcon(
      widget.icon,
      size: size,
      color: color,
      semanticLabel: widget.semanticLabel,
    );
    if (widget.hoverable) {
      icon = MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovering = true),
        onExit: (_) => setState(() => _hovering = false),
        child: icon,
      );
    }
    return icon;
  }
}

