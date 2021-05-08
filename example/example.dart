import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:chart_sparkline/flutter_sparkline.dart';

math.Random random = new math.Random();

List<double> _generateRandomData(int count) {
  List<double> result = <double>[];
  for (int i = 0; i < count; i++) {
    result.add(random.nextDouble() * 100);
  }
  return result;
}

void main() {
  var data = _generateRandomData(100);
  runApp(
    new MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: new Container(
            width: 300.0,
            height: 100.0,
            child: new Sparkline(
              data: data,
              lineColor: Colors.lightGreen[500]!,
              fillMode: FillMode.below,
              fillColor: Colors.lightGreen[200]!,
              pointsMode: PointsMode.all,
              pointSize: 5.0,
              pointColor: Colors.amber,
              useCubicSmoothing: true,
              lineWidth: 1.0,
              gridLinelabelPrefix: '\$',
              gridLineLabelPrecision: 3,
              enableGridLines: true,
              averageLine: true,
              kLine: ['max', 'min', 'first', 'last'],
              // max: 50.5,
              // min: 10.0,
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
