import 'package:flutter/material.dart';
import 'package:flutter_todo/Layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Layout(title: 'Flutter Todo'),
        '/done': (context) => Layout(title: 'Flutter Todo'),
        '/todo': (context) => Layout(title: 'Flutter Todo'),
      },
    );
  }
}
