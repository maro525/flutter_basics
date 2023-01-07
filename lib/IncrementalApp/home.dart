import 'package:flutter/material.dart';

class IncrementalApp extends StatefulWidget {
  const IncrementalApp({Key? key}) : super(key: key);

  @override
  State<IncrementalApp> createState() => _IncrementalAppState();
}


class _IncrementalAppState extends State<IncrementalApp> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fluuter Demo Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this man times:'),
            Text('$_counter', style: Theme.of(context).textTheme.displaySmall),
          ],
        ),
      ),
      floatingActionButton: Incrementer(increment:_increment),
    );
  }
}

class Incrementer extends StatefulWidget {
  final Function() increment;
  const Incrementer({Key? key, required this.increment}) : super(key: key);

  @override
  State<Incrementer> createState() => _IncrementerState();
}

class _IncrementerState extends State<Incrementer> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: widget.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add)
    );
  }
}

