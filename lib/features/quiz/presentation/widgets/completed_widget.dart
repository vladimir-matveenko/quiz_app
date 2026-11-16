import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../app/constants/asset_paths.dart';
import '../../../../app/theme/app_semantic_colors.dart';

class CompletedWidget extends StatefulWidget {
  const CompletedWidget({
    super.key,
    required this.cup,
    this.completedText,
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.totalQuestions,
    required this.onTap,
  });

  final String cup;
  final String? completedText;
  final int correctAnswers;
  final int incorrectAnswers;
  final int totalQuestions;
  final VoidCallback onTap;

  @override
  State<CompletedWidget> createState() => _CompletedWidgetState();
}

class _CompletedWidgetState extends State<CompletedWidget> {
  Uint8List? _gifBytes;

  @override
  void initState() {
    super.initState();
    rootBundle.load(AssetPaths.congratsAnimation).then((data) {
      if (mounted) {
        setState(() {
          _gifBytes = data.buffer.asUint8List();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final semanticColors = theme.extension<AppSemanticColors>();
    final completedText = widget.completedText ?? 'quizPage.quizCompleted'.tr();
    return Stack(
      alignment: .center,
      children: [
        if (_gifBytes != null) Image.memory(_gifBytes!),
        Column(
          spacing: 8.0,
          mainAxisAlignment: .center,
          children: [
            Image.asset(widget.cup, height: 120.0),
            Text(
              '${'quizPage.congrats'.tr()}\n$completedText',
              style: theme.textTheme.headlineSmall,
              textAlign: .center,
            ),
            Column(
              crossAxisAlignment: .end,
              spacing: 8.0,
              children: [
                Text(
                  '${'quizPage.correctAnswers'.tr()}: ${widget.correctAnswers}',
                  style: TextStyle(color: semanticColors!.success),
                ),
                Text(
                  '${'quizPage.incorrectAnswers'.tr()}: ${widget.incorrectAnswers}',
                  style: TextStyle(color: theme.colorScheme.error),
                ),
                Text(
                  '${'quizPage.totalQuestions'.tr()}: ${widget.totalQuestions}',
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                widget.onTap();
                if (context.canPop()) {
                  context.pop();
                }
              },
              child: Text('flashcardPage.ready'.tr()),
            ),
          ],
        ),
      ],
    );
  }
}
