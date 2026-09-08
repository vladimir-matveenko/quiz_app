// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryModel _$HistoryModelFromJson(Map<String, dynamic> json) =>
    _HistoryModel(
      testType: $enumDecode(_$TestTypeEnumMap, json['testType']),
      saved: DateTime.parse(json['saved'] as String),
      correctAnswers: (json['correctAnswers'] as num).toInt(),
      totalAnswers: (json['totalAnswers'] as num).toInt(),
    );

Map<String, dynamic> _$HistoryModelToJson(_HistoryModel instance) =>
    <String, dynamic>{
      'testType': _$TestTypeEnumMap[instance.testType]!,
      'saved': instance.saved.toIso8601String(),
      'correctAnswers': instance.correctAnswers,
      'totalAnswers': instance.totalAnswers,
    };

const _$TestTypeEnumMap = {
  TestType.test: 'test',
  TestType.translate: 'translate',
  TestType.flashcards: 'flashcards',
  TestType.translation: 'translation',
  TestType.listening: 'listening',
  TestType.findMatches: 'findMatches',
};
