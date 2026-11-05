import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../icons/xora_icon.dart';
import '../../icons/xora_icons.dart';

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
    required this.items,
    this.state = NexoSidebarState.expanded,
    this.onStateChanged,
    this.header,
  });

  final List<NexoSidebarItem> items;
  final NexoSidebarState state;
  final ValueChanged<NexoSidebarState>? onStateChanged;
  final Widget? header;

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

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isGrid = _state == NexoSidebarState.grid;
    final isCollapsed = _state == NexoSidebarState.collapsed;
    return Material(
      color: scheme.surface,
      child: Column(
        children: [
          if (widget.header != null) widget.header!,
          IconButton(
            onPressed: _cycle,
            icon: XoraIcon(
              _state == NexoSidebarState.expanded
                  ? XoraIcons.anglesLeft
                  : _state == NexoSidebarState.collapsed
                      ? XoraIcons.anglesRight
                      : XoraIcons.grip,
            ),
            tooltip: 'Toggle sidebar',
          ),
          const Divider(height: 1),
          Expanded(
            child: isGrid
                ? GridView.count(
                    crossAxisCount: 3,
                    padding: const EdgeInsets.all(8),
                    children: [
                      for (final item in widget.items)
                        _GridTile(item: item),
                    ],
                  )
                : ListView(
                    children: [
                      for (final item in widget.items)
                        _SidebarTile(item: item, collapsed: isCollapsed),
                    ],
                  ),
          ),
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

