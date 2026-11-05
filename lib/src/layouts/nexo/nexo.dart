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
    this.sidebarEntries = const [],
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
    this.toolbarActions = const [],
  });

  final Widget child;
  final List<NexoSidebarEntry> sidebarEntries;
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
  final List<Widget> toolbarActions;

  @override
  State<XoraNexo> createState() => _XoraNexoState();
}

class _XoraNexoState extends State<XoraNexo> {
  NexoSidebarState _sidebarState = NexoSidebarState.expanded;
  bool _rightOpen = true;

  void _toggleSidebar() {
    setState(() {
      _sidebarState = _sidebarState == NexoSidebarState.expanded
          ? NexoSidebarState.collapsed
          : NexoSidebarState.expanded;
    });
  }

  void _toggleRight() {
    setState(() => _rightOpen = !_rightOpen);
  }

  @override
  Widget build(BuildContext context) {
    final hasBottom = widget.appVersion != null || (widget.bottomActions?.isNotEmpty ?? false);
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              SizedBox(
                width: _sidebarState == NexoSidebarState.collapsed ? 72 : widget.leftWidth,
                child: NexoSidebar(
                  appName: widget.appName,
                  entries: widget.sidebarEntries,
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
                    height: _sidebarState == NexoSidebarState.collapsed ? 58 : 63,
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
                    actions: [
                      IconButton(
                        onPressed: _toggleRight,
                        icon: XoraIcon(XoraIcons.panelRight),
                        tooltip: 'Barra lateral derecha',
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: XoraIcon(XoraIcons.magnifyingGlass),
                        tooltip: 'Buscar',
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: XoraIcon(XoraIcons.gear),
                        tooltip: 'Configuración',
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: XoraIcon(XoraIcons.bell),
                        tooltip: 'Notificaciones',
                      ),
                      ...widget.toolbarActions,
                    ],
                  ),
                  child: widget.child,
                ),
              ),
              if (_rightOpen && widget.rightPanel != null) const VerticalDivider(width: 1),
              if (_rightOpen && widget.rightPanel != null)
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

