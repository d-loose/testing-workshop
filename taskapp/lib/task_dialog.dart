import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'task.dart';
import 'task_list.dart';

void showTaskDialog(BuildContext context) {
  final taskList = context.read<TaskList>();
  showDialog(
    context: context,
    builder: (context) => TaskDialog(taskList: taskList),
  );
}

class TaskDialog extends StatefulWidget {
  @visibleForTesting
  const TaskDialog({super.key, required this.taskList});
  final TaskList taskList;

  @override
  State<TaskDialog> createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
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
            widget.taskList.add(Task(name: _controller.text));
            Navigator.pop(context);
          },
          child: const Text("Add"),
        ),
      ],
    );
  }
}
