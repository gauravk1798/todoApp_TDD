import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/todo_providers.dart';
import 'package:todo/screens/home_screen.dart';
import 'package:todo/services/todo_services.dart';

void main() {
  testWidgets('adds todo and displays it in list', (WidgetTester tester) async {
    // Build widget tree with provider
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => TodoProvider(TodoService()),
          child: HomeScreen(),
        ),
      ),
    );

    // Verify initial empty state
    expect(find.byType(ListTile), findsNothing);

    // Enter text into TextField
    await tester.enterText(find.byType(TextField), 'Buy milk');

    // Tap Add button
    await tester.tap(find.text('Add'));
    await tester.pump(); // Rebuild after state change

    // Check if todo is now displayed
    expect(find.text('Buy milk'), findsOneWidget);
    expect(find.byType(ListTile), findsOneWidget);
  });

  testWidgets('toggles todo completion', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => TodoProvider(TodoService()),
          child: HomeScreen(),
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'Go to gym');
    await tester.tap(find.text('Add'));
    await tester.pump();

    // Tap on the ListTile to toggle
    await tester.tap(find.text('Go to gym'));
    await tester.pump();

    // The text should have a line-through decoration now
    final textWidget = tester.widget<Text>(find.text('Go to gym'));
    expect(textWidget.style?.decoration, TextDecoration.lineThrough);
  });
}
