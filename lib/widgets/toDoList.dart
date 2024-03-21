// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_6/models/task.dart';
import 'package:flutter_application_6/widgets/addTask.dart';
import 'package:flutter_application_6/controllers/taskList.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<Task> tasks = [];

  void addTask(String name, String description) {
    setState(() {
      tasks.add(Task(name: name, description: description));
    });
  }

  void toggleTask(int index) {
    setState(() {
      tasks[index] = Task(
        name: tasks[index].name.startsWith('✓ ')
            ? tasks[index].name.substring(2)
            : '✓ ${tasks[index].name}',
        description: tasks[index].description,
      );
    });
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void editTask(int index, String newName, String newDescription) {
    setState(() {
      tasks[index] = Task(name: newName, description: newDescription);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tareas'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskWidget(
            task: tasks[index],
            onEdit: (newName, newDescription) {
              editTask(index, newName, newDescription);
            },
            onDelete: () {
              removeTask(index);
            },
            onToggle: () {
              toggleTask(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddTaskDialog(
                onAdd: addTask,
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
