import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  NewTask({
    Key? key,
    required this.setNewTask,
  }) : super(key: key);

  Function setNewTask;

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final _formKey = GlobalKey<FormState>();
  final inputController = TextEditingController();

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  void showSnackBar() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Task created')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Field is empty !';
                }
                widget.setNewTask(value);
                inputController.text = '';
                return null;
              },
              controller: inputController,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  showSnackBar();
                },
                child: const Text('Create'))
          ],
        ),
      ),
    );
  }
}
