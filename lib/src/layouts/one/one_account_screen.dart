import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      body: ListView(
        padding: const EdgeInsets.all(XoraSpacing.lg),
        children: [
          XoraCard(
            child: Row(
              children: [
                _avatarPath == null
                    ? XoraAvatar(initials: _name.isNotEmpty ? _name.substring(0, 1) : 'U', size: 56)
                    : ClipOval(
                        child: Image.file(
                          File(_avatarPath!),
                          width: 56,
                          height: 56,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => XoraAvatar(initials: _name.isNotEmpty ? _name.substring(0, 1) : 'U', size: 56),
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
          _sectionTitle(context, 'Cuenta'),
          XoraCard(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Editar perfil'),
                  onTap: _edit,
                ),
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text('Notificaciones'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.language),
                  title: const Text('Lenguaje'),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: XoraSpacing.lg),
          _sectionTitle(context, 'Preferencias'),
          XoraCard(
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Tema oscuro'),
                  value: widget.isDark,
                  onChanged: widget.onToggleTheme == null ? null : (_) => widget.onToggleTheme!(),
                ),
              ],
            ),
          ),
          const SizedBox(height: XoraSpacing.lg),
          _sectionTitle(context, 'Soporte'),
          XoraCard(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.help),
                  title: const Text('Ayuda'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.privacy_tip),
                  title: const Text('Política de privacidad'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.feedback),
                  title: const Text('Feedback'),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: XoraSpacing.lg),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => launchUrl(Uri.parse('https://github.com/Nexora-Labs-Co')),
                icon: XoraIcon(XoraIcons.github),
                tooltip: 'GitHub',
              ),
              IconButton(
                onPressed: () => launchUrl(Uri.parse('https://ko-fi.com/nexoralabsco')),
                icon: XoraIcon(XoraIcons.mugHot),
                tooltip: 'Ko-fi',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: XoraSpacing.sm),
      child: Text(title, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}

