import 'package:flutter/material.dart';
import 'package:chart_sparkline_example/demo/all_points.dart';
import 'package:chart_sparkline_example/demo/average_line.dart';
import 'package:chart_sparkline_example/demo/fill_above.dart';
import 'package:chart_sparkline_example/demo/fill_below.dart';
import 'package:chart_sparkline_example/demo/grid_line.dart';
import 'package:chart_sparkline_example/demo/kline.dart';
import 'package:chart_sparkline_example/demo/lineopts.dart';
import 'package:chart_sparkline_example/demo/points.dart';
import 'package:chart_sparkline_example/demo/quick_start.dart';
import 'package:chart_sparkline_example/demo/smoothing.dart';
import 'package:chart_sparkline_example/demo/threshold.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Chart Sparkline',
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: ListView(
          children: [
            QuickStart(),
            Divider(),
            Lineopts(),
            Divider(),
            Points(),
            Divider(),
            AllPoints(),
            Divider(),
            FillBelow(),
            Divider(),
            FillAbove(),
            Divider(),
            Smoothing(),
            Divider(),
            AverageLine(),
            Divider(),
            Kline(),
            Divider(),
            GridLine(),
            Divider(),
            ThresholdX(),
          ],
        ),
      ),
    ),
  );
}
