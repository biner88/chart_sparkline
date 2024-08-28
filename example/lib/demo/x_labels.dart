import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:chart_sparkline_example/demo_widget.dart';
import 'package:flutter/material.dart';

class XLabels extends StatelessWidget {
  const XLabels({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWidget(
      title: 'X Labels & X Value & Grid Lines',
      code: '''
Sparkline(
  data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
  xValueShow: true,
  xLabels: ['x1', 'x2', 'x3', 'x4', 'x5', 'x6', 'x7', 'x8', 'x9', 'x10', 'x11'],
  gridLinelabelPrefix: '\$ ',
  gridLinelabelSuffix: 'M',
  gridLineLabelPrecision: 3,
  gridLineColor: const Color(0xFFFA049B),
  gridLineLabelFixed: true,
  gridLineLabelStyle: TextStyle(
    textBaseline: TextBaseline.alphabetic,
    color: Colors.black,
    fontSize: 10.0,
  ),
  gridLinesEnable: true,
  fillMode: FillMode.below,
  fillColor: const Color(0xFFE18A8A),
  useCubicSmoothing: true,
  cubicSmoothingFactor: 0.2,
),
''',
      widget: Sparkline(
        data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
        xValueShow: true,
        xLabels: ['x1', 'x2', 'x3', 'x4', 'x5', 'x6', 'x7', 'x8', 'x9', 'x10', 'x11'],
        gridLinelabelPrefix: '\$ ',
        gridLinelabelSuffix: 'M',
        gridLineLabelPrecision: 3,
        gridLineColor: const Color(0xFFFA049B),
        gridLineLabelFixed: true,
        gridLineLabelStyle: TextStyle(
          textBaseline: TextBaseline.alphabetic,
          color: Colors.black,
          fontSize: 10.0,
        ),
        gridLinesEnable: true,
        fillMode: FillMode.below,
        fillColor: const Color(0xFFE18A8A),
        useCubicSmoothing: true,
        cubicSmoothingFactor: 0.2,
      ),
    );
  }
}
