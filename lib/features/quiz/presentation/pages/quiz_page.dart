import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/presentation/widgets/scrolled_wrapper.dart';
import 'package:quiz_app/core/utils/extensions.dart';
import 'package:quiz_app/features/quiz/presentation/widgets/answer_result.dart';
import 'package:quiz_app/features/quiz/presentation/widgets/completed_widget.dart';
import 'package:quiz_app/features/quiz/presentation/widgets/word_with_pronounce.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../core/presentation/widgets/one_field_form.dart';
import '../../../history/presentation/cubit/cubit.dart';
import '../cubit/cubit.dart';
import '../widgets/page_wrapper.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late QuizCubit quizCubit;
  late HistoryCubit historyCubit;
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    quizCubit = context.read<QuizCubit>();
    historyCubit = context.read<HistoryCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PageWrapper(
      backgroundColor: theme.scaffoldBackgroundColor,
      onCompleted: (state) {
        final cup = quizCubit.getCup(
          total: state.words.length,
          correct: state.correctCount,
        );
        return CompletedWidget(
          cup: cup,
          correctAnswers: state.correctCount,
          incorrectAnswers: state.words.length - state.correctCount,
          totalQuestions: state.words.length,
          onTap: () {
            historyCubit.addHistoryItem(
              testType: TestType.translate,
              correctAnswers: state.correctCount,
              totalAnswers: state.words.length,
            );
          },
        );
      },
      onLoaded: (state) {
        final current = state.words[state.currentIndex];
        return ScrolledWrapper(
          child: Column(
            mainAxisAlignment: .center,
            spacing: 16.0,
            children: [
              Text(
                '${state.currentIndex + 1} / ${state.words.length}',
                style: theme.textTheme.bodyLarge,
              ),
              WordWithPronounce(
                word: current.questionFor(quizCubit.type),
                language: quizCubit.type.questionFor,
              ),
              OneFieldForm(
                formKey: _formKey,
                enabled: !state.answered,
                controller: _controller,
                hint: 'quizPage.inputTranslation'.tr(),
              ),
              if (!state.answered) ...[
                ElevatedButton(
                  onPressed: () {
                    final isValid = _formKey.currentState?.validate() ?? false;
                    if (isValid) {
                      quizCubit.checkAnswer(_controller.text);
                    }
                  },
                  child: Text('quizPage.check'.tr()),
                ),
                const SizedBox(height: 56.0),
              ] else ...[
                ElevatedButton(
                  onPressed: () {
                    quizCubit.nextQuestion();
                    _controller.text = '';
                  },
                  child: Text('quizPage.next'.tr()),
                ),
                AnswerResult(isCorrect: state.correct),
                Text(
                  '${'quizPage.correctAnswer'.tr()}: ${current.answerFor(quizCubit.type)}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
