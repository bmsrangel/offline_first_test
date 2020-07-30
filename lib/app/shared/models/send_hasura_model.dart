import '../../data/app_database.dart';

class SendToHasuraModel {
  final int idSqlite;
  final String descr;
  final String createdAt;
  final String updatedAt;

  SendToHasuraModel({
    this.idSqlite,
    this.descr,
    this.createdAt,
    this.updatedAt,
  });

  factory SendToHasuraModel.fromJson(Map<String, dynamic> json) =>
      SendToHasuraModel(
        idSqlite: json["id_sqlite"],
        descr: json["descr"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  factory SendToHasuraModel.fromToDoList(ToDoList list) => SendToHasuraModel(
        idSqlite: list.id,
        descr: list.desc,
        createdAt: list.createdAt,
        updatedAt: list.updatedAt,
      );

  Map<String, dynamic> toJson() => {
        "id_sqlite": idSqlite,
        "descr": descr,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
