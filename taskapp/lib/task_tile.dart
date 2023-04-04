import 'package:flutter/material.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/widgets.dart';

import 'task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
    required this.onChanged,
    required this.remove,
  });

  final Task task;
  final ValueChanged<bool?> onChanged;
  final VoidCallback remove;

  @override
  Widget build(BuildContext context) {
    return YaruTile(
      title: Text(task.name),
      trailing: Row(
        children: [
          YaruCheckbox(
            value: task.done,
            onChanged: onChanged,
          ),
          YaruIconButton(icon: const Icon(YaruIcons.trash), onPressed: remove),
        ],
      ),
    );
  }
}
