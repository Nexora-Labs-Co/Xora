import 'package:flutter/material.dart';

import '../../theme/xora_spacing.dart';

class NexoBottomBar extends StatelessWidget {
  const NexoBottomBar({
    super.key,
    this.appVersion,
    this.actions = const [],
  });

  final String? appVersion;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      height: 40,
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
          ...actions,
        ],
      ),
    );
  }
}

