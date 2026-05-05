import 'package:flutter_test/flutter_test.dart';
import 'package:food_deliver/main.dart';

void main() {
  testWidgets('FoodDeliverApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const FoodDeliverApp());
    expect(find.byType(FoodDeliverApp), findsOneWidget);
  });
}
