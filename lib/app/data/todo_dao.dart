import 'package:moor_flutter/moor_flutter.dart';

import 'app_database.dart';
import 'tables.dart';

part 'todo_dao.g.dart';

@UseDao(tables: [ToDoLists])
class ToDoListsDao extends DatabaseAccessor<AppDatabase>
    with _$ToDoListsDaoMixin {
  final AppDatabase db;
  ToDoListsDao(this.db) : super(db);

  Stream<List<ToDoList>> watchToDoLists() => select(db.toDoLists).watch();
  Future insertToDoList(Insertable<ToDoList> list) =>
      into(db.toDoLists).insert(list);
  Future updateToDoList(Insertable<ToDoList> list) =>
      update(db.toDoLists).replace(list);
  Future deleteToDoList(Insertable<ToDoList> list) =>
      delete(db.toDoLists).delete(list);
  Future getUnsyncedLists() =>
      (select(db.toDoLists)..where((tbl) => tbl.synced.equals(false))).get();
  Future deleteAll() => delete(db.toDoLists).go();
}
