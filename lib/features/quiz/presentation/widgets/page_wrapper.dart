import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:quiz_app/core/presentation/widgets/app_loader.dart';

import '../cubit/cubit.dart';
import '../cubit/state.dart';

class PageWrapper extends StatelessWidget {
  const PageWrapper({
    super.key,
    required this.backgroundColor,
    required this.onCompleted,
    required this.onLoaded,
  });

  final Color backgroundColor;
  final Widget Function(QuizState) onCompleted;
  final Widget Function(QuizState) onLoaded;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor,
      child: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          if (state.status == QuizStatus.loading) {
            return const Center(child: AppLoader());
          }
          if (state.status == QuizStatus.completed) {
            return onCompleted(state);
          }
          if (state.status == QuizStatus.loaded) {
            return onLoaded(state);
          }
          if (state.status == QuizStatus.error) {
            return Center(child: Text(state.errorMessage ?? ''));
          }
          log(state.status.toString());
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
