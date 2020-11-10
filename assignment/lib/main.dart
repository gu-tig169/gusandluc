import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _toDoList(),
      floatingActionButton: _addButton(context),
      appBar: _appBar(),
    );
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.grey[900],
      title: Text("To-do list"),
      centerTitle: true,
      actions: [
        IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: null)
      ],
    );
  }

  Widget _toDoList() {
    var list = [
      "Study for exam",
      "Go to the gym",
      "Clean my appartment",
      "Visit grandparents",
      "Hang out with friends",
    ];

    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => _listItem(list[index]));
  }

  Widget _listItem(String listItemName) {
    return Column(
      children: [
        ListTile(
          leading: Checkbox(onChanged: null, value: false),
          title: Text(listItemName, style: TextStyle(fontSize: 20)),
          trailing: IconButton(icon: Icon(Icons.close), onPressed: null),
        ),
        Divider(
          color: Colors.grey[900],
        )
      ],
    );
  }

  Widget _addButton(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[900],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondPage()),
          );
        });
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('TODO'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            _textField(),
            _addButton(),
          ],
        ),
      ),
    );
  }

  Widget _textField() {
    return TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Add something",
            hintStyle: TextStyle()),
        onChanged: (text) {});
  }

  Widget _addButton() {
    return OutlineButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add),
          Text('Add'),
        ],
      ),
      borderSide: BorderSide(color: Colors.white),
      onPressed: () {},
    );
  }
}
