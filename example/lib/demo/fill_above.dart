import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:chart_sparkline_example/demo_widget.dart';
import 'package:flutter/material.dart';

class FillAbove extends StatelessWidget {
  const FillAbove({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWidget(
      title: 'Fill Above',
      code: '''
Sparkline(
  data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
  fillMode: FillMode.below,
  fillGradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [const Color(0xFFB1362D), const Color(0xFFDFA3A3)],
  ),
),
''',
      widget: Sparkline(
        data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
        fillMode: FillMode.below,
        fillGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [const Color(0xFFB1362D), const Color(0xFFDFA3A3)],
        ),
      ),
    );
  }
}
