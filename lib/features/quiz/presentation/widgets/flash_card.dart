import 'package:material_ui/material_ui.dart';
import 'package:quiz_app/features/quiz/presentation/widgets/word_with_pronounce.dart';

class FlashCard extends StatelessWidget {
  const FlashCard({
    super.key,
    required this.flip,
    required this.word,
    required this.language,
  });

  final VoidCallback flip;
  final String word;
  final String language;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: flip,
      child: AspectRatio(
        aspectRatio: 2.0,
        child: Card(
          elevation: 4,
          color: theme.inputDecorationTheme.disabledBorder?.borderSide.color,
          child: Padding(
            padding: const .all(8.0),
            child: WordWithPronounce(word: word, language: language),
          ),
        ),
      ),
    );
  }
}
