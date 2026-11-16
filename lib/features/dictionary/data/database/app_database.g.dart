// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $WordsTable extends Words with TableInfo<$WordsTable, Word> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _englishWordMeta = const VerificationMeta(
    'englishWord',
  );
  @override
  late final GeneratedColumn<String> englishWord = GeneratedColumn<String>(
    'english_word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _russianWordMeta = const VerificationMeta(
    'russianWord',
  );
  @override
  late final GeneratedColumn<String> russianWord = GeneratedColumn<String>(
    'russian_word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
    'count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _probabilityMeta = const VerificationMeta(
    'probability',
  );
  @override
  late final GeneratedColumn<double> probability = GeneratedColumn<double>(
    'probability',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    englishWord,
    russianWord,
    count,
    probability,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'words';
  @override
  VerificationContext validateIntegrity(
    Insertable<Word> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('english_word')) {
      context.handle(
        _englishWordMeta,
        englishWord.isAcceptableOrUnknown(
          data['english_word']!,
          _englishWordMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_englishWordMeta);
    }
    if (data.containsKey('russian_word')) {
      context.handle(
        _russianWordMeta,
        russianWord.isAcceptableOrUnknown(
          data['russian_word']!,
          _russianWordMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_russianWordMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
        _countMeta,
        count.isAcceptableOrUnknown(data['count']!, _countMeta),
      );
    }
    if (data.containsKey('probability')) {
      context.handle(
        _probabilityMeta,
        probability.isAcceptableOrUnknown(
          data['probability']!,
          _probabilityMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {englishWord, russianWord};
  @override
  Word map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Word(
      englishWord: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}english_word'],
      )!,
      russianWord: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}russian_word'],
      )!,
      count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}count'],
      ),
      probability: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}probability'],
      ),
    );
  }

  @override
  $WordsTable createAlias(String alias) {
    return $WordsTable(attachedDatabase, alias);
  }
}

