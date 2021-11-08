import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_app_bloc/pages/home_page.dart' as app;

void main() {
  group('end-to-end test', () {
    final IntegrationTestWidgetsFlutterBinding binding =
        IntegrationTestWidgetsFlutterBinding.ensureInitialized()
            as IntegrationTestWidgetsFlutterBinding;

    testWidgets('Test widget Appbar tittle, ', (WidgetTester tester) async {
      app.HomePage();
      await binding.traceAction(() async {
        final Finder kehilangan = find.byKey(Key('tapKehilangan'));
        await tester.pumpAndSettle(const Duration(seconds: 2));
        await tester.tap(kehilangan);
        await tester.pumpAndSettle(const Duration(seconds: 2));
        expect(
            find.byWidgetPredicate((widget) =>
                widget is AppBar &&
                widget.title is Text &&
                (widget.title as Text).data.startsWith("Barang Hilang")),
            findsOneWidget);
      });
    });
  });
}
