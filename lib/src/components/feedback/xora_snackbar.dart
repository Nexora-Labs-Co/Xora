import 'package:flutter/material.dart';

import '../../theme/xora_colors.dart';
import '../../theme/xora_radius.dart';
import '../../theme/xora_spacing.dart';
import '../../theme/xora_typography.dart';

class XoraSnackbar {
  const XoraSnackbar._();

  static void show(
    BuildContext context, {
    required String message,
    XoraSnackbarType type = XoraSnackbarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    final color = switch (type) {
      XoraSnackbarType.info => XoraColors.info,
      XoraSnackbarType.success => XoraColors.success,
      XoraSnackbarType.warning => XoraColors.warning,
      XoraSnackbarType.error => XoraColors.danger,
    };
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: XoraTypography.body.copyWith(color: Colors.white)),
        backgroundColor: color,
        duration: duration,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(XoraRadius.md),
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(XoraSpacing.lg),
      ),
    );
  }
}

enum XoraSnackbarType { info, success, warning, error }
