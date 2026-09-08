import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app/features/find_matches/presentation/cubit/cubit.dart';

import '../../../dictionary/data/database/app_database.dart';

part 'state.freezed.dart';

@freezed
abstract class FindMatchesState with _$FindMatchesState {
  const factory FindMatchesState({
    @Default(FindMatchesStatus.initial) FindMatchesStatus status,
    @Default([]) List<Word> leftWords,
    @Default([]) List<Word> rightWords,
    Word? left,
    Word? right,
    @Default(0) int errorsCount,
    @Default(0) int totalCount,
    @Default(false) bool correct,
    @Default(false) bool answered,
    String? errorMessage,
  }) = _FindMatchesState;
}
