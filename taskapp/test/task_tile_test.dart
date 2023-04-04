import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taskapp/task.dart';
import 'package:taskapp/task_tile.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_widgets/widgets.dart';

void main() {
  testWidgets('undone task', (tester) async {
    final taskTile = TaskTile(
      task: const Task(name: 'Buy milk'),
      onChanged: (_) {},
      remove: () {},
    );
    await tester.pumpYaruWidget(taskTile);

    expect(find.text('Buy milk'), findsOneWidget);

    final checkbox = find.byType(YaruCheckbox);
    expect(checkbox, findsOneWidget);
    expect(tester.widget<YaruCheckbox>(checkbox).value, isFalse);
  });

  testWidgets('done task', (tester) async {
    final taskTile = TaskTile(
      task: const Task(name: 'Buy milk', done: true),
      onChanged: (_) {},
      remove: () {},
    );
    await tester.pumpYaruWidget(taskTile);

    expect(find.text('Buy milk'), findsOneWidget);

    final checkbox = find.byType(YaruCheckbox);
    expect(checkbox, findsOneWidget);
    expect(tester.widget<YaruCheckbox>(checkbox).value, isTrue);
  });

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

extension on WidgetTester {
  Future<void> pumpYaruWidget(Widget widget) {
    return pumpWidget(YaruTheme(
      builder: (context, yaru, child) => MaterialApp(
        theme: yaru.theme,
        darkTheme: yaru.darkTheme,
        home: widget,
      ),
    ));
  }
}
