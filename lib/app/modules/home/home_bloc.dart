import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/app_database.dart';
import '../../data/todo_dao.dart';
import '../../shared/models/synced_list_model.dart';
import '../../shared/repositories/hasura_repository.dart';

class HomeBloc extends Disposable {
  final ToDoListsDao _toDoListsDao;
  final HasuraRepository _repo;
  final TextEditingController descText$ = TextEditingController();
  Stream _listWatch;
  HomeBloc(this._toDoListsDao, this._repo) {
    _listWatch = _toDoListsDao.watchToDoLists();
    _listWatch.listen((data) => inList.add(data));
  }

  BehaviorSubject<List<ToDoList>> _toDoList$ =
      BehaviorSubject<List<ToDoList>>();
  Sink<List<ToDoList>> get inList => _toDoList$.sink;
  Stream<List<ToDoList>> get outList => _toDoList$.stream;

  addToDoList() async {
    if (descText$.text.isNotEmpty) {
      ToDoListsCompanion newList = ToDoListsCompanion(
        desc: Value(descText$.text),
        createdAt: Value(DateTime.now().toIso8601String()),
        updatedAt: Value(DateTime.now().toIso8601String()),
      );
      _toDoListsDao.insertToDoList(newList);
      descText$.clear();
    }
  }

  syncLists() async {
    List<ToDoList> unSyncedLists = await _toDoListsDao.getUnsyncedLists();
    List<SyncedListModel> syncedLists = await _repo.syncLists(unSyncedLists);
    unSyncedLists.forEach((unSyncedList) {
      syncedLists.forEach((syncedList) {
        if (syncedList.idSqlite == unSyncedList.id) {
          ToDoList update = unSyncedList.copyWith(
              synced: true, updatedAt: DateTime.now().toIso8601String());
          _toDoListsDao.updateToDoList(update);
        }
      });
    });
  }

  deleteAll() async {
    _toDoListsDao.deleteAll();
    await _repo.deleteAllLists();
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() async {
    await _listWatch.drain();
    await _toDoList$.close();
  }
}
