import 'package:flutter/material.dart';

import '../../components/buttons/xora_icon_button.dart';
import 'one_top_bar.dart';
import '../../components/data_display/xora_avatar.dart';
import '../../components/surfaces/xora_card.dart';
import '../../icons/xora_icon.dart';
import '../../icons/xora_icons.dart';
import '../../theme/xora_colors.dart';
import '../../theme/xora_spacing.dart';
import '../../theme/xora_typography.dart';

class OneAccountScreen extends StatelessWidget {
  const OneAccountScreen({
    super.key,
    this.userName = 'Usuario',
    this.userStatus = 'Free',
    this.userInitials = 'U',
    this.bannerUrl,
    this.onEdit,
  });

  final String userName;
  final String userStatus;
  final String userInitials;
  final String? bannerUrl;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Column(
        children: [
          OneTopBar(
            title: const Text('Cuenta'),
            actions: [
              XoraIconButton(
                icon: XoraIcon(XoraIcons.pen),
                onPressed: onEdit,
                size: 36,
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(XoraSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 140,
                      color: scheme.surfaceContainerHighest,
                      child: bannerUrl != null
                          ? Image.network(bannerUrl!, fit: BoxFit.cover, width: double.infinity)
                          : Center(child: XoraIcon(XoraIcons.image, size: 48)),
                    ),
                  ),
                  const SizedBox(height: XoraSpacing.lg),
                  Center(child: XoraAvatar(initials: userInitials, size: 72)),
                  const SizedBox(height: XoraSpacing.md),
                  Center(child: Text(userName, style: XoraTypography.title.copyWith(color: scheme.onSurface))),
                  const SizedBox(height: XoraSpacing.xs),
                  Center(child: Text(userStatus, style: XoraTypography.body.copyWith(color: XoraColors.textSecondary))),
                  const SizedBox(height: XoraSpacing.lg),
                  XoraCard(
                    child: Column(
                      children: [
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
          ),
        ],
      ),
    );
  }
}

