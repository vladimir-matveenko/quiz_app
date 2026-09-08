import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/presentation/widgets/app_back_button.dart';
import 'package:quiz_app/core/presentation/widgets/app_loader.dart';
import 'package:quiz_app/app/constants/app_enums.dart';
import 'package:quiz_app/features/history/presentation/cubit/cubit.dart';

import '../../../../core/presentation/widgets/app_message.dart';
import '../../../../core/presentation/widgets/one_field_form.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';
import '../widgets/completed_widget.dart';
import '../widgets/translation_result_widget.dart';

class TranslationPage extends StatefulWidget {
  const TranslationPage({super.key});

  @override
  State<TranslationPage> createState() => _TranslationPageState();
}

class _TranslationPageState extends State<TranslationPage> {
  late TranslationCubit translationCubit;
  late HistoryCubit historyCubit;
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    translationCubit = context.read<TranslationCubit>();
    historyCubit = context.read<HistoryCubit>();
    super.initState();
  }

  @override
  void deactivate() {
    translationCubit.resetData();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('translationPage.screenName'.tr()),
        leading: const AppBackButton(),
      ),
      body: BlocConsumer<TranslationCubit, TranslationState>(
        listener: (context, state) {
          if (state.error?.isNotEmpty == true) {
            AppMessage.error(
              context,
              message: state.error!,
              onClose: translationCubit.disableError,
            );
          }
        },
        builder: (context, state) {
          final isLoading = state.status == TranslationStatus.loading;
          final isAnswered = state.status == TranslationStatus.answered;
          final isCompleted = state.status == TranslationStatus.completed;
          final currentText = state.russianText[state.currentIndex];
          return isCompleted
              ? CompletedWidget(
                  resultsWidget: Text(
                    '${'historyPage.score'.tr()}: ${state.totalScore / state.russianText.length}',
                    style: theme.textTheme.bodyMedium,
                  ),
                  onTap: () {
                    historyCubit.addHistoryItem(
                      testType: TestType.translation,
                      correctAnswers:
                          (state.totalScore / state.russianText.length).round(),
                      totalAnswers: state.russianText.length,
                    );
                  },
                )
              : SingleChildScrollView(
                  padding: const .all(16),
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    spacing: 16.0,
                    children: [
                      Text(currentText, style: theme.textTheme.titleLarge),
                      OneFieldForm(
                        formKey: _formKey,
                        enabled: !isAnswered,
                        controller: _controller,
                        hint: 'quizPage.inputTranslation'.tr(),
                        keyboardType: .multiline,
                      ),
                      ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () {
                                final isValid =
                                    _formKey.currentState?.validate() ?? false;
                                if (isAnswered) {
                                  _controller.text = '';
                                  translationCubit.nextQuestion();
                                } else {
                                  if (isValid) {
                                    translationCubit.check(
                                      userTranslation: _controller.text,
                                    );
                                  }
                                }
                              },
                        child: Text(
                          isAnswered
                              ? 'quizPage.next'.tr()
                              : 'quizPage.check'.tr(),
                        ),
                      ),
                      if (isLoading) const AppLoader(),
                      if (isAnswered && state.result != null)
                        TranslationResultWidget(result: state.result!),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
