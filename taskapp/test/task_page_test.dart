import 'dart:collection';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/task_list.dart';
import 'package:taskapp/task_page.dart';
import 'package:taskapp/task_tile.dart';

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
    throw UnimplementedError('test not implemented');
  });

  // test that the dialog is shown when the user taps the plus button
  testWidgets('open dialog', (tester) async {
    throw UnimplementedError('test not implemented');
  });
}
