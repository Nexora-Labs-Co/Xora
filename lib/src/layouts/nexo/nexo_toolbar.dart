import 'package:flutter/material.dart';

import '../../theme/xora_spacing.dart';

class NexoToolbar extends StatelessWidget implements PreferredSizeWidget {
  const NexoToolbar({
    super.key,
    this.leading,
    this.title,
    this.actions = const [],
    this.height = 56,
  });

  final Widget? leading;
  final Widget? title;
  final List<Widget> actions;
  final double height;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Material(
      color: scheme.surface,
      elevation: 0,
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
              if (title != null)
                Expanded(child: title!)
              else
                const Spacer(),
              ...actions,
            ],
          ),
        ),
      ),
    );
  }
}

