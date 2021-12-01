import 'package:flutter/material.dart';
import 'package:chart_sparkline/chart_sparkline.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 600.0,
            height: 250.0,
            child: Sparkline(
              data: [-1.5, 1 - 0, 2 - 5, -1.5, 2, 5, -2.3],
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
              averageLine: true,
              averageLabel: true,
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
        ),
      ),
    ),
  );
}
