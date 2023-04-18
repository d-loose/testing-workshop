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
    expect(taskList.tasks, isEmpty);
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
    for (final task in testTasks) {
      taskList.add(task);
    }
    taskList.remove(1);

    expect(taskList.tasks, hasLength(2));
    expect(taskList.tasks.first.name, equals('test_task1'));
    expect(taskList.tasks.last.name, equals('test_task3'));
  });

  // test that we can mark a task as done
  test('mark task done', () {
    taskList.add(testTasks.first);
    taskList.setDone(0, true);

    expect(taskList.tasks.first.done, isTrue);
  });
}
