import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:chart_sparkline_example/demo_widget.dart';
import 'package:flutter/material.dart';

class MaxLine extends StatelessWidget {
  const MaxLine({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWidget(
      title: 'Max Line',
      code: '''
Sparkline(
  data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
  lineColor: const Color(0xFFFA049B),
  gridLinelabelPrefix: '\$ ',
  gridLinelabelSuffix: 'M',
  gridLineLabelPrecision: 3,
  gridLineColor: const Color(0xFFFA049B),
  gridLineLabelFixed: true,
  gridLineLabelStyle: TextStyle(
    textBaseline: TextBaseline.alphabetic,
    color: Colors.white,
    fontSize: 10.0,
  ),
  maxLabel: true,
  maxLine: true,
  maxLineColor: const Color(0xFFFA049B),
),
''',
      widget: Sparkline(
        data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
        lineColor: const Color(0xFFFA049B),
        gridLinelabelPrefix: '\$ ',
        gridLinelabelSuffix: 'M',
        gridLineLabelPrecision: 3,
        gridLineColor: const Color(0xFFFA049B),
        gridLineLabelFixed: true,
        gridLineLabelStyle: TextStyle(
          textBaseline: TextBaseline.alphabetic,
          color: Colors.white,
          fontSize: 10.0,
        ),
        maxLabel: true,
        maxLine: true,
      ),
    );
  }
}
