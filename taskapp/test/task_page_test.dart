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
  late TaskList model;

  setUp(() {
    model = MockTaskList();
  });
  testWidgets('empty list', (tester) async {
    when(() => model.tasks).thenReturn(UnmodifiableListView([]));
    await tester.pumpYaruWidget(ChangeNotifierProvider.value(
      value: model,
      child: const TaskPage(),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(TaskTile), findsNothing);
  });

  testWidgets('non-empty list', (tester) async {
    const tasks = [
      Task(name: "Task 1"),
      Task(name: "Task 2"),
    ];
    when(() => model.tasks).thenReturn(UnmodifiableListView(tasks));
    await tester.pumpYaruWidget(ChangeNotifierProvider.value(
      value: model,
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

  testWidgets('open dialog', (tester) async {
    when(() => model.tasks).thenReturn(UnmodifiableListView([]));
    await tester.pumpYaruWidget(ChangeNotifierProvider.value(
      value: model,
      child: const TaskPage(),
    ));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(YaruIcons.plus));
    await tester.pumpAndSettle();
    expect(find.byType(TaskDialog), findsOneWidget);
  });
}
