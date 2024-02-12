import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo_tdd_clean/main.dart' as app;

// TEST SCENARIO
// 1. WHEN MAIN APP LAUNCH, NO EVENT PASSED NO TASK SHOULD FOUND
// 2. CLICK ON FAB THEN ADD TEXT, THEN TODO SHOULD BE THERE IN LIST
// 3. CLICK ON DELETE ICON ON TODO SHOULD REMOVE THE TODO

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // BEFORE ALL IT SHOULD START APP
  setUpAll(() {
    app.main();
  });

  // group('App Integration Test', () {
  testWidgets('WHEN MAIN APP LAUNCH, NO EVENT PASSED NO TASK SHOULD FOUND', (widgetTester) async {
    // widgetTester.pumpWidget(app.main());
    // app.main();

    await widgetTester.pumpAndSettle();
    // ARRAGE

    // ACT

    // ASSERT
    final res = find.byKey(const Key('emptyContainer'));

    expect(res, findsOneWidget);
    expect(find.text('No Todo'), findsOneWidget);
  });

  testWidgets('CLICK ON FAB THEN ADD TEXT, THEN TODO SHOULD BE THERE IN LIST', (widgetTester) async {
    // widgetTester.pumpWidget(app.main());
    await widgetTester.pumpAndSettle();

    // ARRAGE

    // ACT
    final fab = find.byIcon(Icons.add);
    await widgetTester.press(fab);
    final textField = find.byKey(const Key("titleField"));

    await widgetTester.enterText(textField, 'New Todo');
    final yesButton = find.byKey(const Key("yesButton"));
    await widgetTester.press(yesButton);
    await widgetTester.pumpAndSettle();
    // ASSERT
    final res = find.byKey(const Key("listView"));

    expect(res, findsOneWidget);
    expect(find.text('New Todo'), findsOneWidget);
  });

  testWidgets('CLICK ON DELETE ICON ON TODO SHOULD REMOVE THE TODO', (widgetTester) async {
    // widgetTester.pumpWidget(app.main());
    await widgetTester.pumpAndSettle();
    // ARRAGE

    // ACT
    final deleteButton = find.byKey(const Key("deleteButton"));
    await widgetTester.press(deleteButton);

    final res = find.byKey(const Key("listView"));

    expect(res, findsOneWidget);
    expect(find.text('New Todo'), findsNothing);
  });
  // });
}
