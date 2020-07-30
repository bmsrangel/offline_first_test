import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import 'app_bloc.dart';
import 'app_widget.dart';
import 'data/app_database.dart';
import 'modules/home/home_module.dart';
import 'shared/repositories/hasura_repository.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HasuraRepository(HasuraConnect(
            "https://offlinefirstflutter.herokuapp.com/v1/graphql"))),
        Bind((i) => AppBloc()),
        Bind((i) => AppDatabase().toDoListsDao),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
