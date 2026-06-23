import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:chat/main.dart';

void main() {
  testWidgets('Instagram home opens messages screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Instagram'), findsOneWidget);
    expect(find.text('Stories'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.send));
    await tester.pumpAndSettle();

    expect(find.text('Messages'), findsOneWidget);
    expect(find.text('Beautiful sunset today'), findsOneWidget);
  });
}
