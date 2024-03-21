// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_6/models/task.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  final VoidCallback onDelete;
  final VoidCallback onToggle;

  const TaskWidget({
    Key? key,
    required this.task,
    required this.onDelete,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.name),
      subtitle: Text(task.description),
      leading: Checkbox(
        value: task.name.startsWith('✓ '),
        onChanged: (value) {
          onToggle();
        },
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          onDelete();
        },
      ),
    );
  }
}
