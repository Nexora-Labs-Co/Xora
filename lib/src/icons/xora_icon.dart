import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class XoraIcon extends StatelessWidget {
  const XoraIcon(
    this.icon, {
    super.key,
    this.size,
    this.color,
    this.semanticLabel,
  });

  final FaIconData icon;
  final double? size;
  final Color? color;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return FaIcon(
      icon,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
    );
  }
}

