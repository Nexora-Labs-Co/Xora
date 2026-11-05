import 'package:flutter/material.dart';

import '../../theme/xora_spacing.dart';

class OneTopBar extends StatelessWidget implements PreferredSizeWidget {
  const OneTopBar({
    super.key,
    this.title,
    this.leading,
    this.actions = const [],
    this.backgroundColor,
  });

  final Widget? title;
  final Widget? leading;
  final List<Widget> actions;
  final Color? backgroundColor;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Material(
      color: backgroundColor ?? scheme.surface,
      elevation: 0,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 56,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: XoraSpacing.lg),
            child: Row(
              children: [
                if (leading != null) ...[
                  leading!,
                  const SizedBox(width: XoraSpacing.md),
                ],
                Expanded(
                  child: DefaultTextStyle(
                    style: Theme.of(context).textTheme.titleMedium ?? const TextStyle(),
                    child: title ?? const SizedBox.shrink(),
                  ),
                ),
                ...actions,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

