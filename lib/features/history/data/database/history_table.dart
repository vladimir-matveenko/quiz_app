import 'package:drift/drift.dart';

import '../../../../app/constants/app_enums.dart';

class HistoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get testType => textEnum<TestType>()();

  DateTimeColumn get saved => dateTime()();

  IntColumn get correctAnswers => integer()();

  IntColumn get totalAnswers => integer()();
}
