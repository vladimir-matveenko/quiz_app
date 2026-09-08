import 'package:equatable/equatable.dart';
import 'package:quiz_app/app/constants/app_enums.dart';

import '../../data/models/history_model.dart';

class HistoryEntity extends Equatable {
  const HistoryEntity({
    required this.testType,
    required this.saved,
    required this.correctAnswers,
    required this.totalAnswers,
  });

  final TestType testType;
  final DateTime saved;
  final int correctAnswers;
  final int totalAnswers;

  static List<HistoryEntity> fromHistoryModelList(List<HistoryModel> list) {
    return list.map((item) => item.toEntity()).toList();
  }

  @override
  List<Object?> get props => [testType, saved, correctAnswers, totalAnswers];
}

extension HistoryEntityExt on HistoryEntity {
  HistoryModel toModel() => HistoryModel(
    testType: testType,
    saved: saved,
    correctAnswers: correctAnswers,
    totalAnswers: totalAnswers,
  );
}
