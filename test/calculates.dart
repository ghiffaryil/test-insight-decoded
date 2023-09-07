import 'package:flutter_test/flutter_test.dart';
import 'package:test_flutter_id/main.dart';

void main() {
  testWidgets('Calculate Sum', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    int calculateSum(int a, int b) {
      return a + b;
    }

    // Define the input values
    int a = 2;
    int b = 7;

    // Call the function to test
    int result = calculateSum(a, b);

    // Check the expected result
    expect(result, 9);
  });
}
