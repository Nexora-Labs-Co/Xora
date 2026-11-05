import 'package:flutter_test/flutter_test.dart';

import 'package:example/main.dart';

void main() {
  testWidgets('showcase builds', (WidgetTester tester) async {
    await tester.pumpWidget(const XoraShowcaseApp());
    await tester.pumpAndSettle();
    expect(find.text('Colors'), findsOneWidget);
  });
}

