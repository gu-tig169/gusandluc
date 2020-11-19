import 'package:flutter/material.dart';

class TodoItem {
  String title;
  bool isDone;

  TodoItem({this.title, this.isDone = false});
}

class MyState extends ChangeNotifier {
  List<TodoItem> _list = [];

  List<TodoItem> get list => _list;

  void addItem(TodoItem item) {
    _list.add(item);
    notifyListeners();
  }

  List<TodoItem> filteredList(String listfilter) {
    if (listfilter == "Done") {
      return _list.where((item) => item.isDone == true).toList();
    } else if (listfilter == "Undone") {
      return _list.where((item) => item.isDone == false).toList();
    }

    return _list;
  }

  void removeItem(TodoItem item) {
    _list.remove(item);
    notifyListeners();
  }
}
