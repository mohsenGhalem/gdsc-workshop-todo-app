import 'package:flutter/material.dart';

import 'models/task_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void addTask() {
    String title = "Item";
    String date = DateTime.now().toString();
    bool status = false;

    Task task = Task(title, date, status);
    tasks.add(task);
    setState(() {});
  }

  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Todo App'),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return myTaskTile(tasks[index]);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: addTask,
          label: Text("add task"),
          icon: Icon(Icons.add),
        ),
      ),
    );
  }

  Container myTaskTile(Task task) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.grey.withOpacity(0.4),
        ),
        child: CheckboxListTile(
          title: Text(task.title),
          subtitle: Text(task.date),
          onChanged: (bool? value) {},
          value: task.status,
        ));
  }
}
