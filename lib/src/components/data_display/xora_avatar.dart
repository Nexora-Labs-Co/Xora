import 'package:flutter/material.dart';

import '../../theme/xora_colors.dart';
import '../../theme/xora_typography.dart';

class XoraAvatar extends StatelessWidget {
  const XoraAvatar({
    super.key,
    this.initials,
    this.image,
    this.size = 40,
    this.backgroundColor,
  });

  final String? initials;
  final ImageProvider? image;
  final double size;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final bg = backgroundColor ?? Theme.of(context).colorScheme.primary;
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: bg,
      backgroundImage: image,
      child: image == null
          ? Text(
              (initials ?? '').toUpperCase(),
              style: XoraTypography.label.copyWith(
                color: XoraColors.onPrimary,
                fontSize: size * 0.36,
              ),
            )
          : null,
    );
  }
}
