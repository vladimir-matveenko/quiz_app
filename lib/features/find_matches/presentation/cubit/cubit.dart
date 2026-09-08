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
import 'state.dart';

enum FindMatchesStatus { initial, loading, loaded, completed, error }

@lazySingleton
class FindMatchesCubit extends Cubit<FindMatchesState> {
  FindMatchesCubit(this._dataSource, this._ttsService)
    : super(const FindMatchesState());
  final DictionaryLocalDataSource _dataSource;
  final TtsService _ttsService;
  var isSpeaking = false;

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

  Future<void> setLeft(Word word) async {
    if (isSpeaking) return;
    isSpeaking = true;
    await _ttsService.setLanguage(AppConstants.ruLocale);
    emit(state.copyWith(left: word));
    await _ttsService.speak(word.russianWord);
    if (state.right != null) {
      await checkMatch();
    }
    isSpeaking = false;
  }

  Future<void> setRight(Word word) async {
    if (isSpeaking) return;
    isSpeaking = true;
    await _ttsService.setLanguage(AppConstants.enLocale);
    emit(state.copyWith(right: word));
    await _ttsService.speak(word.englishWord);
    if (state.left != null) {
      await checkMatch();
    }
    isSpeaking = false;
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
    Future.delayed(const Duration(seconds: 2), removeAnswered);
  }

  Future<void> removeAnswered() async {
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
      emit(
        state.copyWith(
          status: leftWords.isEmpty
              ? FindMatchesStatus.completed
              : FindMatchesStatus.loaded,
        ),
      );
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
