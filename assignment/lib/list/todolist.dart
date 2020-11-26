import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/model.dart';

class TodoList extends StatefulWidget {
  final List<TodoItem> list;

  TodoList(this.list);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, index) =>
            _listItem(widget.list[index], context));
  }

  Widget _listItem(TodoItem item, context) {
    var state = Provider.of<MyState>(context, listen: false);
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          ListTile(
            leading: Checkbox(
                value: item.isDone,
                onChanged: (bool value) {
                  setState(() {
                    item.isDone = value;
                    state.updateList(item);
                  });
                }),
            title: Text(item.title, style: TextStyle(fontSize: 20)),
            trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  state.removeItem(item);
                }),
          ),
        ],
      ),
    );
  }
}
