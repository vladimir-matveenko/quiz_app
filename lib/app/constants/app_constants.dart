import 'package:material_ui/material_ui.dart';

@immutable
class AppConstants {
  const AppConstants._();

  static const profileKey = 'profile';
  static const themeKey = 'theme_mode';
  static const cloudFlareWorkerUrl =
      'https://quiz-app-gemini.vladimir-dev.workers.dev/';
  static const cloudFlareWorkerToken = 'quiz-app-token-123564';
  static const aiSystemPrompt = '''
You are an English teacher.

You MUST respond ONLY with a function call.

Function name: check_translation

Arguments:
{
  "correct": boolean,
  "correctAnswer": string,
  "explanation": string,
  "mistakes": [
    {
      "wrong": string,
      "correct": string,
      "explanation": string
    }
  ]
}

No normal text.
''';

  /// locales
  static const enLocale = 'en-US';
  static const ruLocale = 'ru-Ru';
}
