import 'package:flutter/material.dart';

import '../../theme/xora_colors.dart';
import '../../theme/xora_radius.dart';
import '../../theme/xora_spacing.dart';

class OneBottomBarItem {
  const OneBottomBarItem({
    required this.icon,
    this.label,
  });

  final Widget icon;
  final String? label;
}

class OneBottomBar extends StatelessWidget {
  const OneBottomBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onTap,
  });

  final List<OneBottomBarItem> items;
  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.all(XoraSpacing.lg),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: XoraSpacing.sm,
              vertical: XoraSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: scheme.surface,
              borderRadius: BorderRadius.circular(XoraRadius.full),
              border: Border.all(color: scheme.outline),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < items.length; i++)
                  _OneBottomTile(
                    item: items[i],
                    selected: i == selectedIndex,
                    onTap: () => onTap(i),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OneBottomTile extends StatelessWidget {
  const _OneBottomTile({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final OneBottomBarItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final color = selected ? scheme.primary : XoraColors.textSecondary;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(XoraRadius.full),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: XoraSpacing.md,
          vertical: XoraSpacing.sm,
        ),
        child: IconTheme(
          data: IconThemeData(color: color, size: 20),
          child: item.icon,
        ),
      ),
    );
  }
}

