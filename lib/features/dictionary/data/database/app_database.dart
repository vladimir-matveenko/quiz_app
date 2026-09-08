import 'package:drift/drift.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../history/data/database/history_table.dart';
import '../models/words.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Words, HistoryTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  @override
  int get schemaVersion => 1;
}
