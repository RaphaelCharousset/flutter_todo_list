import 'package:flutter/material.dart';

import 'Task.dart';
import 'TaskItem.dart';

class TasksContainer extends StatelessWidget {
  TasksContainer({
    Key? key,
    required this.tasks,
    required this.removeTask,
    required this.handleCheckTask,
    required this.slug,
  }) : super(key: key);

  String slug;
  List<TaskItem> tasks;
  Function removeTask;
  Function handleCheckTask;

  @override
  Widget build(BuildContext context) {
    if (slug == '/done') {
      tasks.where((task) => task.isDone == true).toList();
    } else if (slug == '/todo') {
      tasks.where((task) => task.isDone == false).toList();
    }

    return Padding(
      padding: EdgeInsets.all(32),
      child: Column(
        children: <Widget>[
          const Text('Things to do :'),
          ...tasks.asMap().entries.map((task) {
            if (slug == '/done' && task.value.isDone == false ||
                slug == '/todo' && task.value.isDone == true) {
              return SizedBox.shrink();
            }
            int idx = task.key;

            return Task(
              content: task.value.content as String,
              isDone: task.value.isDone as bool,
              index: idx,
              removeTask: removeTask,
              handleCheckTask: handleCheckTask,
              key: ObjectKey(task.value),
            );
          })
        ],
      ),
    );
  }
}
