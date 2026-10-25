import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:practical_07/main.dart';

void main() {
  testWidgets('Ширина, висота, верхній правий радіус змінюються окремо', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    final sliders = find.byType(Slider);
    tester.widget<Slider>(sliders.at(0)).onChanged!(240);
    await tester.pump();
    tester.widget<Slider>(sliders.at(1)).onChanged!(200);
    await tester.pump();
    tester.widget<Slider>(sliders.at(2)).onChanged!(40);
    await tester.pump();
    final box = tester.widget<Container>(find.byKey(const Key('preview')));
    expect(box.constraints!.maxWidth, 240);
    expect(box.constraints!.maxHeight, 200);
    final style = box.decoration! as BoxDecoration;
    expect(style.color, Colors.red);
    expect(
      style.borderRadius,
      const BorderRadius.only(topRight: Radius.circular(40)),
    );
  });
}
