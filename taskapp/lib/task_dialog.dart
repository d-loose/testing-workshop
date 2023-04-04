import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'task.dart';
import 'task_list.dart';

void showNewTaskDialog(BuildContext context) {
  final model = context.read<TaskList>();
  showDialog(
    context: context,
    builder: (context) => NewTaskDialog(model: model),
  );
}

class NewTaskDialog extends StatefulWidget {
  const NewTaskDialog({super.key, required this.model});
  final TaskList model;

  @override
  State<NewTaskDialog> createState() => _NewTaskDialogState();
}

class _NewTaskDialogState extends State<NewTaskDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("New Task"),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: const InputDecoration(
          labelText: "Task Name",
          hintText: "Enter a task name",
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            widget.model.add(Task(name: _controller.text));
            Navigator.pop(context);
          },
          child: const Text("Add"),
        ),
      ],
    );
  }
}
