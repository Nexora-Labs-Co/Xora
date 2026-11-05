import 'package:flutter/material.dart';

import '../../theme/xora_spacing.dart';

class NexoToolbar extends StatelessWidget implements PreferredSizeWidget {
  const NexoToolbar({
    super.key,
    this.leading,
    this.title,
    this.actions = const [],
    this.height = 58,
    this.backgroundColor,
  });

  final Widget? leading;
  final Widget? title;
  final List<Widget> actions;
  final double height;
  final Color? backgroundColor;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final bg = backgroundColor ?? scheme.surface;
    final fg = backgroundColor != null ? Colors.white : scheme.onSurface;
    return Material(
      color: bg,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: backgroundColor != null ? Colors.white24 : scheme.outline)),
        ),
        child: SizedBox(
          height: height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: XoraSpacing.lg),
            child: Row(
              children: [
                if (leading != null) ...[
                  leading!,
                  const SizedBox(width: XoraSpacing.md),
                ],
                if (title != null) Expanded(child: DefaultTextStyle(style: TextStyle(color: fg), child: title!)) else const Spacer(),
                ...actions,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

