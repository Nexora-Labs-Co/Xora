import 'package:flutter/material.dart';

import '../../theme/xora_spacing.dart';

class XoraSwitch extends StatelessWidget {
  const XoraSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final toggle = Switch(value: value, onChanged: onChanged);
    if (label == null) return toggle;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label!, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(width: XoraSpacing.sm),
        toggle,
      ],
    );
  }
}
