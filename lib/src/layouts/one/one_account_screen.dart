import 'dart:io';

import 'package:flutter/material.dart';

import '../../components/data_display/xora_avatar.dart';
import '../../components/surfaces/xora_card.dart';
import '../../icons/xora_icon.dart';
import '../../icons/xora_icons.dart';
import '../../theme/xora_spacing.dart';
import 'one_profile_edit_dialog.dart';

class OneAccountScreen extends StatefulWidget {
  const OneAccountScreen({
    super.key,
    this.userName = 'Usuario',
    this.userStatus = 'Free',
    this.userInitials = 'U',
    this.avatarPath,
    this.onToggleTheme,
    this.isDark = false,
    this.onProfileChanged,
  });

  final String userName;
  final String userStatus;
  final String userInitials;
  final String? avatarPath;
  final VoidCallback? onToggleTheme;
  final bool isDark;
  final void Function(String name, String? avatarPath)? onProfileChanged;

  @override
  State<OneAccountScreen> createState() => _OneAccountScreenState();
}

class _OneAccountScreenState extends State<OneAccountScreen> {
  late String _name;
  String? _avatarPath;

  @override
  void initState() {
    super.initState();
    _name = widget.userName;
    _avatarPath = widget.avatarPath;
  }

  Future<void> _edit() async {
    final result = await showOneProfileEditDialog(
      context,
      initialName: _name,
      initialAvatarPath: _avatarPath,
    );
    if (result == null) return;
    setState(() {
      _name = result.name;
      _avatarPath = result.avatarPath ?? _avatarPath;
    });
    widget.onProfileChanged?.call(_name, _avatarPath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuenta'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _edit,
            icon: XoraIcon(XoraIcons.notePencil),
            tooltip: 'Editar',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(XoraSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            XoraCard(
              child: Row(
                children: [
                  _avatarPath == null
                      ? XoraAvatar(initials: _name, size: 56)
                      : ClipOval(
                          child: Image.file(
                            File(_avatarPath!),
                            width: 56,
                            height: 56,
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) =>
                                XoraAvatar(initials: _name, size: 56),
                          ),
                        ),
                  const SizedBox(width: XoraSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_name, style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: XoraSpacing.xs),
                        Text(widget.userStatus, style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: XoraSpacing.lg),
            XoraCard(
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('Tema oscuro'),
                    value: widget.isDark,
                    onChanged: widget.onToggleTheme == null ? null : (_) => widget.onToggleTheme!(),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Configuración'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Cerrar sesión'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

