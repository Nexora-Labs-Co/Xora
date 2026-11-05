import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../icons/xora_icon.dart';
import '../../icons/xora_icons.dart';
import '../../theme/xora_spacing.dart';

class NexoBottomBar extends StatelessWidget {
  const NexoBottomBar({super.key, this.appVersion, this.actions});

  final String? appVersion;
  final List<Widget>? actions;

  List<Widget> get _actions => (actions == null || actions!.isEmpty)
      ? [
          IconButton(
            onPressed: () =>
                launchUrl(Uri.parse('https://github.com/Nexora-Labs-Co')),
            icon: const XoraIcon(XoraIcons.github, size: 15),
            iconSize: 20,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            tooltip: 'GitHub',
          ),
          IconButton(
            onPressed: () =>
                launchUrl(Uri.parse('https://ko-fi.com/nexoralabsco')),
            icon: const XoraIcon(XoraIcons.mugHot, size: 15),
            iconSize: 15,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            tooltip: 'Ko-fi',
          ),
        ]
      : actions!;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: XoraSpacing.lg),
      decoration: BoxDecoration(
        color: scheme.surface,
        border: Border(top: BorderSide(color: scheme.outline)),
      ),
      child: Row(
        children: [
          if (appVersion != null)
            Text(appVersion!, style: Theme.of(context).textTheme.bodySmall),
          const Spacer(),
          ..._actions,
        ],
      ),
    );
  }
}
