import 'dart:convert';
import 'package:assignment/model/model.dart';
import 'package:http/http.dart' as http;

class ApiRequester {
  static final String url =
      'https://todoapp-api-vldfm.ondigitalocean.app/todos/';
  static final String key = '63835379-458c-400b-873f-839ddf800312';

  static Future<List<TodoItem>> fetchTodo() async {
    http.Response response = await http.get(url + "?key=" + key);

    return responseTolist(response);
  }

  static Future<List<TodoItem>> createTodo(TodoItem todomodel) async {
    final http.Response response = await http.post(url + '?key=' + key,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'title': todomodel.title, 'done': todomodel.isDone}));

    return responseTolist(response);
  }

  static Future<List<TodoItem>> putTodo(TodoItem todomodel) async {
    http.Response response = await http.put(url + '${todomodel.id}?key=' + key,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'title': todomodel.title, 'done': todomodel.isDone}));
    print(response.statusCode);
    if (response.statusCode != 200) {
      throw Exception('Cannot update item');
    }
    return responseTolist(response);
  }

  static List<TodoItem> responseTolist(http.Response response) {
    List<TodoItem> todoList = [];

    var jsonResponse = response.body;

    var obj = jsonDecode(jsonResponse);

    obj
        .map((element) => todoList.add(TodoItem(
              id: element["id"],
              title: element["title"],
              isDone: element["done"],
            )))
        .toList();

    return todoList;
  }

  static Future<List<TodoItem>> deleteFromList(TodoItem todomodel) async {
    http.Response response = await http
        .delete(url + '${todomodel.id}?key=' + key, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    return responseTolist(response);
  }
}
