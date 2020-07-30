import 'package:flutter_modular/flutter_modular.dart';

import '../../app_module.dart';
import '../../data/todo_dao.dart';
import '../../shared/repositories/hasura_repository.dart';
import 'home_bloc.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeBloc(AppModule.to.get<ToDoListsDao>(),
            AppModule.to.get<HasuraRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
