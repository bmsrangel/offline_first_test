import 'package:moor_flutter/moor_flutter.dart';

import 'tables.dart';
import 'todo_dao.dart';

part 'app_database.g.dart';

@UseMoor(tables: [ToDoLists], daos: [ToDoListsDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'todos.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}