class Word extends DataClass implements Insertable<Word> {
  final String englishWord;
  final String russianWord;
  final int? count;
  final double? probability;
  const Word({
    required this.englishWord,
    required this.russianWord,
    this.count,
    this.probability,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['english_word'] = Variable<String>(englishWord);
    map['russian_word'] = Variable<String>(russianWord);
    if (!nullToAbsent || count != null) {
      map['count'] = Variable<int>(count);
    }
    if (!nullToAbsent || probability != null) {
      map['probability'] = Variable<double>(probability);
    }
    return map;
  }

  WordsCompanion toCompanion(bool nullToAbsent) {
    return WordsCompanion(
      englishWord: Value(englishWord),
      russianWord: Value(russianWord),
      count: count == null && nullToAbsent
          ? const Value.absent()
          : Value(count),
      probability: probability == null && nullToAbsent
          ? const Value.absent()
          : Value(probability),
    );
  }

  factory Word.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Word(
      englishWord: serializer.fromJson<String>(json['englishWord']),
      russianWord: serializer.fromJson<String>(json['russianWord']),
      count: serializer.fromJson<int?>(json['count']),
      probability: serializer.fromJson<double?>(json['probability']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'englishWord': serializer.toJson<String>(englishWord),
      'russianWord': serializer.toJson<String>(russianWord),
      'count': serializer.toJson<int?>(count),
      'probability': serializer.toJson<double?>(probability),
    };
  }

  Word copyWith({
    String? englishWord,
    String? russianWord,
    Value<int?> count = const Value.absent(),
    Value<double?> probability = const Value.absent(),
  }) => Word(
    englishWord: englishWord ?? this.englishWord,
    russianWord: russianWord ?? this.russianWord,
    count: count.present ? count.value : this.count,
    probability: probability.present ? probability.value : this.probability,
  );
  Word copyWithCompanion(WordsCompanion data) {
    return Word(
      englishWord: data.englishWord.present
          ? data.englishWord.value
          : this.englishWord,
      russianWord: data.russianWord.present
          ? data.russianWord.value
          : this.russianWord,
      count: data.count.present ? data.count.value : this.count,
      probability: data.probability.present
          ? data.probability.value
          : this.probability,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Word(')
          ..write('englishWord: $englishWord, ')
          ..write('russianWord: $russianWord, ')
          ..write('count: $count, ')
          ..write('probability: $probability')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(englishWord, russianWord, count, probability);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Word &&
          other.englishWord == this.englishWord &&
          other.russianWord == this.russianWord &&
          other.count == this.count &&
          other.probability == this.probability);
}

class WordsCompanion extends UpdateCompanion<Word> {
  final Value<String> englishWord;
  final Value<String> russianWord;
  final Value<int?> count;
  final Value<double?> probability;
  final Value<int> rowid;
  const WordsCompanion({
    this.englishWord = const Value.absent(),
    this.russianWord = const Value.absent(),
    this.count = const Value.absent(),
    this.probability = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WordsCompanion.insert({
    required String englishWord,
    required String russianWord,
    this.count = const Value.absent(),
    this.probability = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : englishWord = Value(englishWord),
       russianWord = Value(russianWord);
  static Insertable<Word> custom({
    Expression<String>? englishWord,
    Expression<String>? russianWord,
    Expression<int>? count,
    Expression<double>? probability,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (englishWord != null) 'english_word': englishWord,
      if (russianWord != null) 'russian_word': russianWord,
      if (count != null) 'count': count,
      if (probability != null) 'probability': probability,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WordsCompanion copyWith({
    Value<String>? englishWord,
    Value<String>? russianWord,
    Value<int?>? count,
    Value<double?>? probability,
    Value<int>? rowid,
  }) {
    return WordsCompanion(
      englishWord: englishWord ?? this.englishWord,
      russianWord: russianWord ?? this.russianWord,
      count: count ?? this.count,
      probability: probability ?? this.probability,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (englishWord.present) {
      map['english_word'] = Variable<String>(englishWord.value);
    }
    if (russianWord.present) {
      map['russian_word'] = Variable<String>(russianWord.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (probability.present) {
      map['probability'] = Variable<double>(probability.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordsCompanion(')
          ..write('englishWord: $englishWord, ')
          ..write('russianWord: $russianWord, ')
          ..write('count: $count, ')
          ..write('probability: $probability, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HistoryTableTable extends HistoryTable
    with TableInfo<$HistoryTableTable, HistoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HistoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<TestType, String> testType =
      GeneratedColumn<String>(
        'test_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<TestType>($HistoryTableTable.$convertertestType);
  static const VerificationMeta _savedMeta = const VerificationMeta('saved');
  @override
  late final GeneratedColumn<DateTime> saved = GeneratedColumn<DateTime>(
    'saved',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _correctAnswersMeta = const VerificationMeta(
    'correctAnswers',
  );
  @override
  late final GeneratedColumn<int> correctAnswers = GeneratedColumn<int>(
    'correct_answers',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalAnswersMeta = const VerificationMeta(
    'totalAnswers',
  );
  @override
  late final GeneratedColumn<int> totalAnswers = GeneratedColumn<int>(
    'total_answers',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    testType,
    saved,
    correctAnswers,
    totalAnswers,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'history_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<HistoryTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('saved')) {
      context.handle(
        _savedMeta,
        saved.isAcceptableOrUnknown(data['saved']!, _savedMeta),
      );
    } else if (isInserting) {
      context.missing(_savedMeta);
    }
    if (data.containsKey('correct_answers')) {
      context.handle(
        _correctAnswersMeta,
        correctAnswers.isAcceptableOrUnknown(
          data['correct_answers']!,
          _correctAnswersMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_correctAnswersMeta);
    }
    if (data.containsKey('total_answers')) {
      context.handle(
        _totalAnswersMeta,
        totalAnswers.isAcceptableOrUnknown(
          data['total_answers']!,
          _totalAnswersMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalAnswersMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HistoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HistoryTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      testType: $HistoryTableTable.$convertertestType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}test_type'],
        )!,
      ),
      saved: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}saved'],
      )!,
      correctAnswers: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}correct_answers'],
      )!,
      totalAnswers: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_answers'],
      )!,
    );
  }

  @override
  $HistoryTableTable createAlias(String alias) {
    return $HistoryTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TestType, String, String> $convertertestType =
      const EnumNameConverter<TestType>(TestType.values);
}

class HistoryTableData extends DataClass
    implements Insertable<HistoryTableData> {
  final int id;
  final TestType testType;
  final DateTime saved;
  final int correctAnswers;
  final int totalAnswers;
  const HistoryTableData({
    required this.id,
    required this.testType,
    required this.saved,
    required this.correctAnswers,
    required this.totalAnswers,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['test_type'] = Variable<String>(
        $HistoryTableTable.$convertertestType.toSql(testType),
      );
    }
    map['saved'] = Variable<DateTime>(saved);
    map['correct_answers'] = Variable<int>(correctAnswers);
    map['total_answers'] = Variable<int>(totalAnswers);
    return map;
  }

  HistoryTableCompanion toCompanion(bool nullToAbsent) {
    return HistoryTableCompanion(
      id: Value(id),
      testType: Value(testType),
      saved: Value(saved),
      correctAnswers: Value(correctAnswers),
      totalAnswers: Value(totalAnswers),
    );
  }

  factory HistoryTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HistoryTableData(
      id: serializer.fromJson<int>(json['id']),
      testType: $HistoryTableTable.$convertertestType.fromJson(
        serializer.fromJson<String>(json['testType']),
      ),
      saved: serializer.fromJson<DateTime>(json['saved']),
      correctAnswers: serializer.fromJson<int>(json['correctAnswers']),
      totalAnswers: serializer.fromJson<int>(json['totalAnswers']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'testType': serializer.toJson<String>(
        $HistoryTableTable.$convertertestType.toJson(testType),
      ),
      'saved': serializer.toJson<DateTime>(saved),
      'correctAnswers': serializer.toJson<int>(correctAnswers),
      'totalAnswers': serializer.toJson<int>(totalAnswers),
    };
  }

  HistoryTableData copyWith({
    int? id,
    TestType? testType,
    DateTime? saved,
    int? correctAnswers,
    int? totalAnswers,
  }) => HistoryTableData(
    id: id ?? this.id,
    testType: testType ?? this.testType,
    saved: saved ?? this.saved,
    correctAnswers: correctAnswers ?? this.correctAnswers,
    totalAnswers: totalAnswers ?? this.totalAnswers,
  );
  HistoryTableData copyWithCompanion(HistoryTableCompanion data) {
    return HistoryTableData(
      id: data.id.present ? data.id.value : this.id,
      testType: data.testType.present ? data.testType.value : this.testType,
      saved: data.saved.present ? data.saved.value : this.saved,
      correctAnswers: data.correctAnswers.present
          ? data.correctAnswers.value
          : this.correctAnswers,
      totalAnswers: data.totalAnswers.present
          ? data.totalAnswers.value
          : this.totalAnswers,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HistoryTableData(')
          ..write('id: $id, ')
          ..write('testType: $testType, ')
          ..write('saved: $saved, ')
          ..write('correctAnswers: $correctAnswers, ')
          ..write('totalAnswers: $totalAnswers')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, testType, saved, correctAnswers, totalAnswers);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HistoryTableData &&
          other.id == this.id &&
          other.testType == this.testType &&
          other.saved == this.saved &&
          other.correctAnswers == this.correctAnswers &&
          other.totalAnswers == this.totalAnswers);
}

class HistoryTableCompanion extends UpdateCompanion<HistoryTableData> {
  final Value<int> id;
  final Value<TestType> testType;
  final Value<DateTime> saved;
  final Value<int> correctAnswers;
  final Value<int> totalAnswers;
  const HistoryTableCompanion({
    this.id = const Value.absent(),
    this.testType = const Value.absent(),
    this.saved = const Value.absent(),
    this.correctAnswers = const Value.absent(),
    this.totalAnswers = const Value.absent(),
  });
  HistoryTableCompanion.insert({
    this.id = const Value.absent(),
    required TestType testType,
    required DateTime saved,
    required int correctAnswers,
    required int totalAnswers,
  }) : testType = Value(testType),
       saved = Value(saved),
       correctAnswers = Value(correctAnswers),
       totalAnswers = Value(totalAnswers);
  static Insertable<HistoryTableData> custom({
    Expression<int>? id,
    Expression<String>? testType,
    Expression<DateTime>? saved,
    Expression<int>? correctAnswers,
    Expression<int>? totalAnswers,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (testType != null) 'test_type': testType,
      if (saved != null) 'saved': saved,
      if (correctAnswers != null) 'correct_answers': correctAnswers,
      if (totalAnswers != null) 'total_answers': totalAnswers,
    });
  }

  HistoryTableCompanion copyWith({
    Value<int>? id,
    Value<TestType>? testType,
    Value<DateTime>? saved,
    Value<int>? correctAnswers,
    Value<int>? totalAnswers,
  }) {
    return HistoryTableCompanion(
      id: id ?? this.id,
      testType: testType ?? this.testType,
      saved: saved ?? this.saved,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      totalAnswers: totalAnswers ?? this.totalAnswers,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (testType.present) {
      map['test_type'] = Variable<String>(
        $HistoryTableTable.$convertertestType.toSql(testType.value),
      );
    }
    if (saved.present) {
      map['saved'] = Variable<DateTime>(saved.value);
    }
    if (correctAnswers.present) {
      map['correct_answers'] = Variable<int>(correctAnswers.value);
    }
    if (totalAnswers.present) {
      map['total_answers'] = Variable<int>(totalAnswers.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistoryTableCompanion(')
          ..write('id: $id, ')
          ..write('testType: $testType, ')
          ..write('saved: $saved, ')
          ..write('correctAnswers: $correctAnswers, ')
          ..write('totalAnswers: $totalAnswers')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $WordsTable words = $WordsTable(this);
  late final $HistoryTableTable historyTable = $HistoryTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [words, historyTable];
}

typedef $$WordsTableCreateCompanionBuilder = WordsCompanion Function({
  required String englishWord,
  required String russianWord,
  Value<int?> count,
  Value<double?> probability,
  Value<int> rowid,
});
typedef $$WordsTableUpdateCompanionBuilder = WordsCompanion Function({
  Value<String> englishWord,
  Value<String> russianWord,
  Value<int?> count,
  Value<double?> probability,
  Value<int> rowid,
});

class $$WordsTableFilterComposer extends Composer<_$AppDatabase, $WordsTable> {
  $$WordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get englishWord => $composableBuilder(
    column: $table.englishWord,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get russianWord => $composableBuilder(
    column: $table.russianWord,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get probability => $composableBuilder(
    column: $table.probability,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WordsTableOrderingComposer
    extends Composer<_$AppDatabase, $WordsTable> {
  $$WordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get englishWord => $composableBuilder(
    column: $table.englishWord,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get russianWord => $composableBuilder(
    column: $table.russianWord,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get probability => $composableBuilder(
    column: $table.probability,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WordsTable> {
  $$WordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get englishWord => $composableBuilder(
    column: $table.englishWord,
    builder: (column) => column,
  );

  GeneratedColumn<String> get russianWord => $composableBuilder(
    column: $table.russianWord,
    builder: (column) => column,
  );

  GeneratedColumn<int> get count =>
      $composableBuilder(column: $table.count, builder: (column) => column);

  GeneratedColumn<double> get probability => $composableBuilder(
    column: $table.probability,
    builder: (column) => column,
  );
}

class $$WordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WordsTable,
          Word,
          $$WordsTableFilterComposer,
          $$WordsTableOrderingComposer,
          $$WordsTableAnnotationComposer,
          $$WordsTableCreateCompanionBuilder,
          $$WordsTableUpdateCompanionBuilder,
          (Word, BaseReferences<_$AppDatabase, $WordsTable, Word>),
          Word,
          PrefetchHooks Function()
        > {
  $$WordsTableTableManager(_$AppDatabase db, $WordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> englishWord = const Value.absent(),
                Value<String> russianWord = const Value.absent(),
                Value<int?> count = const Value.absent(),
                Value<double?> probability = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WordsCompanion(
                englishWord: englishWord,
                russianWord: russianWord,
                count: count,
                probability: probability,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String englishWord,
                required String russianWord,
                Value<int?> count = const Value.absent(),
                Value<double?> probability = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WordsCompanion.insert(
                englishWord: englishWord,
                russianWord: russianWord,
                count: count,
                probability: probability,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$WordsTable, Word>(table),
                  BaseReferences<_$AppDatabase, $WordsTable, Word>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WordsTable,
      Word,
      $$WordsTableFilterComposer,
      $$WordsTableOrderingComposer,
      $$WordsTableAnnotationComposer,
      $$WordsTableCreateCompanionBuilder,
      $$WordsTableUpdateCompanionBuilder,
      (Word, BaseReferences<_$AppDatabase, $WordsTable, Word>),
      Word,
      PrefetchHooks Function()
    >;
typedef $$HistoryTableTableCreateCompanionBuilder =
    HistoryTableCompanion Function({
      Value<int> id,
      required TestType testType,
      required DateTime saved,
      required int correctAnswers,
      required int totalAnswers,
    });
typedef $$HistoryTableTableUpdateCompanionBuilder =
    HistoryTableCompanion Function({
      Value<int> id,
      Value<TestType> testType,
      Value<DateTime> saved,
      Value<int> correctAnswers,
      Value<int> totalAnswers,
    });

class $$HistoryTableTableFilterComposer
    extends Composer<_$AppDatabase, $HistoryTableTable> {
  $$HistoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<TestType, TestType, String> get testType =>
      $composableBuilder(
        column: $table.testType,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<DateTime> get saved => $composableBuilder(
    column: $table.saved,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get correctAnswers => $composableBuilder(
    column: $table.correctAnswers,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalAnswers => $composableBuilder(
    column: $table.totalAnswers,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HistoryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $HistoryTableTable> {
  $$HistoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get testType => $composableBuilder(
    column: $table.testType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get saved => $composableBuilder(
    column: $table.saved,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get correctAnswers => $composableBuilder(
    column: $table.correctAnswers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalAnswers => $composableBuilder(
    column: $table.totalAnswers,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HistoryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $HistoryTableTable> {
  $$HistoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TestType, String> get testType =>
      $composableBuilder(column: $table.testType, builder: (column) => column);

  GeneratedColumn<DateTime> get saved =>
      $composableBuilder(column: $table.saved, builder: (column) => column);

  GeneratedColumn<int> get correctAnswers => $composableBuilder(
    column: $table.correctAnswers,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalAnswers => $composableBuilder(
    column: $table.totalAnswers,
    builder: (column) => column,
  );
}

class $$HistoryTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HistoryTableTable,
          HistoryTableData,
          $$HistoryTableTableFilterComposer,
          $$HistoryTableTableOrderingComposer,
          $$HistoryTableTableAnnotationComposer,
          $$HistoryTableTableCreateCompanionBuilder,
          $$HistoryTableTableUpdateCompanionBuilder,
          (
            HistoryTableData,
            BaseReferences<_$AppDatabase, $HistoryTableTable, HistoryTableData>,
          ),
          HistoryTableData,
          PrefetchHooks Function()
        > {
  $$HistoryTableTableTableManager(_$AppDatabase db, $HistoryTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HistoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HistoryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HistoryTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<TestType> testType = const Value.absent(),
                Value<DateTime> saved = const Value.absent(),
                Value<int> correctAnswers = const Value.absent(),
                Value<int> totalAnswers = const Value.absent(),
              }) => HistoryTableCompanion(
                id: id,
                testType: testType,
                saved: saved,
                correctAnswers: correctAnswers,
                totalAnswers: totalAnswers,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required TestType testType,
                required DateTime saved,
                required int correctAnswers,
                required int totalAnswers,
              }) => HistoryTableCompanion.insert(
                id: id,
                testType: testType,
                saved: saved,
                correctAnswers: correctAnswers,
                totalAnswers: totalAnswers,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$HistoryTableTable, HistoryTableData>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $HistoryTableTable,
                    HistoryTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HistoryTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HistoryTableTable,
      HistoryTableData,
      $$HistoryTableTableFilterComposer,
      $$HistoryTableTableOrderingComposer,
      $$HistoryTableTableAnnotationComposer,
      $$HistoryTableTableCreateCompanionBuilder,
      $$HistoryTableTableUpdateCompanionBuilder,
      (
        HistoryTableData,
        BaseReferences<_$AppDatabase, $HistoryTableTable, HistoryTableData>,
      ),
      HistoryTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$WordsTableTableManager get words =>
      $$WordsTableTableManager(_db, _db.words);
  $$HistoryTableTableTableManager get historyTable =>
      $$HistoryTableTableTableManager(_db, _db.historyTable);
}
