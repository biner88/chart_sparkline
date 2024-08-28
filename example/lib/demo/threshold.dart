import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:chart_sparkline_example/demo_widget.dart';
import 'package:flutter/material.dart';

class ThresholdX extends StatelessWidget {
  const ThresholdX({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWidget(
      title: 'Threshold',
      code: '''
Sparkline(
  data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
  enableThreshold: true,
  thresholdSize: 0.5,
),
''',
      widget: Sparkline(
        data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
        enableThreshold: true,
        thresholdSize: 0.5,
      ),
    );
  }
}
