import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:quiz_app/app/theme/app_semantic_colors.dart';

class AnswerResult extends StatelessWidget {
  const AnswerResult({
    super.key,
    required this.isCorrect,
    this.correctText,
    this.incorrectText,
  });

  final bool isCorrect;
  final String? correctText;
  final String? incorrectText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final semanticColors = theme.extension<AppSemanticColors>();
    final textStyle = theme.textTheme.bodyMedium;
    return Text(
      isCorrect
          ? (correctText ?? 'testPage.correct'.tr())
          : (incorrectText ?? 'testPage.incorrect'.tr()),
      style: textStyle?.copyWith(
        color: isCorrect ? semanticColors!.success : theme.colorScheme.error,
      ),
    );
  }
}
