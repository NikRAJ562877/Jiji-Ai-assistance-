import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:learn_with_jiji/main.dart';

void main() {
  testWidgets('Jiji App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const JijiApp());

    // Verify that the app launches and displays 'Jiji'
    expect(find.text('Jiji'), findsOneWidget);
  });
}
