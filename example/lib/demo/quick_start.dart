import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:chart_sparkline_example/demo_widget.dart';
import 'package:flutter/material.dart';

class QuickStart extends StatelessWidget {
  const QuickStart({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWidget(
      title: 'Quick Start',
      code: '''
Sparkline(
  data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
),
''',
      widget: Sparkline(
        data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
      ),
    );
  }
}
