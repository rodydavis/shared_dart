import 'package:shared_dart/src/models/todos.dart';
import 'package:shelf/src/request.dart';

import 'package:shelf/src/response.dart';

import '../result.dart';

class TodoController implements ResponseImpl {
  @override
  Future<Response> result(Request request) async {
    final _model = TodosModel();
    if (request.url.pathSegments.length > 1) {
      final _id = int.tryParse(request.url.pathSegments[1] ?? '1');
      final _todo = await _model.getItem(_id);
      return ServerResponse('Todo Item', body: _todo).ok();
    }
    final _todos = await _model.getList();
    return ServerResponse(
      'List Todos',
      body: _todos.map((t) => t.toJson()).toList(),
    ).ok();
  }
}
