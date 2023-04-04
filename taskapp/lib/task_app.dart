import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

import 'task_page.dart';

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return YaruTheme(
      builder: (context, yaru, child) => MaterialApp(
        theme: yaru.theme,
        darkTheme: yaru.darkTheme,
        home: TaskPage.create(context),
      ),
    );
  }
}
