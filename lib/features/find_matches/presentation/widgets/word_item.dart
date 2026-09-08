import 'package:flutter/material.dart';

import '../../../../app/theme/app_semantic_colors.dart';

class WordItem extends StatelessWidget {
  const WordItem({
    super.key,
    required this.text,
    required this.onTap,
    this.isSelected = false,
    this.isAnswered = false,
    this.isCorrect = false,
  });

  final String text;
  final VoidCallback onTap;
  final bool isSelected;
  final bool isAnswered;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final semanticColors = theme.extension<AppSemanticColors>();
    var color = theme.unselectedWidgetColor;
    if (isSelected) {
      color = theme.colorScheme.primary;
      if (isAnswered) {
        if (isCorrect) {
          color = semanticColors!.success;
        } else {
          color = theme.colorScheme.error;
        }
      }
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const .all(8.0),
        decoration: BoxDecoration(
          borderRadius: .circular(12.0),
          border: .all(color: color),
        ),
        child: Text(
          text,
          style: theme.textTheme.bodyMedium,
          textAlign: .center,
        ),
      ),
    );
  }
}
