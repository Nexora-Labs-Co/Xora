import 'dart:io';

import 'package:flutter/material.dart';

import '../../components/data_display/xora_avatar.dart';
import '../../theme/xora_spacing.dart';
import '../../theme/xora_typography.dart';
import 'one_account_screen.dart';

class OneTopBar extends StatelessWidget implements PreferredSizeWidget {
  const OneTopBar({
    super.key,
    this.appName,
    this.avatar,
    this.onAvatarTap,
    this.accountName = 'Usuario',
    this.accountStatus = 'Free',
    this.accountInitials = 'U',
    this.accountAvatarPath,
    this.onToggleTheme,
    this.isDark = false,
    this.onProfileChanged,
    this.leading,
    this.title,
    this.actions = const [],
    this.backgroundColor,
  });

  final String? appName;
  final Widget? avatar;
  final VoidCallback? onAvatarTap;
  final String accountName;
  final String accountStatus;
  final String accountInitials;
  final String? accountAvatarPath;
  final VoidCallback? onToggleTheme;
  final void Function(String name, String? avatarPath)? onProfileChanged;
  final bool isDark;
  final Widget? leading;
  final Widget? title;
  final List<Widget> actions;
  final Color? backgroundColor;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final avatarWidget = avatar ??
        (accountAvatarPath == null
            ? XoraAvatar(initials: accountInitials.isNotEmpty ? accountInitials.substring(0, 1) : 'U')
            : ClipOval(
                child: Image.file(
                  File(accountAvatarPath!),
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => XoraAvatar(initials: accountInitials.isNotEmpty ? accountInitials.substring(0, 1) : 'U'),
                ),
              ));
    return Material(
      color: backgroundColor ?? scheme.surface,
      elevation: 0,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 64,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: XoraSpacing.lg),
            child: Row(
              children: [
                if (appName != null)
                  Text(
                    appName!,
                    style: XoraTypography.logo(28).copyWith(color: scheme.onSurface),
                  )
                else if (leading != null) ...[
                  leading!,
                  const SizedBox(width: XoraSpacing.md),
                  ?title,
                ] else
                  ?title,
                const Spacer(),
                ...actions,
                const SizedBox(width: XoraSpacing.md),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: scheme.primary, width: 2),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(999),
                    onTap: onAvatarTap ??
                        () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => OneAccountScreen(
                                  userName: accountName,
                                  userStatus: accountStatus,
                                  userInitials: accountInitials,
                                  avatarPath: accountAvatarPath,
                                  onToggleTheme: onToggleTheme,
                                  isDark: isDark,
                                  onProfileChanged: onProfileChanged,
                                ),
                              ),
                            ),
                    child: avatarWidget,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

