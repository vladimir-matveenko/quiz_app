import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/constants/app_enums.dart';
import '../../domain/entity/history_entity.dart';

part 'history_model.freezed.dart';
part 'history_model.g.dart';

@freezed
abstract class HistoryModel with _$HistoryModel {
  const factory HistoryModel({
    required TestType testType,
    required DateTime saved,
    required int correctAnswers,
    required int totalAnswers,
  }) = _HistoryModel;

  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);

  static List<HistoryModel> fromHistoryEntityList(List<HistoryEntity> list) {
    return list.map((item) => item.toModel()).toList();
  }
}

extension HistoryModelExt on HistoryModel {
  HistoryEntity toEntity() => HistoryEntity(
    testType: testType,
    saved: saved,
    correctAnswers: correctAnswers,
    totalAnswers: totalAnswers,
  );
}
