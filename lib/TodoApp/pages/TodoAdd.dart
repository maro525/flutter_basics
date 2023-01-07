import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

import '../model/Todo.dart';
import '../model/todo_list_store.dart';

class TodoAddPage extends StatefulWidget {

  final Todo? todo;

  const TodoAddPage({Key? key, this.todo}) : super(key: key);

  @override
  State<TodoAddPage> createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {

  final TodoListStore _store = TodoListStore();

  late bool _isCreateTodo;
  late String _title;
  late String _detail;
  late bool _done;
  late String _createDate;
  late String _updateDate;

  @override
  void initState() {
    super.initState();
    var todo = widget.todo;

    _title = todo?.title ?? "";
    _detail = todo?.detail ?? "";
    _done = todo?.done ?? false;
    _createDate = todo?.createdDate ?? "";
    _updateDate = todo?.updatedDate ?? "";
    _isCreateTodo = todo == null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isCreateTodo ? 'Add Todo' : 'Update Todo'),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            CheckboxListTile(
              title: const Text('Done'),
              value: _done,
              onChanged: (bool? value) {
                setState(() {
                  _done = value ?? false;
                });
              },
            ),
            const SizedBox(height: 20),
            TextField(
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Title',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue
                  ),
                ),
              ),
              controller: TextEditingController(text: _title),
              onChanged: (String value) {
                _title = value;
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_isCreateTodo) {
                    _store.add(_done, _title, _detail);
                  } else {
                    _store.update(widget.todo!, _done, _title, _detail);
                  }
                  Navigator.of(context).pop();
                },
                child: Text(
                  _isCreateTodo ? 'Add' : 'Update',
                  style: const TextStyle(color: Colors.white)
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  side: const BorderSide(
                    color: Colors.blue,
                  ),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text("Created Date : $_createDate"),
            Text("Updated Date : $_updateDate"),
          ],
        ),
      ),
    );
  }
}
