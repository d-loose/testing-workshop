import 'dart:collection';

import 'package:flutter/material.dart';

import 'task.dart';

class TaskList with ChangeNotifier {
  TaskList();
  final List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void add(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void remove(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void setDone(int index, bool done) {
    final task = _tasks[index];
    _tasks[index] = Task(name: task.name, done: done);
    notifyListeners();
  }
}
