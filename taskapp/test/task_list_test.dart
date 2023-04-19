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

  // create a new TaskList for each test
  setUp(() {
    taskList = TaskList();
  });

  // test that the initial state of the TaskList is empty
  test('empty list', () {
    throw UnimplementedError('test not implemented');
  });

  // test that we can add a task to the list
  test('add task', () {
    taskList.add(testTasks.first);

    expect(taskList.tasks, hasLength(1));
    expect(taskList.tasks.first.name, equals('test_task1'));
    expect(taskList.tasks.first.done, isFalse);
  });

  // test that we can remove a task from the list
  test('remove task', () {
    throw UnimplementedError('test not implemented');
  });

  // test that we can mark a task as done
  test('mark task done', () {
    throw UnimplementedError('test not implemented');
  });
}
