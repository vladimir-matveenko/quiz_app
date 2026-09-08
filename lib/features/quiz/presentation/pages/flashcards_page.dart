import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/core/utils/extensions.dart';
import 'package:quiz_app/features/quiz/presentation/widgets/page_wrapper.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../app/theme/app_semantic_colors.dart';
import '../../../../core/presentation/widgets/smooth_flip_card.dart';
import '../../../history/presentation/cubit/cubit.dart';
import '../cubit/cubit.dart';
import '../widgets/flash_card.dart';

class FlashcardsPage extends StatelessWidget {
  const FlashcardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuizCubit>();
    final theme = Theme.of(context);
    final semanticColors = theme.extension<AppSemanticColors>();
    final screenHeight = MediaQuery.sizeOf(context).height;
    return PageWrapper(
      backgroundColor: theme.scaffoldBackgroundColor,
      onCompleted: (state) {
        return Center(
          child: Column(
            spacing: 16.0,
            mainAxisAlignment: .center,
            children: [
              Icon(
                Icons.check_circle_outline_outlined,
                size: 80.0,
                color: semanticColors!.success,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<HistoryCubit>().addHistoryItem(
                    testType: TestType.flashcards,
                    correctAnswers: state.correctCount,
                    totalAnswers: state.words.length,
                  );
                  if (context.canPop()) {
                    context.pop();
                  }
                },
                child: Text('flashcardPage.ready'.tr()),
              ),
            ],
          ),
        );
      },
      onLoaded: (state) {
        final current = state.words[state.currentIndex];
        return Padding(
          padding: const .all(16.0),
          child: Column(
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            children: [
              Container(
                constraints: BoxConstraints(maxHeight: screenHeight * 0.7),
                child: SmoothFlipCard(
                  front: (flip) {
                    return FlashCard(
                      flip: flip,
                      word: current.questionFor(cubit.type),
                      language: cubit.type.questionFor,
                    );
                  },
                  back: (flip) {
                    return FlashCard(
                      flip: flip,
                      word: current.answerFor(cubit.type),
                      language: cubit.type.answerFor,
                    );
                  },
                ),
              ),
              Row(
                spacing: 16.0,
                mainAxisAlignment: .spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: state.currentIndex != 0
                        ? cubit.previousQuestion
                        : null,
                    child: const Icon(Icons.arrow_back_outlined),
                  ),
                  Text(
                    '${state.currentIndex + 1} / ${state.words.length}',
                    style: theme.textTheme.bodyLarge,
                  ),
                  ElevatedButton(
                    onPressed: cubit.nextQuestion,
                    child: const Icon(Icons.arrow_forward_outlined),
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
