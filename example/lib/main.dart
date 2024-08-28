import 'package:chart_sparkline_example/demo/animation.dart';
import 'package:flutter/material.dart';
import 'package:chart_sparkline_example/demo/x_labels.dart';
import 'package:chart_sparkline_example/demo/max_line.dart';
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
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Chart Sparkline',
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Chart Sparkline',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Image.network(
                            'https://github.githubassets.com/assets/GitHub-Mark-ea2971cee799.png',
                            width: 20,
                          ),
                          onPressed: () {
                            launchUrl(
                              Uri.parse('https://github.com/biner88/chart_sparkline'),
                            );
                          },
                        ),
                        Text(
                          'https://github.com/biner88/chart_sparkline',
                          style: TextStyle(color: Colors.black45),
                        ),
                      ],
                    ),
                    onPressed: () {
                      launchUrl(
                        Uri.parse('https://github.com/biner88/chart_sparkline'),
                      );
                    },
                  ),
                ],
              ),
            ),
            QuickStart(),
            AnimationChart(),
            XLabels(),
            MaxLine(),
            Lineopts(),
            Points(),
            AllPoints(),
            FillBelow(),
            FillAbove(),
            Smoothing(),
            AverageLine(),
            Kline(),
            GridLine(),
            ThresholdX(),
          ],
        ),
      ),
    ),
  );
}
