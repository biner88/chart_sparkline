import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:chart_sparkline_example/demo_widget.dart';
import 'package:flutter/material.dart';

class TestX extends StatelessWidget {
  const TestX({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWidget(
      title: 'Grid Line & Fill Mode',
      code: '''
Sparkline(
  data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
  gridLinelabelPrefix: '\$ ',
  gridLinelabelSuffix: 'M',
  gridLineLabelPrecision: 3,
  gridLineColor: Colors.green,
  enableGridLines: true,
  gridLineLabelFixed: true,
  fillMode: FillMode.below,
  fillColor: const Color(0xFFE18A8A),
  useCubicSmoothing: true,
  cubicSmoothingFactor: 0.2,
),
''',
      widget: Sparkline(
        data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
        gridLinelabelPrefix: '\$ ',
        gridLinelabelSuffix: 'M',
        gridLineLabelPrecision: 3,
        gridLineColor: Colors.green,
        gridLinesEnable: true,
        gridLineLabelFixed: true,
        fillMode: FillMode.below,
        fillColor: const Color(0xFFE18A8A),
        useCubicSmoothing: true,
        cubicSmoothingFactor: 0.2,
      ),
    );
  }
}
