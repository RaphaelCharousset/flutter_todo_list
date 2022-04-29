import 'package:flutter/material.dart';
import 'package:flutter_todo/NewTask.dart';
import 'package:flutter_todo/TasksContainer.dart';

import 'TaskItem.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  List<TaskItem> _tasks = [];
  int _selectedIndex = 0;
  List<String> slugs = [
    '/all',
    '/done',
    '/todo',
  ];

  void _onItempTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigator.pushNamed(context, slugs.elementAt(index));
  }

  void setNewTask(String task) {
    TaskItem newTask = TaskItem(content: task, isDone: false);
    setState(() {
      _tasks = [
        ..._tasks,
        newTask,
      ];
    });
  }

  void removeTask(int index) {
    if (index >= 0 && index <= _tasks.length - 1) {
      List<TaskItem> copy = [..._tasks];
      copy.removeAt(index);

      setState(() {
        _tasks = [...copy];
      });
    }
  }

  void handleCheckTask(int index, bool isChecked) {
    List<TaskItem> copy = [..._tasks];
    copy.elementAt(index).isDone = isChecked;

    setState(() {
      _tasks = [...copy];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            NewTask(
              setNewTask: setNewTask,
            ),
            TasksContainer(
              slug: slugs[_selectedIndex],
              tasks: _tasks,
              removeTask: removeTask,
              handleCheckTask: handleCheckTask,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Done',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: 'To Do',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItempTapped,
      ),
    );
  }
}
