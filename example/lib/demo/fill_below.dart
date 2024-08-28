import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:chart_sparkline_example/demo_widget.dart';
import 'package:flutter/material.dart';

class FillBelow extends StatelessWidget {
  const FillBelow({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWidget(
      title: 'Fill Below',
      code: '''
Sparkline(
  data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
  fillMode: FillMode.above,
  fillColor: const Color(0xFFE18A8A),
),
''',
      widget: Sparkline(
        data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
        fillMode: FillMode.above,
        fillColor: const Color(0xFFE18A8A),
      ),
    );
  }
}
