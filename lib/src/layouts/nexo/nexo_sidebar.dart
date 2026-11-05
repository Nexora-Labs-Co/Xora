import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../icons/xora_icon.dart';
import '../../icons/xora_icons.dart';
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

class NexoSidebar extends StatefulWidget {
  const NexoSidebar({
    super.key,
    this.appName,
    required this.items,
    this.state = NexoSidebarState.expanded,
    this.onStateChanged,
    this.userName,
    this.userStatus,
    this.userAvatar,
  });

  final String? appName;
  final List<NexoSidebarItem> items;
  final NexoSidebarState state;
  final ValueChanged<NexoSidebarState>? onStateChanged;
  final String? userName;
  final String? userStatus;
  final Widget? userAvatar;

  @override
  State<NexoSidebar> createState() => _NexoSidebarState();
}

class _NexoSidebarState extends State<NexoSidebar> {
  late NexoSidebarState _state = widget.state;

  void _cycle() {
    final next = switch (_state) {
      NexoSidebarState.expanded => NexoSidebarState.collapsed,
      NexoSidebarState.collapsed => NexoSidebarState.grid,
      NexoSidebarState.grid => NexoSidebarState.expanded,
    };
    setState(() => _state = next);
    widget.onStateChanged?.call(next);
  }

  bool get _expanded => _state == NexoSidebarState.expanded;
  bool get _grid => _state == NexoSidebarState.grid;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Material(
      color: scheme.surface,
      child: Column(
        children: [
          if (_expanded && widget.appName != null)
            Padding(
              padding: const EdgeInsets.all(XoraSpacing.lg),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.appName!,
                  style: XoraTypography.title.copyWith(color: scheme.onSurface),
                ),
              ),
            ),
          IconButton(
            onPressed: _cycle,
            icon: XoraIcon(
              _state == NexoSidebarState.expanded
                  ? XoraIcons.anglesLeft
                  : _state == NexoSidebarState.collapsed
                      ? XoraIcons.anglesRight
                      : XoraIcons.grip,
            ),
            tooltip: 'Cambiar barra lateral',
          ),
          const Divider(height: 1),
          Expanded(
            child: _grid
                ? GridView.count(
                    crossAxisCount: 3,
                    padding: const EdgeInsets.all(XoraSpacing.sm),
                    children: [
                      for (final item in widget.items) _GridTile(item: item),
                    ],
                  )
                : ListView(
                    children: [
                      for (final item in widget.items)
                        _SidebarTile(item: item, collapsed: !_expanded),
                    ],
                  ),
          ),
          if (widget.userName != null) ...[
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(XoraSpacing.md),
              child: _expanded
                  ? Row(
                      children: [
                        widget.userAvatar ??
                            XoraIcon(XoraIcons.user, size: 32),
                        const SizedBox(width: XoraSpacing.md),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.userName!,
                                  style: XoraTypography.subtitle
                                      .copyWith(color: scheme.onSurface)),
                              if (widget.userStatus != null)
                                Text(widget.userStatus!,
                                    style: XoraTypography.caption
                                        .copyWith(color: XoraColors.textSecondary)),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: widget.userAvatar ??
                          XoraIcon(XoraIcons.user, size: 24),
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

