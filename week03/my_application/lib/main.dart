import 'package:flutter/material.dart';

enum Menu { edit, delete }

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'To-do List';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        home: MyTodoList(
          // ignore: prefer_const_literals_to_create_immutables
          tasks: [],
        ));
  }
}

class Task {
  Task({required this.description});

  String description;
}

// ignore: must_be_immutable
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

  void editTask() {
    setState(() {
      widget.task.description = myController.text;
      myController.clear();
      Navigator.pop(context);
    });
  }

  Future<void> editActivity() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Edit your activity'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: TextFormField(
                    maxLines: null, controller: myController)),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () => {Navigator.pop(context), myController.clear()},
              ),
              TextButton(
                onPressed: () => editTask(),
                child: const Text('Confirm'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.deleted) {
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
          trailing: PopupMenuButton<Menu>(
              onSelected: (Menu item) {
                if (item == Menu.delete) {
                  setState(() {
                    widget.deleted = true;
                  });
                } else {
                  editActivity();
                }
              },
              itemBuilder: ((context) => [
                    const PopupMenuItem<Menu>(
                        value: Menu.edit, child: Text('Edit')),
                    const PopupMenuItem<Menu>(
                        value: Menu.delete, child: Text('Delete'))
                  ])));
    } else {
      return const SizedBox.shrink();
    }
  }
}

// ignore: must_be_immutable
class MyTodoList extends StatefulWidget {
  MyTodoList({required this.tasks, super.key});

  List<Task> tasks;

  @override
  State<MyTodoList> createState() => _MyTodoListState();
}

class _MyTodoListState extends State<MyTodoList> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void newTask() {
    setState(() {
      widget.tasks.add(Task(description: myController.text));
      myController.clear();
      Navigator.pop(context);
    });
  }

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
                    maxLines: null, controller: myController)),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () => {Navigator.pop(context), myController.clear()},
              ),
              TextButton(
                onPressed: () => newTask(),
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
      body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          children: widget.tasks.map((task) {
            return MyActivity(task: task, finished: false, deleted: false);
          }).toList()),
      floatingActionButton: FloatingActionButton(
          onPressed: () => addActivity(),
          tooltip: 'Add an activity',
          child: const Icon(Icons.add)),
    );
  }
}