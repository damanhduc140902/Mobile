import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'To-do List';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        home: MyTodoList(
        ));
  }
}

class Task {
  Task({required this.description});

  String description;
}

class MyTodoList extends StatefulWidget {
  MyTodoList({super.key});

  @override
  State<MyTodoList> createState() => _MyTodoListState();
}

class _MyTodoListState extends State<MyTodoList> {
  final _formKey = GlobalKey<FormState>();

  Future<void> addActivity() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Describe your activity'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Form(
                    key: _formKey,
                    child: TextFormField(
                        maxLines: null)),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: null,
              ),
              TextButton(
                onPressed: null,
                child: const Text('Add'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('My To-do List')),
      body: null,
      floatingActionButton: FloatingActionButton(
          onPressed: () => addActivity(),
          tooltip: 'Add an activity',
          child: const Icon(Icons.add)),
    );
  }
}
class MyActivity extends StatefulWidget {
  MyActivity(
      {required this.task, required this.finished, required this.deleted})
      : super(key: ObjectKey(task));

  bool finished;
  Task task;
  bool deleted;

  @override
  State<MyActivity> createState() => _MyActivityState();
}
class _MyActivityState extends State<MyActivity> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: null,
        leading: Checkbox(
            checkColor: Colors.white,
            activeColor: Colors.blue,
            value: widget.finished,
            onChanged: (bool? value) {
              setState(() {
                widget.finished = value!;
              });
            }),
        title: Text(widget.task.description),
        trailing: PopupMenuButton(
            itemBuilder: ((context) => [
              const PopupMenuItem(
                  value: null , child: Text('Edit')),
              const PopupMenuItem(
                  value: null, child: Text('Delete'))
            ])));
  }
}
