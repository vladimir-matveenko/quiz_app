import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/presentation/widgets/scrolled_wrapper.dart';
import 'package:quiz_app/features/find_matches/presentation/widgets/word_item.dart';
import 'package:quiz_app/features/quiz/presentation/widgets/completed_widget.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../history/presentation/cubit/cubit.dart';
import '../cubit/cubit.dart';
import '../widgets/page_wrapper.dart';

class FindMatchesPage extends StatefulWidget {
  const FindMatchesPage({super.key});

  @override
  State<FindMatchesPage> createState() => _FindMatchesPageState();
}

class _FindMatchesPageState extends State<FindMatchesPage> {
  late FindMatchesCubit findMatchesCubit;
  late HistoryCubit historyCubit;

  @override
  void initState() {
    super.initState();
    findMatchesCubit = context.read<FindMatchesCubit>();
    historyCubit = context.read<HistoryCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PageWrapper(
      backgroundColor: theme.scaffoldBackgroundColor,
      onCompleted: (state) {
        final cup = findMatchesCubit.getCup(
          total: state.totalCount,
          errorsCount: state.errorsCount,
        );
        return CompletedWidget(
          cup: cup,
          correctAnswers: state.totalCount - state.errorsCount,
          incorrectAnswers: state.errorsCount,
          totalQuestions: state.totalCount,
          onTap: () {
            historyCubit.addHistoryItem(
              testType: TestType.findMatches,
              correctAnswers: state.totalCount - state.errorsCount,
              totalAnswers: state.totalCount,
            );
          },
        );
      },
      onLoaded: (state) {
        final left = state.leftWords
            .map(
              (e) => WordItem(
                text: e.russianWord,
                isAnswered: state.answered,
                isCorrect: state.correct,
                isSelected: state.left == e,
                onTap: () {
                  if (!state.answered) {
                    findMatchesCubit.setLeft(e);
                  }
                },
              ),
            )
            .toList();
        final right = state.rightWords
            .map(
              (e) => WordItem(
                text: e.englishWord,
                isAnswered: state.answered,
                isCorrect: state.correct,
                isSelected: state.right == e,
                onTap: () {
                  if (!state.answered) {
                    findMatchesCubit.setRight(e);
                  }
                },
              ),
            )
            .toList();
        return ScrolledWrapper(
          child: Column(
            mainAxisAlignment: .center,
            spacing: 16.0,
            children: [
              Text(
                '${state.leftWords.length} / ${state.totalCount}',
                style: theme.textTheme.bodyLarge,
              ),
              Row(
                spacing: 16.0,
                children: [
                  Expanded(
                    child: Column(
                      spacing: 8.0,
                      crossAxisAlignment: .stretch,
                      children: left,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 8.0,
                      crossAxisAlignment: .stretch,
                      children: right,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
