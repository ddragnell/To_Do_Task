// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_6/widgets/checkTask.dart';
import 'package:flutter_application_6/models/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function(int) onDelete;
  final Function(int) onToggle;

  const TaskList({
    Key? key,
    required this.tasks,
    required this.onDelete,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskWidget(
          task: tasks[index],
          onDelete: () => onDelete(index),
          onToggle: () => onToggle(index), 
        );
      },
    );
  }
}
