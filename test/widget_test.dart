import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:portofolio/main.dart';

void main() {
  testWidgets('Halaman utama menampilkan hero', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1400, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MyApp());
    expect(find.text('Flutter Developer'), findsOneWidget);
    expect(find.text('Karya Saya'), findsWidgets);
  });
}
