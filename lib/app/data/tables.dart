import 'package:moor_flutter/moor_flutter.dart';

class ToDoLists extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get desc => text()();
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();
  BoolColumn get synced => boolean().withDefault(Constant(false))();
}
