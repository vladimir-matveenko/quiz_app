import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

@immutable
class AppDialog {
  const AppDialog._();

  static Future<bool> show(
    BuildContext context, {
    String? title,
    required String text,
    String? cancelText,
    required String okText,
    Color? okButtonColor,
  }) async {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => Dialog(
        constraints: const BoxConstraints(maxWidth: 400.0),
        child: Padding(
          padding: const .all(16.0),
          child: Column(
            mainAxisSize: .min,
            spacing: 16.0,
            children: [
              if (title != null) Text(title, style: textTheme.titleMedium),
              Text(text, style: textTheme.bodyMedium),
              Row(
                mainAxisAlignment: .spaceBetween,
                mainAxisSize: .min,
                spacing: 16.0,
                children: [
                  if (cancelText != null)
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                        onPressed: () => context.pop(false),
                        child: Text(
                          cancelText,
                          style: textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            okButtonColor ?? theme.colorScheme.primary,
                      ),
                      onPressed: () => context.pop(true),
                      child: Text(
                        okText,
                        style: textTheme.bodyLarge?.copyWith(
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    return result ?? false;
  }

  static Future empty(
    BuildContext context, {
    required Widget content,
    VoidCallback? onClose,
    BoxConstraints? constraints,
  }) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(constraints: constraints, child: content),
    ).then((_) {
      onClose?.call();
    });
  }
}
