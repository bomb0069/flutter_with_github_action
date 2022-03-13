import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_with_github_action/main.dart' as app;

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('increment', () {
    testWidgets('success', (WidgetTester tester) async {
      app.main();
      await binding.convertFlutterSurfaceToImage();
      await tester.pumpAndSettle();

      await binding.takeScreenshot('before-screenshot');

      // Verify the counter starts at 0.
      expect(find.text('0'), findsOneWidget);

      // Finds the floating action button to tap on.
      final Finder fab = find.byTooltip('Increment');

      // Emulate a tap on the floating action button.
      await tester.tap(fab);

      // Trigger a frame.
      await tester.pumpAndSettle();

      await binding.takeScreenshot('after-screenshot');

      // Verify the counter increments by 1.
      expect(find.text('5'), findsOneWidget);
    });
  });
}
