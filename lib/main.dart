import 'package:flutter/material.dart';
import 'package:stock_record_app/TodoApp/todo_home.dart';
import 'package:stock_record_app/WhatsApp/whatsapp_home.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Sample App',
        theme: ThemeData(primaryColor: new Color(0xff075E54), accentColor: new Color(0xff25D366),),
        home: new TodoApp(),
        debugShowCheckedModeBanner: false,
    );
  }
}

