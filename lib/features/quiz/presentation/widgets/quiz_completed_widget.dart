import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../history/presentation/cubit/cubit.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';
import 'completed_widget.dart';

class QuizCompletedWidget extends StatelessWidget {
  const QuizCompletedWidget({
    super.key,
    required this.state,
    required this.testType,
    required this.completedTextKey,
  });

  final QuizState state;
  final TestType testType;
  final String completedTextKey;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuizCubit>();
    final cup = cubit.getCup(
      total: state.words.length,
      correct: state.correctCount,
    );
    return CompletedWidget(
      cup: cup,
      completedText: completedTextKey.tr(),
      correctAnswers: state.correctCount,
      incorrectAnswers: state.words.length - state.correctCount,
      totalQuestions: state.words.length,
      onTap: () {
        context.read<HistoryCubit>().addHistoryItem(
          testType: testType,
          correctAnswers: state.correctCount,
          totalAnswers: state.words.length,
        );
        if (context.canPop()) {
          context.pop();
        }
      },
    );
  }
}
