import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  Task(
      {Key? key,
      required this.content,
      required this.isDone,
      required this.index,
      required this.removeTask,
      required this.handleCheckTask})
      : super(key: key);

  String content;
  bool isDone;
  int index;
  Function removeTask;
  Function handleCheckTask;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  void _onIconButtonPressed() {
    widget.removeTask(widget.index);
  }

  void _onCheckBox() {
    widget.handleCheckTask(widget.index, !widget.isDone);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
          child: Checkbox(
            value: widget.isDone,
            onChanged: (bool? value) {
              _onCheckBox();
            },
          ),
        ),
        Expanded(
          child: TextFormField(
            initialValue: widget.content,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.delete_forever),
          iconSize: 24,
          onPressed: _onIconButtonPressed,
        )
      ],
    );
  }
}
