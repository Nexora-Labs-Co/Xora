import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../components/data_display/xora_avatar.dart';
import '../../icons/xora_icon.dart';
import '../../theme/xora_colors.dart';
import '../../theme/xora_spacing.dart';
import '../../theme/xora_typography.dart';

enum NexoSidebarState { expanded, collapsed, grid }

class NexoSidebarItem {
  const NexoSidebarItem({
    required this.label,
    required this.icon,
    this.onTap,
    this.selected = false,
  });

  final String label;
  final FaIconData icon;
  final VoidCallback? onTap;
  final bool selected;
}

class NexoSidebar extends StatelessWidget {
  const NexoSidebar({
    super.key,
    this.appName,
    required this.items,
    this.state = NexoSidebarState.expanded,
    this.onStateChanged,
    this.userName,
    this.userStatus,
    this.userAvatar,
    this.userInitials,
  });

  final String? appName;
  final List<NexoSidebarItem> items;
  final NexoSidebarState state;
  final ValueChanged<NexoSidebarState>? onStateChanged;
  final String? userName;
  final String? userStatus;
  final Widget? userAvatar;
  final String? userInitials;

  bool get _expanded => state == NexoSidebarState.expanded;
  bool get _grid => state == NexoSidebarState.grid;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Material(
      color: scheme.surface,
      child: Column(
        children: [
          if (_expanded && appName != null)
            Padding(
              padding: const EdgeInsets.all(XoraSpacing.lg),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  appName!,
                  style: XoraTypography.logo(22).copyWith(color: scheme.onSurface),
                ),
              ),
            ),
          const Divider(height: 1),
          Expanded(
            child: _grid
                ? GridView.count(
                    crossAxisCount: 3,
                    padding: const EdgeInsets.all(XoraSpacing.sm),
                    children: [
                      for (final item in items) _GridTile(item: item),
                    ],
                  )
                : ListView(
                    children: [
                      for (final item in items)
                        _SidebarTile(item: item, collapsed: !_expanded),
                    ],
                  ),
          ),
          if (userName != null) ...[
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(XoraSpacing.md),
              child: _expanded
                  ? Row(
                      children: [
                        userAvatar ??
                            XoraAvatar(initials: userInitials ?? ''),
                        const SizedBox(width: XoraSpacing.md),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(userName!,
                                  style: XoraTypography.subtitle
                                      .copyWith(color: scheme.onSurface)),
                              if (userStatus != null)
                                Text(userStatus!,
                                    style: XoraTypography.caption
                                        .copyWith(color: XoraColors.textSecondary)),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: userAvatar ??
                          XoraAvatar(initials: userInitials ?? '', size: 24),
                    ),
            ),
          ],
        ],
      ),
    );
  }
}

class _SidebarTile extends StatelessWidget {
  const _SidebarTile({required this.item, required this.collapsed});

  final NexoSidebarItem item;
  final bool collapsed;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return ListTile(
      leading: XoraIcon(item.icon, color: item.selected ? scheme.primary : null),
      title: collapsed ? null : Text(item.label),
      selected: item.selected,
      onTap: item.onTap,
      dense: true,
    );
  }
}

class _GridTile extends StatelessWidget {
  const _GridTile({required this.item});

  final NexoSidebarItem item;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: item.onTap,
      child: Center(
        child: XoraIcon(item.icon, color: item.selected ? scheme.primary : null),
      ),
    );
  }
}

