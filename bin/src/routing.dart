import 'dart:async';
// import 'dart:convert';

// import 'package:http/http.dart' as http;
import 'package:shared_dart/src/models/counter.dart';
import 'package:shelf/shelf.dart' as shelf;

import 'result.dart';

class RouteUtils {
  static FutureOr<shelf.Response> handler(shelf.Request request) {
    var component = request.url.pathSegments.first;
    var handler = _handlers(request)[component];
    if (handler == null) return shelf.Response.notFound(null);
    return handler;
  }

  static Map<String, FutureOr<shelf.Response>> _handlers(
      shelf.Request request) {
    return {
      'info': ServerResponse('Info', body: {
        "version": 'v1.0.0',
        "status": "ok",
      }).ok(),
      'counter': _getCounter(request),
    };
  }

  static Future<shelf.Response> _getCounter(shelf.Request request) async {
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
