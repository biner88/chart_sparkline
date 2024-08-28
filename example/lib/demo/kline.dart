import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:chart_sparkline_example/demo_widget.dart';
import 'package:flutter/material.dart';

class Kline extends StatelessWidget {
  const Kline({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWidget(
      title: 'Kline',
      code: '''
Sparkline(
  data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
  kLine: ['max', 'min', 'first', 'last'], //['max', 'min', 'first', 'last','all']
),
''',
      widget: Sparkline(
        data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
        kLine: ['max', 'min', 'first', 'last'], //['max', 'min', 'first', 'last','all']
      ),
    );
  }
}
