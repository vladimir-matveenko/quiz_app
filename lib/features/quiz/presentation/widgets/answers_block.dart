import 'package:auto_size_text/auto_size_text.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../app/theme/app_semantic_colors.dart';

class AnswersBlock extends StatelessWidget {
  const AnswersBlock({
    super.key,
    required this.words,
    required this.onSelected,
    required this.answered,
    required this.selectedAnswer,
    required this.correctAnswer,
  });

  final List<String> words;
  final Function(String) onSelected;
  final bool answered;
  final String selectedAnswer;
  final String correctAnswer;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: words.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 5,
      ),
      itemBuilder: (ctx, index) {
        final word = words[index];
        final isButtonsActive = selectedAnswer.isEmpty && correctAnswer.isEmpty;
        return AnswerButton(
          onTap: isButtonsActive
              ? () {
                  onSelected(word);
                }
              : null,
          buttonText: word,
          answered: answered,
          selectedAnswer: selectedAnswer,
          correctAnswer: correctAnswer,
        );
      },
    );
  }
}

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    this.onTap,
    required this.buttonText,
    required this.answered,
    required this.selectedAnswer,
    required this.correctAnswer,
  });

  final VoidCallback? onTap;
  final String buttonText;
  final bool answered;
  final String selectedAnswer;
  final String correctAnswer;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyMedium;
    final semanticColors = theme.extension<AppSemanticColors>();
    final errorColor = theme.colorScheme.error;
    final isCorrect =
        selectedAnswer.isNotEmpty && selectedAnswer == correctAnswer;

    if (answered) {
      if (buttonText == selectedAnswer) {
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: isCorrect ? semanticColors!.success : errorColor,
            side: BorderSide(
              color: isCorrect ? semanticColors!.success : errorColor,
              width: 2.0,
            ),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: .center,
            spacing: 4.0,
            children: [
              Flexible(
                child: AutoSizeText(
                  buttonText,
                  style: isCorrect
                      ? textStyle?.copyWith(color: semanticColors!.success)
                      : textStyle?.copyWith(color: errorColor),
                ),
              ),
              if (isCorrect)
                Icon(Icons.check, color: semanticColors!.success, size: 14.0)
              else
                Icon(Icons.close, color: errorColor, size: 14.0),
            ],
          ),
        );
      }
      if (buttonText == correctAnswer) {
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            buttonText,
            style: isCorrect
                ? textStyle?.copyWith(color: semanticColors!.success)
                : textStyle?.copyWith(color: theme.colorScheme.primary),
          ),
        );
      }
    }

    return OutlinedButton(
      onPressed: onTap,
      child: Text(buttonText, style: textStyle),
    );
  }
}
