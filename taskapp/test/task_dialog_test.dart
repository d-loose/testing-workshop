import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taskapp/task.dart';
import 'package:taskapp/task_dialog.dart';
import 'package:taskapp/task_list.dart';

import 'test_utils.dart';

class MockTaskList extends Mock implements TaskList {}

void main() {
  late TaskList model;

  // needed for mocktail, see
  // https://pub.dev/packages/mocktail#how-it-works
  setUpAll(() {
    registerFallbackValue(const Task(name: ""));
  });

  // create a new mock model for each test
  setUp(() {
    model = MockTaskList();
  });

  // test that a new task is added
  testWidgets('add task', (tester) async {
    await tester.pumpYaruWidget(TaskDialog(model: model));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), "New Task");
    await tester.tap(find.text("Add"));
    await tester.pumpAndSettle();

    verify(() => model.add(const Task(name: "New Task"))).called(1);
  });

  // ensure that no task is added when the user cancels
  testWidgets('cancel', (tester) async {
    await tester.pumpYaruWidget(TaskDialog(model: model));
    await tester.pumpAndSettle();

    await tester.tap(find.text("Cancel"));
    await tester.pumpAndSettle();

    verifyNever(() => model.add(any()));
  });
}
