import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quiz_app/app/utils/app_utils.dart';
import 'package:quiz_app/app/constants/app_enums.dart';
import 'package:quiz_app/features/history/presentation/cubit/state.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../domain/entity/history_entity.dart';
import '../../domain/usecases/delete_history_usecase.dart';
import '../../domain/usecases/fetch_history_usecase.dart';
import '../../domain/usecases/fetch_month_history_usecase.dart';
import '../../domain/usecases/save_history_usecase.dart';

@lazySingleton
class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit(
    this._fetchHistoryUseCase,
    this._fetchMonthHistoryUseCase,
    this._saveHistoryUseCase,
    this._deleteHistoryUseCase,
  ) : super(const HistoryState());
  final FetchHistoryUseCase _fetchHistoryUseCase;
  final FetchMonthHistoryUseCase _fetchMonthHistoryUseCase;
  final SaveHistoryUseCase _saveHistoryUseCase;
  final DeleteHistoryUseCase _deleteHistoryUseCase;

  /// pagination data
  static const _pageSize = 10;
  int _offset = 0;
  bool _hasMore = true;
  bool _isLoading = false;

  Future<void> init() async {
    resetPaginationData();
    loadHistory(loadSilent: false);
  }

  void resetPaginationData() {
    _offset = 0;
    _hasMore = true;
    _isLoading = false;
  }

  Future<void> loadHistory({
    bool loadSilent = true,
    int limit = _pageSize,
    int offset = 0,
  }) async {
    if (!loadSilent) {
      emit(state.copyWith(isLoading: true));
    }
    final data = await _fetchHistoryUseCase(
      FetchHistoryParams(limit: limit, offset: offset),
    );

    data.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
            initialized: true,
          ),
        );
      },
      (r) {
        emit(state.copyWith(history: r, isLoading: false, initialized: true));
      },
    );
  }

  Future<void> loadMonthHistory(DateTime date) async {
    final data = await _fetchMonthHistoryUseCase(
      FetchMonthHistoryParams(date: date),
    );

    data.fold(
      (l) {
        emit(state.copyWith(error: AppUtils.parseFailureMessage(l)));
      },
      (r) {
        List<DateTime> trainingDays = [];
        for (var e in r) {
          trainingDays.add(e.saved);
        }
        emit(state.copyWith(trainingDays: trainingDays));
      },
    );
  }

  Future<void> loadMoreHistory() async {
    if (_isLoading || !_hasMore) return;
    _isLoading = true;
    emit(state.copyWith(isShowLoader: true));
    final mode = await _fetchHistoryUseCase(
      FetchHistoryParams(limit: _pageSize, offset: _offset),
    );

    mode.fold(
      (l) {
        emit(
          state.copyWith(
            error: AppUtils.parseFailureMessage(l),
            isLoading: false,
            isShowLoader: false,
          ),
        );
      },
      (r) {
        List<DateTime> trainingDays = [];
        for (var e in r) {
          trainingDays.add(e.saved);
        }
        _offset += r.length;

        if (r.length < _pageSize) {
          _hasMore = false;
        }
        emit(
          state.copyWith(
            history: [...state.history, ...r],
            trainingDays: trainingDays,
            isShowLoader: false,
          ),
        );
      },
    );
    _isLoading = false;
  }

  Future<void> addHistoryItem({
    required TestType testType,
    required int correctAnswers,
    required int totalAnswers,
  }) async {
    emit(state.copyWith(isLoading: true));
    final history = HistoryEntity(
      testType: testType,
      saved: DateTime.now(),
      correctAnswers: correctAnswers,
      totalAnswers: totalAnswers,
    );
    await _saveHistoryUseCase(SaveHistoryParams(history: history));
    resetPaginationData();
    loadHistory();
    loadMonthHistory(DateTime.now());
  }

  Future<void> deleteHistory() async {
    await _deleteHistoryUseCase(NoParams());
    emit(state.copyWith(history: []));
  }
}
