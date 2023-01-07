import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

import 'Todo.dart';

class TodoListStore {
  final String _saveKey = "Todo";

  List<Todo> _list = [];

  static final TodoListStore _instance = TodoListStore._internal();
  TodoListStore._internal();

  factory TodoListStore() {
    return _instance;
  }

  int count() {
    return _list.length;
  }

  Todo findByIndex(int index) {
    return _list[index];
  }

  String getDateTime() {
    var format = DateFormat("yyyy/MM/dd HH:mm");
    var dateTime = format.format(DateTime.now());
    return dateTime;
  }

  void add(bool done, String title, String detail) {
    var id = count() == 0 ? 1 : _list.last.id + 1;
    var dateTime = getDateTime();
    var todo = Todo(id, title, detail, done, dateTime, dateTime);
    _list.add(todo);
    save();
  }

  void update(Todo todo, bool done, [String? title, String? detail]) {
    todo.done = done;
    if (title != null) {
      todo.title = title;
    }
    if (detail != null) {
      todo.detail = detail;
    }
    todo.updatedDate = getDateTime();
    save();
  }

  void delete(Todo todo) {
    _list.remove(todo);
    save();
  }

  void save() async {
    var prefs = await SharedPreferences.getInstance();
    var saveTargetList = _list.map((a) => json.encode(a.toJson())).toList();
    prefs.setStringList(_saveKey, saveTargetList);
  }

  void load() async {
    var prefs = await SharedPreferences.getInstance();
    var loadTargetList = prefs.getStringList(_saveKey) ?? [];
    _list = loadTargetList.map((a) => Todo.fromJson(json.decode(a))).toList();
  }
}