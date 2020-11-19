//import 'package:assignment/model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class SecondView extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondView> {
  final myController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('TIG169 TODO'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            _textField(),
            _addButton(context, myController.text),
          ],
        ),
      ),
    );
  }

  Widget _textField() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add something",
              hintStyle: TextStyle()),
          controller: myController,
        )
      ],
    );
  }

  Widget _addButton(BuildContext context, String title) {
    return OutlineButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add),
          Text('Add'),
        ],
      ),
      onPressed: () {
        Provider.of<MyState>(context, listen: false)
            .addItem(TodoItem(title: myController.text));
        Navigator.pop(context);
      },
      borderSide: BorderSide(color: Colors.white),
    );
  }
}
