import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'To-do List';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: _title, home: MyTodoList());
  }
}

class MyTodoList extends StatefulWidget {
  MyTodoList({super.key});

  @override
  State<MyTodoList> createState() => _MyTodoListState();
}

class _MyTodoListState extends State<MyTodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('My To-do List')),
      body: null,
      floatingActionButton: FloatingActionButton(
          onPressed: null,
          tooltip: 'Add an activity',
          child: const Icon(Icons.add)),
    );
  }
}
