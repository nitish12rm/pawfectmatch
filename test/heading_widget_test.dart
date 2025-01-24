import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pawfectmatch/features/home/view/homescreen_view.dart';

void main() {
  testWidgets('HeadingWidget displays title', (WidgetTester tester) async {
    // The title to test
    const testTitle = 'Test Heading';

    // Build the widget tree
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HeadingWidget(title: testTitle),
        ),
      ),
    );

    // Verify that the title text is displayed correctly
    expect(find.text(testTitle), findsOneWidget);

    // Verify that the Text widget has the correct style (bold, font size 25)
    final textWidget = tester.widget<Text>(find.text(testTitle));
    final textStyle = textWidget.style;
    expect(textStyle?.fontWeight, equals(FontWeight.bold));
    expect(textStyle?.fontSize, equals(25));
  });
}
