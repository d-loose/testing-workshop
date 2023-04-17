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

  setUp(() {
    registerFallbackValue(const Task(name: ""));
    model = MockTaskList();
  });
  testWidgets('add task', (tester) async {
    await tester.pumpYaruWidget(TaskDialog(model: model));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), "New Task");
    await tester.tap(find.text("Add"));
    await tester.pumpAndSettle();
    verify(() => model.add(const Task(name: "New Task"))).called(1);
  });

  testWidgets('cancel', (tester) async {
    await tester.pumpYaruWidget(TaskDialog(model: model));
    await tester.pumpAndSettle();

    await tester.tap(find.text("Cancel"));
    await tester.pumpAndSettle();
    verifyNever(() => model.add(any()));
  });
}
