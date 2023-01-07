import 'package:flutter/material.dart';
import 'package:stock_record_app/TodoApp/pages/TodoList.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoList',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const TodoListPage()
    );
  }
}
