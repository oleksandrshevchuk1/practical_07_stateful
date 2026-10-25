import 'package:flutter_test/flutter_test.dart';
import 'package:practical_07/main.dart' as app;

void main() {
  testWidgets('Практична 7: відкривається потрібний екран', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    expect(find.text('Конфігуратор Container'), findsWidgets);
  });
}
