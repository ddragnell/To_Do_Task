// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/models/task.dart';
import 'package:flutter_application_6/controllers/addTask.dart';
import 'package:flutter_application_6/controllers/taskList.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<Task> tasks = [];

  FirebaseFirestore db = FirebaseFirestore.instance;
  final String collection = 'tasks';

  Future<String> createTask(Map<String, dynamic> task) async {
    DocumentReference response = await db.collection(collection).add(task);
    return response.id;
  }

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
        title: const Text('Lista de Tareas',
            style: TextStyle(color: Color.fromARGB(255, 255, 237, 237))),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskWidget(
            task: tasks[index],
            onEdit: (newName, newDescription) {
              editTask(index, newName, newDescription);
              createTask({'title': 'tarea1'});
            },
            onDelete: () {
              removeTask(index);
            },
            onToggle: () {
              toggleTask(index);
              createTask({'title': 'tarea1'});
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
