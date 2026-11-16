import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';

import '../../../quiz/presentation/widgets/answer_result.dart';
import '../../domain/entity/translation_check_result_entity.dart';

class TranslationResultWidget extends StatelessWidget {
  const TranslationResultWidget({super.key, required this.result});

  final TranslationCheckResultEntity result;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textMedium = theme.textTheme.bodyMedium;
    final textLarge = theme.textTheme.bodyLarge;
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          '${'translationPage.estimation'.tr()}: ${result.score}/100',
          style: textMedium,
        ),
        const SizedBox(height: 12),
        if (result.mistakes.isEmpty)
          const AnswerResult(isCorrect: true)
        else ...[
          Text(
            '${'translationPage.correctTranslation'.tr()}:',
            style: textMedium,
          ),
          Text(
            result.correctTranslation,
            style: textMedium?.copyWith(color: theme.colorScheme.primary),
          ),
          const SizedBox(height: 20),
          Text('${'errors.errors'.tr()}:'),
          ...result.mistakes.map(
            (e) => ListTile(
              leading: Icon(
                Icons.error_outline,
                color: theme.colorScheme.error,
              ),
              title: Text(
                e.word,
                style: textLarge?.copyWith(color: theme.colorScheme.error),
              ),
              subtitle: Column(
                crossAxisAlignment: .start,
                mainAxisSize: .min,
                children: [
                  Text(
                    e.suggestion,
                    style: textMedium?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  Text(e.reason, style: textMedium),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}
