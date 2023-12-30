import 'package:flutter/material.dart';
import 'package:chart_sparkline/chart_sparkline.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: const _Body(),
      ),
    ),
  );
}

class _Body extends StatefulWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  bool averageLabel = false;
  void _toggleAverageLabel() {
    setState(() {
      averageLabel = !averageLabel;

      // averageLine has to be on for averageLabel to work
      if (averageLabel && !averageLine) {
        averageLine = true;
      }
    });
  }

  bool averageLine = false;
  void _toggleAverageLine() {
    setState(() {
      averageLine = !averageLine;

      // averageLine has to be on for averageLabel to work
      if (!averageLine) {
        averageLabel = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('averageLabel'),
            Switch(
              value: averageLabel,
              onChanged: (value) {
                _toggleAverageLabel();
              },
            ),
            Text('averageLine'),
            Switch(
              value: averageLine,
              onChanged: (value) {
                _toggleAverageLine();
              },
            ),
          ],
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
              left: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
              right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
              bottom: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
            ),
          ),
          width: 600.0,
          height: 250.0,
          child: Sparkline(
            data: [-1.5, 1 - 0, 2 - 5, -1.5, 2, 5, -2.3],
            averageLine: averageLine,
            averageLabel: averageLabel,
            // backgroundColor: Colors.red,
            // lineColor: Colors.lightGreen[500]!,
            // fillMode: FillMode.below,
            // fillColor: Colors.lightGreen[200]!,
            // pointsMode: PointsMode.all,
            // pointSize: 5.0,
            // pointColor: Colors.amber,
            // useCubicSmoothing: true,
            // lineWidth: 1.0,
            // gridLinelabelPrefix: '\$',
            // gridLineLabelPrecision: 3,
            // enableGridLines: true,
            // kLine: ['max', 'min', 'first', 'last'],
            // // max: 50.5,
            // // min: 10.0,
            // enableThreshold: true,
            // thresholdSize: 0.1,
            // lineGradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [Colors.purple[800]!, Colors.purple[200]!],
            // ),
            // fillGradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [Colors.red[800]!, Colors.red[200]!],
            // ),
          ),
        ),
      ],
    );
  }
}
