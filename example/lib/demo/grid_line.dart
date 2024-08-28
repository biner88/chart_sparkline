import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:chart_sparkline_example/demo_widget.dart';
import 'package:flutter/material.dart';

class GridLine extends StatelessWidget {
  const GridLine({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWidget(
      title: 'Grid Line',
      code: '''
Sparkline(
  data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
  gridLinelabelPrefix: '\$ ',
  gridLinelabelSuffix: 'M',
  gridLineLabelPrecision: 2,
  enableGridLines: true,
  gridLineLabelFixed: true,
),
''',
      widget: Sparkline(
        data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
        gridLinelabelPrefix: '\$ ',
        gridLinelabelSuffix: 'M',
        gridLineLabelPrecision: 3,
        enableGridLines: true,
        gridLineLabelFixed: true,
      ),
    );
  }
}
