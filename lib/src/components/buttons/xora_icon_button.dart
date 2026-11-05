import 'package:flutter/material.dart';

import '../../theme/xora_radius.dart';

class XoraIconButton extends StatelessWidget {
  const XoraIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.size = 40,
    this.backgroundColor,
    this.foregroundColor,
    this.tooltip,
  });

  final Widget icon;
  final VoidCallback? onPressed;
  final double size;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final bg = backgroundColor ?? scheme.surface;
    final fg = foregroundColor ?? scheme.onSurface;
    final button = Material(
      color: bg,
      borderRadius: BorderRadius.circular(XoraRadius.md),
      child: InkWell(
        onTap: onPressed,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        borderRadius: BorderRadius.circular(XoraRadius.md),
        child: SizedBox(
          width: size,
          height: size,
          child: Center(
            child: IconTheme(
              data: IconThemeData(color: fg, size: size * 0.5),
              child: icon,
            ),
          ),
        ),
      ),
    );
    if (tooltip == null) return button;
    return Tooltip(message: tooltip!, child: button);
  }
}

