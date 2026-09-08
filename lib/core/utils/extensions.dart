import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../app/constants/app_constants.dart';
import '../../app/constants/app_enums.dart';
import '../../features/dictionary/data/database/app_database.dart';

extension WordX on Word {
  String questionFor(TranslationType type) {
    return type == TranslationType.enRu ? englishWord : russianWord;
  }

  String answerFor(TranslationType type) {
    return type == TranslationType.enRu ? russianWord : englishWord;
  }
}

extension TranslationTypeX on TranslationType {
  String get questionFor => switch (this) {
    TranslationType.enRu => AppConstants.enLocale,
    TranslationType.ruEn => AppConstants.ruLocale,
  };

  String get answerFor => switch (this) {
    TranslationType.enRu => AppConstants.ruLocale,
    TranslationType.ruEn => AppConstants.enLocale,
  };
}

extension StringX on String {
  String normalize() => trim().toLowerCase();
}

extension DateX on DateTime {
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

extension ThemeDataX on ThemeData {
  bool get isDark => brightness == Brightness.dark;

  bool get isLight => brightness == Brightness.light;
}

extension TestTypeX on TestType {
  String translateToRu() => switch (this) {
    TestType.test => 'testsPage.test'.tr(),
    TestType.translate => 'testsPage.translate'.tr(),
    TestType.flashcards => 'testsPage.flashcards'.tr(),
    TestType.translation => 'testsPage.translation'.tr(),
    TestType.listening => 'testsPage.listening'.tr(),
    TestType.findMatches => 'testsPage.findMatches'.tr(),
  };
}
