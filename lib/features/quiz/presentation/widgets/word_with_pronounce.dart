import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:quiz_app/features/quiz/presentation/cubit/cubit.dart';
import 'package:quiz_app/features/quiz/presentation/widgets/pronounce_button.dart';

class WordWithPronounce extends StatelessWidget {
  const WordWithPronounce({
    super.key,
    required this.word,
    required this.language,
  });

  final String word;
  final String language;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuizCubit>();
    final theme = Theme.of(context);
    return Row(
      spacing: 8.0,
      mainAxisAlignment: .center,
      children: [
        Flexible(
          child: AutoSizeText(
            word,
            style: theme.textTheme.headlineLarge,
            minFontSize: 10.0,
            maxLines: 1,
          ),
        ),
        PronounceButton(
          onTap: () {
            cubit.pronounceWord(word, language: language);
          },
        ),
      ],
    );
  }
}
