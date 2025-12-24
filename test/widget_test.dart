import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:xtermux/main.dart';

void main() {
  testWidgets('XTermux app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const XTermuxApp());

    expect(find.text('Termux Information'), findsOneWidget);

    expect(find.text('Termux Info'), findsOneWidget);
    expect(find.text('Sources'), findsOneWidget);
    expect(find.text('Setup'), findsOneWidget);

    await tester.tap(find.text('Sources'));
    await tester.pumpAndSettle();

    expect(find.text('Package Sources'), findsOneWidget);

    await tester.tap(find.text('Setup'));
    await tester.pumpAndSettle();

    expect(find.text('Setup Guide'), findsOneWidget);
  });
}
