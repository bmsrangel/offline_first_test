import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../../data/app_database.dart';
import '../models/send_hasura_model.dart';
import '../models/synced_list_model.dart';

class HasuraRepository extends Disposable {
  final HasuraConnect _client;

  HasuraRepository(this._client);

  Future<List<SyncedListModel>> syncLists(List<ToDoList> lists) async {
    String query = """
      mutation syncLists(\$objects:[lists_insert_input!]!) {
        insert_lists(objects: \$objects) {
          returning {
            id_sqlite
            descr
            createdAt
            updatedAt
          }
        }
      }
    """;

    var data = await _client.mutation(query, variables: {
      "objects": lists
          .map((list) => SendToHasuraModel.fromToDoList(list).toJson())
          .toList()
    });
    return (data["data"]["insert_lists"]["returning"] as List)
        .map<SyncedListModel>((list) => SyncedListModel.fromJson(list))
        .toList();
  }

  Future<List<SyncedListModel>> getAllLists() async {
    String query = """
      query getAllLists {
        lists {
          id
          id_sqlite
          descr
          createdAt
          updatedAt
        }
      }
    """;

    var data = await _client.query(query);
    return (data["data"]["lists"] as List)
        .map<SyncedListModel>((list) => SyncedListModel.fromJson(list))
        .toList();
  }

  Future<int> deleteAllLists() async {
    String query = """
      mutation MyMutation {
        delete_lists(where: {id: {_gte: 0}}) {
          affected_rows
        }
      }
    """;

    var data = await _client.mutation(query);
    return data["data"]["delete_lists"]["affected_rows"];
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
