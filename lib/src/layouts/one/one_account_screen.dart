import 'package:flutter/material.dart';

import '../../components/data_display/xora_avatar.dart';
import '../../components/surfaces/xora_card.dart';
import '../../theme/xora_colors.dart';
import '../../theme/xora_spacing.dart';
import '../../theme/xora_typography.dart';

class OneAccountScreen extends StatelessWidget {
  const OneAccountScreen({
    super.key,
    this.userName = 'Usuario',
    this.userStatus = 'Free',
    this.userInitials = 'U',
  });

  final String userName;
  final String userStatus;
  final String userInitials;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuenta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(XoraSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            XoraCard(
              child: Row(
                children: [
                  XoraAvatar(initials: userInitials, size: 56),
                  const SizedBox(width: XoraSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(userName, style: XoraTypography.title.copyWith(color: scheme.onSurface)),
                        const SizedBox(height: XoraSpacing.xs),
                        Text(userStatus, style: XoraTypography.body.copyWith(color: XoraColors.textSecondary)),
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

