import 'package:flutter/material.dart';

import '../../src/classes/todo.dart';
import '../../src/models/todos.dart';

class TodosScreen extends StatefulWidget {
  @override
  _TodosScreenState createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  final _model = TodosModel();
  List<ToDo> _todos;

  @override
  void initState() {
    _model.getList().then((val) {
      if (mounted)
        setState(() {
          _todos = val;
        });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos Screen'),
      ),
      body: Builder(
        builder: (_) {
          if (_todos != null) {
            return ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                final _item = _todos[index];
                return ListTile(
                  title: Text(_item.title),
                  subtitle: Text(_item.completed ? 'Completed' : 'Pending'),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
