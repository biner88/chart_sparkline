import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:chart_sparkline_example/demo_widget.dart';
import 'package:flutter/material.dart';

class Lineopts extends StatelessWidget {
  const Lineopts({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWidget(
      title: 'Lineopts',
      code: '''
Sparkline(
  data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
  lineWidth: 2.0,
  lineGradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.purple, Colors.purple],
  ),
),
''',
      widget: Sparkline(
        data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
        lineWidth: 2.0,
        lineGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.purple, Colors.purple],
        ),
      ),
    );
  }
}
