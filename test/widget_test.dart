import 'package:flutter_test/flutter_test.dart';
import 'package:saral_jyotish/app.dart';

void main() {
  testWidgets('Saral Jyotish app displays main navigation', (WidgetTester tester) async {
    await tester.pumpWidget(const SaralJyotishApp());

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Kundli'), findsOneWidget);
    expect(find.text('Panchang'), findsOneWidget);
    expect(find.text('Learn'), findsOneWidget);
  });
}
