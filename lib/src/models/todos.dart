import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_dart/src/classes/todo.dart' as t;

class TodosModel {
  final kTodosUrl = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<t.ToDo>> getList() async {
    final _response = await http.get(kTodosUrl);
    if (_response != null) {
      final _todos = t.toDoFromJson(_response.body);
      if (_todos != null) {
        return _todos;
      }
    }
    return [];
  }

  Future<t.ToDo> getItem(int id) async {
    final _response = await http.get('$kTodosUrl/$id');
    if (_response != null) {
      final _todo = t.ToDo.fromJson(json.decode(_response.body));
      if (_todo != null) {
        return _todo;
      }
    }
    return null;
  }
}
