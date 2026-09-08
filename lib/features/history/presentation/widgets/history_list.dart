import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/app/constants/app_enums.dart';
import 'package:quiz_app/core/presentation/widgets/app_loader.dart';
import 'package:quiz_app/core/utils/extensions.dart';

import '../../domain/entity/history_entity.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class HistoryList extends StatefulWidget {
  const HistoryList({super.key});

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  late HistoryCubit cubit;
  final _scrollController = ScrollController();

  bool get _isNearBottom {
    if (!_scrollController.hasClients) return false;

    return _scrollController.offset >=
        _scrollController.position.maxScrollExtent * 0.9;
  }

  void _onScroll() {
    if (_isNearBottom) {
      cubit.loadMoreHistory();
    }
  }

  @override
  void initState() {
    super.initState();
    cubit = context.read<HistoryCubit>();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('yyyy.MM.dd', context.locale.languageCode);
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        return state.isLoading
            ? const AppLoader()
            : state.history.isEmpty
            ? Center(child: Text('errors.noData'.tr()))
            : Stack(
                children: [
                  ListView.separated(
                    controller: _scrollController,
                    itemCount: state.history.length,
                    physics: const ClampingScrollPhysics(),
                    padding: const .symmetric(horizontal: 16.0),
                    itemBuilder: (context, index) {
                      final item = state.history[index];

                      final current = item.saved;
                      final previous = index > 0
                          ? state.history[index - 1].saved
                          : null;
                      final shouldShowDate =
                          previous == null || !current.isSameDay(previous);

                      return Column(
                        crossAxisAlignment: .stretch,
                        children: [
                          if (shouldShowDate)
                            Align(
                              alignment: .center,
                              child: Text(formatter.format(current)),
                            ),
                          HistoryItem(
                            key: ValueKey(item.saved.microsecondsSinceEpoch),
                            history: item,
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8.0),
                  ),
                  if (state.isShowLoader)
                    Positioned(
                      bottom: 16.0,
                      left: 0,
                      right: 0,
                      child: AppLoader.small(),
                    ),
                ],
              );
      },
    );
  }
}

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key, required this.history});

  final HistoryEntity history;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.bodyMedium;
    final time = DateFormat.Hm().format(history.saved);
    final isTranslation = history.testType == TestType.translation;
    final isFlashcards = history.testType == TestType.flashcards;
    return Card(
      child: Padding(
        padding: const .all(8.0),
        child: Column(
          spacing: 8.0,
          crossAxisAlignment: .start,
          children: [
            Text(
              '${'historyPage.testType'.tr()}: ${history.testType.translateToRu()}',
              style: style,
            ),
            Text(
              '${isFlashcards ? 'historyPage.cardsCount'.tr() : 'historyPage.questionCount'.tr()}: ${history.totalAnswers}',
              style: style,
            ),
            if (!isFlashcards)
              Text(
                '${isTranslation ? 'historyPage.score'.tr() : 'historyPage.correctAnswers'.tr()}: ${history.correctAnswers}',
                style: style,
              ),
            Text(time, style: theme.textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
