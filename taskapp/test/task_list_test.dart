import 'package:flutter_test/flutter_test.dart';
import 'package:taskapp/task.dart';
import 'package:taskapp/task_list.dart';

void main() {
  late TaskList taskList;
  const testTasks = [
    Task(name: 'test_task1'),
    Task(name: 'test_task2'),
    Task(name: 'test_task3'),
  ];

  setUp(() {
    taskList = TaskList();
  });

  test('empty list', () {
    expect(taskList.tasks, isEmpty);
  });

  test('add task', () {
    taskList.add(testTasks.first);

    expect(taskList.tasks, hasLength(1));
    expect(taskList.tasks.first.name, equals('test_task1'));
    expect(taskList.tasks.first.done, isFalse);
  });

  test('remove task', () {
    for (final task in testTasks) {
      taskList.add(task);
    }
    taskList.remove(1);

    expect(taskList.tasks, hasLength(2));
    expect(taskList.tasks.first.name, equals('test_task1'));
    expect(taskList.tasks.last.name, equals('test_task3'));
  });

  test('mark task done', () {
    taskList.add(testTasks.first);
    taskList.setDone(0, true);

    expect(taskList.tasks.first.done, isTrue);
  });
}
