import 'package:flutter/material.dart';

@immutable
class Task {
  const Task({required this.name, this.done = false});
  final String name;
  final bool done;

  @override
  operator ==(Object other) =>
      other is Task && other.name == name && other.done == done;

  @override
  int get hashCode => Object.hash(name, done);
}
