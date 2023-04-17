import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yaru_icons/yaru_icons.dart';

import 'task_dialog.dart';
import 'task_list.dart';
import 'task_tile.dart';

class TaskPage extends StatelessWidget {
  @visibleForTesting
  const TaskPage({super.key});

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskList(),
      builder: (context, _) => const TaskPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<TaskList>();
    return Scaffold(
      appBar: AppBar(title: const Text("Task App")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showTaskDialog(context),
        child: const Icon(YaruIcons.plus),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: model.tasks.length,
              itemBuilder: (_, index) => TaskTile(
                task: model.tasks[index],
                onChanged: (done) => model.setDone(index, done ?? false),
                remove: () => model.remove(index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
