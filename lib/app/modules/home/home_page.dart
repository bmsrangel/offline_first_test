import 'package:flutter/material.dart';

import '../../data/app_database.dart';
import 'home_bloc.dart';
import 'home_module.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc bloc = HomeModule.to.get<HomeBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: bloc.descText$,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: bloc.addToDoList,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: bloc.deleteAll,
          ),
        ],
      ),
      body: StreamBuilder<List<ToDoList>>(
        stream: bloc.outList,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          return ListView.separated(
            separatorBuilder: (_, index) => Divider(),
            itemCount: snapshot.data.length,
            itemBuilder: (_, index) {
              ToDoList list = snapshot.data[index];
              return ListTile(
                title: Text(list.desc),
                subtitle: Text(list.createdAt),
                trailing: list.synced
                    ? Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 30,
                      )
                    : Icon(
                        Icons.indeterminate_check_box,
                        color: Colors.red,
                        size: 30,
                      ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.sync),
        onPressed: bloc.syncLists,
      ),
    );
  }
}
