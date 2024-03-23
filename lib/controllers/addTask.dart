// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AddTaskDialog extends StatelessWidget {
  final Function(String, String) onAdd;

  const AddTaskDialog({Key? key, required this.onAdd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String newName = '';
    String newDescription = '';

    return AlertDialog(
      title: const Text('Nueva Tarea'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            decoration: const InputDecoration(labelText: 'Nombre'),
            onChanged: (value) {
              newName = value;
            },
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Descripción'),
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
            onAdd(newName, newDescription);
            Navigator.pop(context);
          },
          child: const Text('Aceptar'),
        ),
      ],
    );
  }
}
