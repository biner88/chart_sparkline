import 'package:flutter/material.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: const _Body(),
      ),
    ),
  );
}

class _Configs {
  final List<double> data;
  final bool averageLabel;
  final bool averageLine;
  final Color? backgroundColor;
  final Color lineColor;
  final FillMode fillMode;
  final Color fillColor;
  final PointsMode pointsMode;
  final int pointIndex;
  final double pointSize;
  final Color pointColor;

  const _Configs({
    required this.data,
    required this.averageLabel,
    required this.averageLine,
    required this.backgroundColor,
    required this.lineColor,
    required this.fillMode,
    required this.fillColor,
    required this.pointsMode,
    required this.pointIndex,
    required this.pointSize,
    required this.pointColor,
  });

  _Configs copyWith({
    List<double>? data,
    bool? averageLabel,
    bool? averageLine,
    Color? backgroundColor,
    Color? lineColor,
    FillMode? fillMode,
    Color? fillColor,
    PointsMode? pointsMode,
    int? pointIndex,
    double? pointSize,
    Color? pointColor,
  }) {
    return _Configs(
      data: data ?? this.data,
      averageLabel: averageLabel ?? this.averageLabel,
      averageLine: averageLine ?? this.averageLine,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      lineColor: lineColor ?? this.lineColor,
      fillMode: fillMode ?? this.fillMode,
      fillColor: fillColor ?? this.fillColor,
      pointsMode: pointsMode ?? this.pointsMode,
      pointIndex: pointIndex ?? this.pointIndex,
      pointSize: pointSize ?? this.pointSize,
      pointColor: pointColor ?? this.pointColor,
    );
  }
}

class _ConfigsWidget extends StatelessWidget {
  final _Configs configs;
  final void Function(_Configs Function(_Configs)) onChanged;
  const _ConfigsWidget({
    Key? key,
    required this.configs,
    required this.onChanged,
  }) : super(key: key);

  void _toggleAverageLabel() {
    onChanged(
      (configs) => configs.copyWith(
        averageLabel: !configs.averageLabel,
      ),
    );

    if (configs.averageLabel && !configs.averageLine) {
      onChanged(
        (configs) => configs.copyWith(
          averageLine: true,
        ),
      );
    }
  }

