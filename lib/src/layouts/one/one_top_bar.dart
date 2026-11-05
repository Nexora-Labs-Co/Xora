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
        XoraAvatar(initials: accountInitials);
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
                InkWell(
                  borderRadius: BorderRadius.circular(999),
                  onTap: onAvatarTap ??
                      () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => OneAccountScreen(
                                userName: accountName,
                                userStatus: accountStatus,
                                userInitials: accountInitials,
                              ),
                            ),
                          ),
                  child: avatarWidget,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

