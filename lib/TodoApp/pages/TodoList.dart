import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:stock_record_app/TodoApp/pages/TodoAdd.dart';

import '../model/Todo.dart';
import '../model/todo_list_store.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {

  final TodoListStore _store = TodoListStore();

  void _pushTodoInputPage([Todo? todo]) async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return TodoAddPage(todo: todo);
      },),
    );

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    Future(
        () async {
          setState(() => _store.load());
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO LIST')
      ),
      body: ListView.builder(
        itemCount: _store.count(),
        itemBuilder: (context, index) {
          var item = _store.findByIndex(index);
          return Slidable(
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              extentRatio: 0.25,
              children: [
                SlidableAction(
                  onPressed: (context) {
                    _pushTodoInputPage(item);
                  },
                  backgroundColor: Colors.yellow,
                  icon: Icons.edit,
                  label: 'Edit'
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              extentRatio: 0.25,
              children: [
                SlidableAction(
                  onPressed: (context) {
                    setState(() => { _store.delete(item)});
                  },
                  backgroundColor: Colors.red,
                  icon: Icons.edit,
                  label: 'Delete'
                ),
              ],
            ),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              child: ListTile(
                leading: Text(item.id.toString()),
                title: Text(item.title),
                trailing: Checkbox(
                  value: item.done,
                  onChanged: (bool? value) {
                    setState(() => _store.update(item, value!));
                  }
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pushTodoInputPage,
        child: const Icon(Icons.add),
      ),
    );
  }
}
