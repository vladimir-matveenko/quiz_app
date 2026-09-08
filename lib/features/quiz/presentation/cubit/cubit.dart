import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quiz_app/app/constants/app_enums.dart';
import 'package:quiz_app/app/constants/asset_paths.dart';
import 'package:quiz_app/core/utils/extensions.dart';
import 'package:vibration/vibration.dart';

import '../../../dictionary/data/data_sources/dictionary_local_data_source.dart';
import '../../../dictionary/data/database/app_database.dart';
import '../../../dictionary/services/tts_service.dart';
import 'state.dart';

enum QuizStatus { initial, loading, loaded, completed, error }

@lazySingleton
class QuizCubit extends Cubit<QuizState> {
  QuizCubit(this._dataSource, this._ttsService) : super(const QuizState());
  final DictionaryLocalDataSource _dataSource;
  final TtsService _ttsService;
  TranslationType type = TranslationType.enRu;

  Future<void> loadWords({
    required TranslationType type,
    bool loadAdditionalWords = false,
    int wordCount = 10,
  }) async {
    try {
      List<String> additionalWords = [];
      List<String> answers = [];
      this.type = type;
      await _ttsService.setLanguage(type.questionFor);
      emit(state.copyWith(status: QuizStatus.loading));
      final words = await _dataSource.getQuizWords(wordCount);
      if (loadAdditionalWords) {
        final list = await _dataSource.getWords(wordCount);
        additionalWords = getAdditionalWords(list);
        answers = getAnswers(
          current: words.first,
          additionalWords: additionalWords,
        );
      }
      if (words.isEmpty) {
        emit(
          state.copyWith(
            status: QuizStatus.error,
            errorMessage: 'errors.noWords'.tr(),
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: QuizStatus.loaded,
            words: words,
            additionalWords: additionalWords,
            answers: answers,
            currentIndex: 0,
            answered: false,
            correct: false,
            correctCount: 0,
          ),
        );
      }
    } catch (e, st) {
      log(st.toString());
      emit(state.copyWith(errorMessage: '${'errors.noWords'.tr()}: $e'));
    }
  }

  List<String> getAdditionalWords(List<Word> words) {
    final shuffled = List<Word>.from(words)..shuffle();

    return shuffled.map((e) => e.answerFor(type)).toList();
  }

  List<String> getAnswers({
    required Word current,
    required List<String> additionalWords,
  }) {
    final answer = current.answerFor(type);
    final tmp = [...additionalWords]..shuffle();
    final answers = tmp.take(3).toList();
    answers.add(answer);
    answers.shuffle();
    return answers;
  }

  Future<void> checkAnswer(String userAnswer, {bool goToNext = false}) async {
    if (state.status != QuizStatus.loaded) return;
    final currentWord = state.words[state.currentIndex];
    final correctAnswer = currentWord.answerFor(type).normalize();
    final isCorrect = userAnswer.normalize() == correctAnswer;
    if (!isCorrect) {
      if (await Vibration.hasVibrator()) {
        Vibration.vibrate();
      }
    }
    emit(
      state.copyWith(
        answered: true,
        correct: isCorrect,
        userAnswer: userAnswer.trim(),
      ),
    );
    if (goToNext) {
      Future.delayed(const Duration(seconds: 2), () {
        nextQuestion(loadAdditionalWords: true);
      });
    }
  }

  String getCup({required int total, required int correct}) {
    final percent = total != 0 ? (correct / total) : 0;
    if (percent >= 0.8) {
      return AssetPaths.goldenCup;
    }
    if (percent >= 0.6) {
      return AssetPaths.silverCup;
    }
    return AssetPaths.bronzeCup;
  }

  void nextQuestion({bool loadAdditionalWords = false}) {
    if (state.status != QuizStatus.loaded) return;
    final nextIndex = state.currentIndex + 1;
    final correctCount = state.correctCount + (state.correct ? 1 : 0);
    if (nextIndex >= state.words.length) {
      emit(
        state.copyWith(
          status: QuizStatus.completed,
          correctCount: correctCount,
        ),
      );
    } else {
      List<String> answers = [];
      if (loadAdditionalWords) {
        final current = state.words[nextIndex];
        answers = getAnswers(
          current: current,
          additionalWords: state.additionalWords,
        );
      }
      emit(
        state.copyWith(
          status: QuizStatus.loaded,
          answers: answers,
          currentIndex: nextIndex,
          answered: false,
          userAnswer: null,
          correct: false,
          correctCount: correctCount,
        ),
      );
    }
  }

  /// uses for flashcards only
  void previousQuestion() {
    if (state.status != QuizStatus.loaded) return;
    if (state.currentIndex == 0) return;
    final previousIndex = state.currentIndex - 1;
    emit(
      state.copyWith(
        status: QuizStatus.loaded,
        currentIndex: previousIndex,
        answered: false,
        userAnswer: null,
        correct: false,
      ),
    );
  }

  Future<void> pronounceWord(String word, {String? language}) async {
    if (language != null) {
      await _ttsService.setLanguage(language);
    }
    await _ttsService.speak(word);
  }
}
