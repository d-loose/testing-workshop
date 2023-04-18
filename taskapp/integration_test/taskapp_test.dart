import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:taskapp/main.dart' as app;
import 'package:taskapp/task_tile.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/widgets.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('integration test', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text('Task App'), findsOneWidget);
    expect(find.byType(TaskTile), findsNothing);

    final fab = find.byType(FloatingActionButton);
    expect(fab, findsOneWidget);

    await tester.tap(fab);
    await tester.pumpAndSettle();

    expect(find.text('New Task'), findsOneWidget);
    expect(find.text('Task Name'), findsOneWidget);
    expect(find.text('Enter a task name'), findsOneWidget);
    expect(find.widgetWithText(OutlinedButton, 'Cancel'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Add'), findsOneWidget);

    final textfield = find.byType(TextField);
    expect(textfield, findsOneWidget);

    await tester.enterText(textfield, 'example task');
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(TaskTile, 'example task'), findsOneWidget);

    final checkbox = find.byType(YaruCheckbox);
    expect(checkbox, findsOneWidget);
    expect(tester.widget<YaruCheckbox>(checkbox).value, isFalse);
    await tester.tap(checkbox);
    await tester.pumpAndSettle();
    expect(tester.widget<YaruCheckbox>(checkbox).value, isTrue);

    await tester.tap(find.byIcon(YaruIcons.trash));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(TaskTile, 'example task'), findsNothing);
  });
}
