import 'package:flutter/material.dart';

@immutable
class Task {
  const Task({required this.name, this.done = false});
  final String name;
  final bool done;
}
