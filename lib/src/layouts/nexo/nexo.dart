import 'package:flutter/material.dart';

import '../../icons/xora_icon.dart';
import '../../icons/xora_icons.dart';
import 'nexo_bottom_bar.dart';
import 'nexo_canvas.dart';
import 'nexo_sidebar.dart';
import 'nexo_toolbar.dart';

class XoraNexo extends StatefulWidget {
  const XoraNexo({
    super.key,
    required this.child,
    this.leftSidebar,
    this.sidebarItems = const [],
    this.topItems = const [],
    this.sidebarSections = const [],
    this.appName,
    this.userName,
    this.userStatus,
    this.userAvatar,
    this.userInitials,
    this.rightPanel,
    this.leftWidth = 260,
    this.rightWidth = 320,
    this.appVersion,
    this.bottomActions,
    this.toolbarTitle,
    this.toolbarBackgroundColor,
    this.toolbarActions = const [],
  });

  final Widget child;
  final Widget? leftSidebar;
  final List<NexoSidebarItem> sidebarItems;
  final List<NexoSidebarItem> topItems;
  final List<NexoSidebarSection> sidebarSections;
  final String? appName;
  final String? userName;
  final String? userStatus;
  final Widget? userAvatar;
  final String? userInitials;
  final Widget? rightPanel;
  final double leftWidth;
  final double rightWidth;
  final String? appVersion;
  final List<Widget>? bottomActions;
  final Widget? toolbarTitle;
  final Color? toolbarBackgroundColor;
  final List<Widget> toolbarActions;

  @override
  State<XoraNexo> createState() => _XoraNexoState();
}

class _XoraNexoState extends State<XoraNexo> {
  NexoSidebarState _sidebarState = NexoSidebarState.expanded;

  void _toggleSidebar() {
    setState(() {
      _sidebarState = _sidebarState == NexoSidebarState.expanded
          ? NexoSidebarState.collapsed
          : NexoSidebarState.expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final hasBottom =
        widget.appVersion != null ||
        (widget.bottomActions?.isNotEmpty ?? false);
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              if (widget.leftSidebar != null)
                SizedBox(width: widget.leftWidth, child: widget.leftSidebar)
              else
                SizedBox(
                  width: _sidebarState == NexoSidebarState.collapsed
                      ? 72
                      : widget.leftWidth,
                  child: NexoSidebar(
                    appName: widget.appName,
                    sections: widget.sidebarSections.isNotEmpty
                        ? widget.sidebarSections
                        : (widget.sidebarItems.isNotEmpty
                            ? [NexoSidebarSection(items: widget.sidebarItems)]
                            : const []),
                    items: const [],
                    state: _sidebarState,
                    onStateChanged: (s) => setState(() => _sidebarState = s),
                    userName: widget.userName,
                    userStatus: widget.userStatus,
                    userAvatar: widget.userAvatar,
                    userInitials: widget.userInitials,
                  ),
                ),
              const VerticalDivider(width: 1),
              Expanded(
                child: NexoCanvas(
                  toolbar: NexoToolbar(
                    height: _sidebarState == NexoSidebarState.collapsed
                        ? 58
                        : 63,
                    backgroundColor: widget.toolbarBackgroundColor,
                    leading: IconButton(
                      onPressed: _toggleSidebar,
                      icon: XoraIcon(
                        _sidebarState == NexoSidebarState.expanded
                            ? XoraIcons.anglesLeft
                            : XoraIcons.anglesRight,
                      ),
                      tooltip: 'Cambiar barra lateral',
                    ),
                    title: widget.toolbarTitle,
                    actions: widget.toolbarActions,
                  ),
                  child: widget.child,
                ),
              ),
              if (widget.rightPanel != null) const VerticalDivider(width: 1),
              if (widget.rightPanel != null)
                SizedBox(width: widget.rightWidth, child: widget.rightPanel),
            ],
          ),
        ),
        if (hasBottom)
          NexoBottomBar(
            appVersion: widget.appVersion,
            actions: widget.bottomActions,
          ),
      ],
    );
  }
}

