import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:chart_sparkline_example/demo_widget.dart';
import 'package:flutter/material.dart';

class AllPoints extends StatelessWidget {
  const AllPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoWidget(
      title: 'All Points',
      code: '''
Sparkline(
  data: data,
  pointsMode: PointsMode.all,
  pointSize: 4.0,
  pointColor: Colors.red,
),
''',
      widget: Sparkline(
        data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
        pointsMode: PointsMode.all,
        pointSize: 8.0,
        pointColor: Colors.amber,
      ),
    );
  }
}
