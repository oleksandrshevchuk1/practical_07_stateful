import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'ui.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) =>
      const CourseApp(title: 'Практична 07', home: Configurator());
}

class Configurator extends StatefulWidget {
  const Configurator({super.key});
  @override
  State<Configurator> createState() => _ConfiguratorState();
}

class _ConfiguratorState extends State<Configurator> {
  double _width = 150, _height = 150, _radius = 20;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Конфігуратор Container')),
    body: PageBody(
      children: [
        const Text(
          'Номер 25 → завдання 1. Stateless-перегляд і Stateful-стан.',
        ),
        ContainerPreview(width: _width, height: _height, radius: _radius),
        DimensionSlider(
          label: 'Ширина',
          value: _width,
          min: 50,
          max: 280,
          onChanged: (v) => setState(() {
            _width = v;
            _radius = math.min(_radius, math.min(_width, _height));
          }),
        ),
        DimensionSlider(
          label: 'Висота',
          value: _height,
          min: 50,
          max: 280,
          onChanged: (v) => setState(() {
            _height = v;
            _radius = math.min(_radius, math.min(_width, _height));
          }),
        ),
        DimensionSlider(
          label: 'Верхній правий радіус',
          value: _radius,
          min: 0,
          max: math.min(_width, _height),
          onChanged: (v) => setState(() => _radius = v),
        ),
      ],
    ),
  );
}

class ContainerPreview extends StatelessWidget {
  const ContainerPreview({
    super.key,
    required this.width,
    required this.height,
    required this.radius,
  });
  final double width, height, radius;
  @override
  Widget build(BuildContext context) => SizedBox(
    height: 300,
    child: Center(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Container(
          key: const Key('preview'),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(topRight: Radius.circular(radius)),
          ),
        ),
      ),
    ),
  );
}

class DimensionSlider extends StatelessWidget {
  const DimensionSlider({
    super.key,
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });
  final String label;
  final double value, min, max;
  final ValueChanged<double> onChanged;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('$label: ${value.round()}'),
      Slider(
        label: value.round().toString(),
        value: value,
        min: min,
        max: max,
        onChanged: onChanged,
      ),
    ],
  );
}
