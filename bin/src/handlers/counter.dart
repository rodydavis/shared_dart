import 'package:shared_dart/src/models/counter.dart';
import 'package:shelf/shelf.dart' as shelf;

import '../result.dart';

class CounterController implements ResponseImpl {
  const CounterController();

  @override
  Future<shelf.Response> result(shelf.Request request) async {
    final _counterModel = CounterModel();
    final _params = request.url.queryParameters;
    if (_params != null) {
      final _val = int.tryParse(_params['count'] ?? '0');
      _counterModel.set(_val);
    } else {
      _counterModel.add();
    }
    return ServerResponse('Info', body: {
      "counter": _counterModel.count,
    }).ok();
  }
}
