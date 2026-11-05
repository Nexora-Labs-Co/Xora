import 'package:flutter/material.dart';

import '../../theme/xora_colors.dart';
import '../../theme/xora_spacing.dart';

class OneBottomBarItem {
  const OneBottomBarItem({
    required this.icon,
    required this.label,
  });

  final Widget icon;
  final String label;
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
    return Material(
      color: scheme.surface,
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconTheme(data: IconThemeData(color: color, size: 20), child: item.icon),
          const SizedBox(height: XoraSpacing.xxs),
          Text(item.label, style: TextStyle(color: color, fontSize: 11)),
        ],
      ),
    );
  }
}

