import 'package:assignment/list/todolist.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'second_view.dart';
import '../model/model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> choices = ['All', 'Done', 'Not done'];
  String filterValue = 'All';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MyState>(
          builder: (context, state, child) =>
              TodoList(state.filteredList(filterValue))),
      floatingActionButton: _floatingaddButton(context),
      appBar: _appBar(),
    );
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.grey[900],
      title: Text("TIG 169 TODO"),
      centerTitle: true,
      actions: <Widget>[
        PopupMenuButton<String>(onSelected: (String value) {
          setState(() {
            filterValue = value;
          });
        }, itemBuilder: (BuildContext context) {
          return choices
              .map(
                (choise) => PopupMenuItem(
                  value: choise,
                  child: Text(choise),
                ),
              )
              .toList();
        })
      ],
    );
  }

  Widget _floatingaddButton(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[900],
        onPressed: () async {
          await Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondView()));
        });
  }
}
