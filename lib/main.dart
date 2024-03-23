import 'package:flutter/material.dart';
import 'package:flutter_application_6/views/toDoList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 221, 212, 221),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(251, 32, 12, 161),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const ToDoList(),
    );
  }
}
