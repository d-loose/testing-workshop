import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:taskapp/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('integration test', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    throw UnimplementedError('test not implemented');
  });
}
