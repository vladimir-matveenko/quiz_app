import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final Widget Function(FindMatchesState) onCompleted;
  final Widget Function(FindMatchesState) onLoaded;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor,
      child: BlocBuilder<FindMatchesCubit, FindMatchesState>(
        builder: (context, state) {
          if (state.status == FindMatchesStatus.loading) {
            return const Center(child: AppLoader());
          }
          if (state.status == FindMatchesStatus.completed) {
            return onCompleted(state);
          }
          if (state.status == FindMatchesStatus.loaded) {
            return onLoaded(state);
          }
          if (state.status == FindMatchesStatus.error) {
            return Center(child: Text(state.errorMessage ?? ''));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
