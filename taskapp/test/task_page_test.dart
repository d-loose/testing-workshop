import 'dart:collection';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/task.dart';
import 'package:taskapp/task_dialog.dart';
import 'package:taskapp/task_list.dart';
import 'package:taskapp/task_page.dart';
import 'package:taskapp/task_tile.dart';
import 'package:yaru_icons/yaru_icons.dart';

import 'test_utils.dart';

class MockTaskList extends Mock implements TaskList {}

void main() {
  late TaskList taskList;

  // create a new mock taskList for each test
  setUp(() {
    taskList = MockTaskList();
  });

  // test that no tasks are shown when the list is empty
  testWidgets('empty list', (tester) async {
    when(() => taskList.tasks).thenReturn(UnmodifiableListView([]));
    await tester.pumpYaruWidget(ChangeNotifierProvider.value(
      value: taskList,
      child: const TaskPage(),
    ));
    await tester.pumpAndSettle();

    expect(find.byType(TaskTile), findsNothing);
  });

  // test that all tasks are shown when the list is not empty
  testWidgets('non-empty list', (tester) async {
    const tasks = [
      Task(name: "Task 1"),
      Task(name: "Task 2"),
    ];
    when(() => taskList.tasks).thenReturn(UnmodifiableListView(tasks));
    await tester.pumpYaruWidget(ChangeNotifierProvider.value(
      value: taskList,
      child: const TaskPage(),
    ));
    await tester.pumpAndSettle();

    for (final task in tasks) {
      expect(
        find.byWidgetPredicate(
            (widget) => widget is TaskTile && widget.task == task),
        findsOneWidget,
      );
    }
  });

  // test that the dialog is shown when the user taps the plus button
  testWidgets('open dialog', (tester) async {
    when(() => taskList.tasks).thenReturn(UnmodifiableListView([]));
    await tester.pumpYaruWidget(ChangeNotifierProvider.value(
      value: taskList,
      child: const TaskPage(),
    ));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(YaruIcons.plus));
    await tester.pumpAndSettle();

    expect(find.byType(TaskDialog), findsOneWidget);
  });
}
