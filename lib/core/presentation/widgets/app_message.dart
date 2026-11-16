import 'package:material_ui/material_ui.dart';

import '../../../app/theme/app_semantic_colors.dart';

class AppMessage {
  static void show(
    BuildContext context, {
    required String message,
    Color? backgroundColor,
    VoidCallback? onClose,
  }) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(content: Text(message), backgroundColor: backgroundColor),
        )
        .closed
        .then((_) {
          if (onClose != null) {
            onClose.call();
          }
        });
  }

  static void error(
    BuildContext context, {
    required String message,
    VoidCallback? onClose,
  }) {
    AppMessage.show(
      context,
      message: message,
      backgroundColor: Theme.of(context).colorScheme.error,
      onClose: onClose,
    );
  }

  static void success(
    BuildContext context, {
    required String message,
    VoidCallback? onClose,
  }) {
    final colors = Theme.of(context).extension<AppSemanticColors>()!;
    AppMessage.show(
      context,
      message: message,
      backgroundColor: colors.success,
      onClose: onClose,
    );
  }
}
