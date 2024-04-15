import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/views/toDoList.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) => runApp( MyApp()));
}

class MyApp extends StatelessWidget {


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
