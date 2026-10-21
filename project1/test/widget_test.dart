import 'package:flutter_test/flutter_test.dart';
import 'package:project1/main.dart';

void main() {
  testWidgets('App smoke test renders login', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('LOGIN'), findsOneWidget);
  });
}
