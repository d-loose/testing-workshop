import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taskapp/task.dart';
import 'package:taskapp/task_dialog.dart';
import 'package:taskapp/task_list.dart';

import 'test_utils.dart';

class MockTaskList extends Mock implements TaskList {}

void main() {
  late TaskList taskList;

  // needed for mocktail, see
  // https://pub.dev/packages/mocktail#how-it-works
  setUpAll(() {
    registerFallbackValue(const Task(name: ""));
  });

  // create a new mock TaskList for each test
  setUp(() {
    taskList = MockTaskList();
  });

  // test that a new task is added
  testWidgets('add task', (tester) async {
    throw UnimplementedError('test not implemented');
  });

  // ensure that no task is added when the user cancels
  testWidgets('cancel', (tester) async {
    await tester.pumpYaruWidget(TaskDialog(taskList: taskList));
    await tester.pumpAndSettle();

    await tester.tap(find.text("Cancel"));
    await tester.pumpAndSettle();

    verifyNever(() => taskList.add(any()));
  });
}
