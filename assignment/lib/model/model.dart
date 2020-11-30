import 'package:assignment/api/api_requester.dart';
import 'package:flutter/material.dart';

class TodoItem {
  String id;
  String title;
  bool isDone;

  TodoItem({this.id, this.title, this.isDone = false});
}

class MyState extends ChangeNotifier {
  List<TodoItem> _list = [];
  List<TodoItem> get list => _list;

  MyState() {
    _methodforlist();
  }

  void addItem(TodoItem item) async {
    _list = await ApiRequester.createTodo(item);
    notifyListeners();
  }

  List<TodoItem> filteredList(String listfilter) {
    if (listfilter == "Done") {
      return _list.where((item) => item.isDone == true).toList();
    } else if (listfilter == "Not done") {
      return _list.where((item) => item.isDone == false).toList();
    }

    return _list;
  }

  void _methodforlist() async {
    this._list = await ApiRequester.fetchTodo();
    notifyListeners();
  }

  void removeItem(TodoItem item) async {
    _list = await ApiRequester.deleteFromList(item);
    notifyListeners();
  }

  void updateList(TodoItem item) async {
    _list = await ApiRequester.putTodo(item);
    notifyListeners();
  }
}
