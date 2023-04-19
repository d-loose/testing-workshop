import 'package:flutter_test/flutter_test.dart';
import 'package:taskapp/task.dart';
import 'package:taskapp/task_tile.dart';
import 'package:yaru_widgets/widgets.dart';

import 'test_utils.dart';

void main() {
  // test the UI for an open task
  testWidgets('open task', (tester) async {
    throw UnimplementedError('test not implemented');
  });

  // test the UI for a done task
  testWidgets('done task', (tester) async {
    throw UnimplementedError('test not implemented');
  });

  // test that the `remove` callback is called when the remove button is tapped
  testWidgets('remove task', (tester) async {
    var removed = false;
    final taskTile = TaskTile(
      task: const Task(name: 'Buy milk'),
      onChanged: (_) {},
      remove: () => removed = true,
    );
    await tester.pumpYaruWidget(taskTile);

    final removeButton = find.byType(YaruIconButton);
    expect(removeButton, findsOneWidget);

    await tester.tap(removeButton);
    expect(removed, isTrue);
  });
}
