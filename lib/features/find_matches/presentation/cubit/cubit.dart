import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quiz_app/app/constants/app_constants.dart';
import 'package:quiz_app/app/constants/asset_paths.dart';
import 'package:vibration/vibration.dart';

import '../../../dictionary/data/data_sources/dictionary_local_data_source.dart';
import '../../../dictionary/data/database/app_database.dart';
import '../../../dictionary/services/tts_service.dart';
import '../../domain/services/tts_queue.dart';
import 'state.dart';

enum FindMatchesStatus { initial, loading, loaded, completed, error }

@lazySingleton
class FindMatchesCubit extends Cubit<FindMatchesState> {
  FindMatchesCubit(this._dataSource, TtsService ttsService)
    : _ttsQueue = TtsQueue(ttsService),
      super(const FindMatchesState());

  final DictionaryLocalDataSource _dataSource;
  final TtsQueue _ttsQueue;
  Timer? _timer;

  @override
  Future<void> close() async {
    _timer?.cancel();
    return super.close();
  }

  Future<void> loadWords({int wordCount = 10}) async {
    try {
      emit(state.copyWith(status: FindMatchesStatus.loading));
      final words = await _dataSource.getQuizWords(wordCount);
      if (words.isEmpty) {
        emit(
          state.copyWith(
            status: FindMatchesStatus.error,
            errorMessage: 'errors.noWords'.tr(),
          ),
        );
      } else {
        final rightWords = List<Word>.from(words);
        rightWords.shuffle();
        emit(
          state.copyWith(
            status: FindMatchesStatus.loaded,
            leftWords: words,
            rightWords: rightWords,
            correct: false,
            errorsCount: 0,
            totalCount: wordCount,
          ),
        );
      }
    } catch (e, st) {
      log(st.toString());
      emit(
        state.copyWith(
          errorMessage: '${'errors.noWords'.tr()}: $e',
          status: FindMatchesStatus.error,
        ),
      );
    }
  }

  void setLeft(Word word) {
    emit(state.copyWith(left: word));
    _ttsQueue.add(text: word.russianWord, language: AppConstants.ruLocale);
    if (state.right != null) {
      checkMatch();
    }
  }

  void setRight(Word word) {
    emit(state.copyWith(right: word));
    _ttsQueue.add(text: word.englishWord, language: AppConstants.enLocale);
    if (state.left != null) {
      checkMatch();
    }
  }

  Future<void> checkMatch() async {
    if (state.status != FindMatchesStatus.loaded) return;
    final isCorrect = state.left == state.right;
    var errorsCount = state.errorsCount;
    if (!isCorrect) {
      errorsCount++;
      if (await Vibration.hasVibrator()) {
        Vibration.vibrate();
      }
    }
    emit(
      state.copyWith(
        correct: isCorrect,
        errorsCount: errorsCount,
        answered: true,
      ),
    );
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 2), removeAnswered);
  }

  void removeAnswered() {
    if (!state.correct) {
      emit(state.copyWith(answered: false, left: null, right: null));
      return;
    }
    var leftWords = List<Word>.from(state.leftWords);
    var rightWords = List<Word>.from(state.rightWords);
    leftWords.remove(state.left);
    rightWords.remove(state.right);
    emit(
      state.copyWith(
        answered: false,
        leftWords: leftWords,
        rightWords: rightWords,
        left: null,
        right: null,
      ),
    );
    if (leftWords.isEmpty) {
      emit(state.copyWith(status: FindMatchesStatus.completed));
    }
  }

  String getCup({required int total, required int errorsCount}) {
    final percent = total != 0 ? 1 - (errorsCount / total) : 0;
    if (percent >= 0.8) {
      return AssetPaths.goldenCup;
    }
    if (percent >= 0.6) {
      return AssetPaths.silverCup;
    }
    return AssetPaths.bronzeCup;
  }
}
