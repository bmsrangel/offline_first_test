import 'dart:convert';

import '../../data/app_database.dart';

SyncedListModel syncedListModelFromJson(String str) =>
    SyncedListModel.fromJson(json.decode(str));

String syncedListModelToJson(SyncedListModel data) =>
    json.encode(data.toJson());

class SyncedListModel {
  final int id;
  final int idSqlite;
  final String descr;
  final String createdAt;
  final String updatedAt;

  SyncedListModel({
    this.id,
    this.idSqlite,
    this.descr,
    this.createdAt,
    this.updatedAt,
  });

  factory SyncedListModel.fromJson(Map<String, dynamic> json) =>
      SyncedListModel(
        id: json["id"],
        idSqlite: json["id_sqlite"],
        descr: json["descr"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  factory SyncedListModel.fromToDoList(ToDoList list) => SyncedListModel(
        idSqlite: list.id,
        descr: list.desc,
        createdAt: list.createdAt,
        updatedAt: list.updatedAt,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_sqlite": idSqlite,
        "descr": descr,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