  void _toggleAverageLine() {
    onChanged(
      (configs) => configs.copyWith(
        averageLine: !configs.averageLine,
      ),
    );

    if (!configs.averageLine) {
      onChanged(
        (configs) => configs.copyWith(averageLabel: false),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Text('averageLabel'),
            Switch(
              value: configs.averageLabel,
              onChanged: (value) {
                _toggleAverageLabel();
              },
            ),
          ],
        ),
        Row(
          children: [
            Text('averageLine'),
            Switch(
              value: configs.averageLine,
              onChanged: (value) {
                _toggleAverageLine();
              },
            ),
          ],
        ),
        _PickColorButton(
          title: 'Pick background color',
          color: configs.backgroundColor,
          onChanged: (newColor) => onChanged(
            (configs) => configs.copyWith(
              backgroundColor: newColor,
            ),
          ),
        ),
        _PickColorButton(
          title: 'Pick line color',
          color: configs.lineColor,
          onChanged: (newColor) => onChanged(
            (configs) => configs.copyWith(
              lineColor: newColor,
            ),
          ),
        ),
        Row(
          children: [
            Container(child: Text('fillMode')),
            ...FillMode.values.map(
              (fillMode) {
                return Row(
                  children: [
                    Radio<FillMode>(
                      value: fillMode,
                      groupValue: configs.fillMode,
                      onChanged: (value) {
                        onChanged(
                          (configs) => configs.copyWith(
                            fillMode: value,
                          ),
                        );
                      },
                    ),
                    Text(
                      fillMode.name,
                    ),
                  ],
                );
              },
            ).toList(),
          ],
        ),
        if (configs.fillMode != FillMode.none)
          _PickColorButton(
            title: 'Pick fill color',
            color: configs.fillColor,
            onChanged: (newColor) => onChanged(
              (configs) => configs.copyWith(
                fillColor: newColor,
              ),
            ),
          ),
        Row(
          children: [
            Container(child: Text('pointsMode')),
            ...PointsMode.values.map(
              (pointsMode) {
                return Row(
                  children: [
                    Radio<PointsMode>(
                      value: pointsMode,
                      groupValue: configs.pointsMode,
                      onChanged: (value) {
                        onChanged(
                          (configs) => configs.copyWith(
                            pointsMode: value,
                          ),
                        );
                      },
                    ),
                    Text(
                      pointsMode.name,
                    ),
                  ],
                );
              },
            ).toList(),
          ],
        ),
        if (configs.pointsMode == PointsMode.atIndex)
          Row(
            children: [
              Text('pointIndex'),
              SizedBox(
                width: 200,
                child: Slider(
                  label: configs.pointIndex.toString(),
                  divisions: configs.data.length - 1,
                  value: configs.pointIndex + .0,
                  min: 0,
                  max: configs.data.length - 1,
                  onChanged: (value) {
                    onChanged(
                      (configs) => configs.copyWith(
                        pointIndex: value.toInt(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        if (configs.pointsMode != PointsMode.none) ...[
          Row(
            children: [
              Text('pointSize'),
              SizedBox(
                width: 200,
                child: Slider(
                  label: configs.pointSize.toString(),
                  divisions: 100,
                  value: configs.pointSize + .0,
                  min: 0,
                  max: 100,
                  onChanged: (value) {
                    onChanged(
                      (configs) => configs.copyWith(
                        pointSize: value,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          _PickColorButton(
            title: 'Pick point color',
            color: configs.pointColor,
            onChanged: (newColor) => onChanged(
              (configs) => configs.copyWith(
                pointColor: newColor,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _PickColorButton extends StatelessWidget {
  const _PickColorButton({
    Key? key,
    required this.title,
    required this.color,
    required this.onChanged,
  }) : super(key: key);

  final String title;
  final Color? color;
  final void Function(Color) onChanged;

  @override
  Widget build(BuildContext context) {
    final onPressed = () {
      final pickerWidget = SizedBox(
        width: 600,
        child: ColorPicker(
          color: color ?? Colors.white,
          onChanged: onChanged,
        ),
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Pick background color'),
            content: pickerWidget,
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    };

    return Row(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          child: Text(title),
        ),
        InkWell(
          onTap: onPressed,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color,
              border: Border.all(
                // if color is bright, use black as border color
                // if color is dark, use white as border color
                color: color == null
                    ? Colors.white
                    : color!.computeLuminance() > 0.5
                        ? Colors.black
                        : Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ],
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  var _configs = const _Configs(
    data: [-1.5, 1 - 0, 2 - 5, -1.5, 2, 5, -2.3],
    averageLabel: false,
    averageLine: false,
    backgroundColor: null,
    lineColor: Colors.lightBlue,
    fillMode: FillMode.none,
    fillColor: const Color(0xFF81D4FA),
    pointsMode: PointsMode.none,
    pointIndex: 0,
    pointSize: 4.0,
    pointColor: const Color(0xFF0277BD),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ConfigsWidget(
            configs: _configs,
            onChanged: (value) {
              setState(() {
                _configs = value(_configs);
              });
            },
          ),
        ),
        Expanded(
          child: _Graph(
            configs: _configs,
          ),
        ),
      ],
    );
  }
}

class _Graph extends StatelessWidget {
  const _Graph({
    Key? key,
    required _Configs configs,
  })  : _configs = configs,
        super(key: key);

  final _Configs _configs;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        data: _configs.data,
        averageLine: _configs.averageLine,
        averageLabel: _configs.averageLabel,
        backgroundColor: _configs.backgroundColor,
        lineColor: _configs.lineColor,
        fillMode: _configs.fillMode,
        fillColor: _configs.fillColor,
        pointsMode: _configs.pointsMode,
        pointIndex: _configs.pointIndex,

        pointSize: _configs.pointSize,
        pointColor: _configs.pointColor,
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
    );
  }
}
