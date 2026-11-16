import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:quiz_app/core/presentation/widgets/app_back_button.dart';
import 'package:quiz_app/features/history/presentation/cubit/cubit.dart';
import 'package:quiz_app/features/history/presentation/widgets/history_list.dart';

import '../../../../core/presentation/widgets/app_dialog.dart';
import '../../../../core/presentation/widgets/calendar.dart';
import '../cubit/state.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  void _openCalendar(BuildContext context) {
    final now = DateTime.now();
    context.read<HistoryCubit>().loadMonthHistory(now);
    final screenSize = MediaQuery.sizeOf(context);
    final isLandscape = screenSize.width > screenSize.height;
    AppDialog.empty(
      context,
      content: Container(
        margin: const .all(24.0),
        constraints: BoxConstraints(
          maxHeight: isLandscape
              ? screenSize.height - 32.0
              : screenSize.height * 0.8,
          maxWidth: isLandscape
              ? screenSize.height * 0.8
              : screenSize.width - 32.0,
        ),
        child: BlocBuilder<HistoryCubit, HistoryState>(
          builder: (context, state) {
            return AppCalendar(
              specialDays: state.trainingDays,
              specialDaysText: 'calendar.trainingDays'.tr(),
              onMonthChanged: (date) {
                context.read<HistoryCubit>().loadMonthHistory(date);
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('historyPage.screenName'.tr()),
        centerTitle: true,
        leading: const AppBackButton(),
        actions: [
          IconButton(
            onPressed: () {
              _openCalendar(context);
            },
            icon: const Icon(Icons.calendar_month),
          ),
        ],
      ),
      body: const HistoryList(),
    );
  }
}
