import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:chart_sparkline_example/demo_widget.dart';
import 'package:flutter/material.dart';

class AnimationChart extends StatefulWidget {
  const AnimationChart({super.key});

  @override
  State<AnimationChart> createState() => _AnimationChartState();
}

class _AnimationChartState extends State<AnimationChart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DemoWidget(
      title: 'Animation',
      code: '''
Sparkline(
    data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
    animationController: _controller,
    pointsMode: PointsMode.all,
    pointSize: 8.0,
),
''',
      widget: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Sparkline(
          data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
          animationController: _controller,
          pointsMode: PointsMode.all,
          pointSize: 8.0,
        ),
      ),
    );
  }
}
