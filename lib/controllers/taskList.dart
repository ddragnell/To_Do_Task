// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_6/models/task.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  final Function(String, String) onEdit;
  final VoidCallback onDelete;
  final VoidCallback onToggle;

  const TaskWidget({
    Key? key,
    required this.task,
    required this.onEdit,
    required this.onDelete,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.name),
      subtitle: Text(task.description),
      leading: Checkbox(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return Color.fromARGB(255, 89, 228, 47);
          }
          return null;
        }),
        value: task.name.startsWith('✓ '),
        onChanged: (value) {
          onToggle();
        },
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              _showEditDialog(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    String newName = task.name;
    String newDescription = task.description;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar Tarea'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Nombre'),
                controller: TextEditingController(text: newName),
                onChanged: (value) {
                  newName = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Descripción'),
                controller: TextEditingController(text: newDescription),
                onChanged: (value) {
                  newDescription = value;
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                onEdit(newName, newDescription);
                Navigator.pop(context);
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
