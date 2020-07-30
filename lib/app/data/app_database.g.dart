// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ToDoList extends DataClass implements Insertable<ToDoList> {
  final int id;
  final String desc;
  final String createdAt;
  final String updatedAt;
  final bool synced;
  ToDoList(
      {@required this.id,
      @required this.desc,
      @required this.createdAt,
      @required this.updatedAt,
      @required this.synced});
  factory ToDoList.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return ToDoList(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      desc: stringType.mapFromDatabaseResponse(data['${effectivePrefix}desc']),
      createdAt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
      synced:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}synced']),
    );
  }
  factory ToDoList.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ToDoList(
      id: serializer.fromJson<int>(json['id']),
      desc: serializer.fromJson<String>(json['desc']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      synced: serializer.fromJson<bool>(json['synced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'desc': serializer.toJson<String>(desc),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'synced': serializer.toJson<bool>(synced),
    };
  }

  @override
  ToDoListsCompanion createCompanion(bool nullToAbsent) {
    return ToDoListsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      desc: desc == null && nullToAbsent ? const Value.absent() : Value(desc),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      synced:
          synced == null && nullToAbsent ? const Value.absent() : Value(synced),
    );
  }

  ToDoList copyWith(
          {int id,
          String desc,
          String createdAt,
          String updatedAt,
          bool synced}) =>
      ToDoList(
        id: id ?? this.id,
        desc: desc ?? this.desc,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        synced: synced ?? this.synced,
      );
  @override
  String toString() {
    return (StringBuffer('ToDoList(')
          ..write('id: $id, ')
          ..write('desc: $desc, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          desc.hashCode,
          $mrjc(createdAt.hashCode,
              $mrjc(updatedAt.hashCode, synced.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ToDoList &&
          other.id == this.id &&
          other.desc == this.desc &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.synced == this.synced);
}

class ToDoListsCompanion extends UpdateCompanion<ToDoList> {
  final Value<int> id;
  final Value<String> desc;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<bool> synced;
  const ToDoListsCompanion({
    this.id = const Value.absent(),
    this.desc = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synced = const Value.absent(),
  });
  ToDoListsCompanion.insert({
    this.id = const Value.absent(),
    @required String desc,
    @required String createdAt,
    @required String updatedAt,
    this.synced = const Value.absent(),
  })  : desc = Value(desc),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  ToDoListsCompanion copyWith(
      {Value<int> id,
      Value<String> desc,
      Value<String> createdAt,
      Value<String> updatedAt,
      Value<bool> synced}) {
    return ToDoListsCompanion(
      id: id ?? this.id,
      desc: desc ?? this.desc,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synced: synced ?? this.synced,
    );
  }
}

class $ToDoListsTable extends ToDoLists
    with TableInfo<$ToDoListsTable, ToDoList> {
  final GeneratedDatabase _db;
  final String _alias;
  $ToDoListsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _descMeta = const VerificationMeta('desc');
  GeneratedTextColumn _desc;
  @override
  GeneratedTextColumn get desc => _desc ??= _constructDesc();
  GeneratedTextColumn _constructDesc() {
    return GeneratedTextColumn(
      'desc',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedTextColumn _createdAt;
  @override
  GeneratedTextColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedTextColumn _constructCreatedAt() {
    return GeneratedTextColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedTextColumn _updatedAt;
  @override
  GeneratedTextColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedTextColumn _constructUpdatedAt() {
    return GeneratedTextColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _syncedMeta = const VerificationMeta('synced');
  GeneratedBoolColumn _synced;
  @override
  GeneratedBoolColumn get synced => _synced ??= _constructSynced();
  GeneratedBoolColumn _constructSynced() {
    return GeneratedBoolColumn('synced', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, desc, createdAt, updatedAt, synced];
  @override
  $ToDoListsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'to_do_lists';
  @override
  final String actualTableName = 'to_do_lists';
  @override
  VerificationContext validateIntegrity(ToDoListsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.desc.present) {
      context.handle(
          _descMeta, desc.isAcceptableValue(d.desc.value, _descMeta));
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    if (d.createdAt.present) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableValue(d.createdAt.value, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (d.updatedAt.present) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableValue(d.updatedAt.value, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (d.synced.present) {
      context.handle(
          _syncedMeta, synced.isAcceptableValue(d.synced.value, _syncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ToDoList map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ToDoList.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ToDoListsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.desc.present) {
      map['desc'] = Variable<String, StringType>(d.desc.value);
    }
    if (d.createdAt.present) {
      map['created_at'] = Variable<String, StringType>(d.createdAt.value);
    }
    if (d.updatedAt.present) {
      map['updated_at'] = Variable<String, StringType>(d.updatedAt.value);
    }
    if (d.synced.present) {
      map['synced'] = Variable<bool, BoolType>(d.synced.value);
    }
    return map;
  }

  @override
  $ToDoListsTable createAlias(String alias) {
    return $ToDoListsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ToDoListsTable _toDoLists;
  $ToDoListsTable get toDoLists => _toDoLists ??= $ToDoListsTable(this);
  ToDoListsDao _toDoListsDao;
  ToDoListsDao get toDoListsDao =>
      _toDoListsDao ??= ToDoListsDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [toDoLists];
}
