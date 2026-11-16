import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/app/utils/app_utils.dart';
import 'package:quiz_app/core/error/exception.dart';

void main() {
  group('AppUtils.parseJson', () {
    final json = '''json = {
  "correctTranslation": "I like programming on Flutter.",
  "score": 45,
  "mistakes": [
    {
      "word": "program",
      "suggestion": "programming",
      "reason": "The Russian 'программировать' is an infinitive verb. After 'I like', it should be in the gerund form ('programming') or as an infinitive ('to program'), not the base form 'program' by itself."
    },
    {
      "word": "flutter",
      "suggestion": "on Flutter",
      "reason": "The Russian preposition 'на' (na) in 'на Flutter' indicates the platform or technology being used. This should be translated as 'on' in English (e.g., 'on Flutter')."
    }
  ]
}''';

    test('returns parsed json', () {
      final result = {
        'correctTranslation': 'I like programming on Flutter.',
        'score': 45,
        'mistakes': [
          {
            'word': 'program',
            'suggestion': 'programming',
            'reason': "The Russian 'программировать' is an infinitive verb. After 'I like', it should be in the gerund form ('programming') or as an infinitive ('to program'), not the base form 'program' by itself.",
          },
          {
            'word': 'flutter',
            'suggestion': 'on Flutter',
            'reason': "The Russian preposition 'на' (na) in 'на Flutter' indicates the platform or technology being used. This should be translated as 'on' in English (e.g., 'on Flutter').",
          },
        ],
      };
      final parsed = AppUtils.parseJson(json);
      expect(result, parsed);
    });
  });

  group('AppUtils.parseClientError', () {
    test('SocketException', () {
      final result = AppUtils.parseClientError(const SocketException('text'));
      final expected = 'errors.network.noInternet'.tr();

      expect(result, expected);
    });
    test('TimeoutException', () {
      final result = AppUtils.parseClientError(TimeoutException('text'));
      final expected = 'errors.network.timeout'.tr();

      expect(result, expected);
    });
    test('HandshakeException', () {
      final result = AppUtils.parseClientError(
        const HandshakeException('text'),
      );
      final expected = 'errors.network.sslError'.tr();

      expect(result, expected);
    });
    test('http.ClientException', () {
      final result = AppUtils.parseClientError(http.ClientException('text'));
      final expected = 'errors.network.connectionError'.tr();

      expect(result, expected);
    });
    test('FormatException', () {
      final result = AppUtils.parseClientError(const FormatException('text'));
      final expected = 'errors.geminiErrors.formatException'.tr();

      expect(result, expected);
    });
    test('TypeError', () {
      final result = AppUtils.parseClientError(TypeError());
      final expected = 'errors.geminiErrors.invalidResponse'.tr();

      expect(result, expected);
    });
    test('RangeError', () {
      final result = AppUtils.parseClientError(RangeError('text'));
      final expected = 'errors.geminiErrors.invalidResponse'.tr();

      expect(result, expected);
    });
    test('UnknownException', () {
      final result = AppUtils.parseClientError(UnknownException('text'));
      final expected = 'errors.geminiErrors.unknownError'.tr();

      expect(result, expected);
    });
  });
}
