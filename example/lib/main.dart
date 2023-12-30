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
  final bool averageLabel;
  final bool averageLine;
  final Color? backgroundColor;
  final Color lineColor;
  final FillMode fillMode;
  final Color fillColor;

  const _Configs({
    required this.averageLabel,
    required this.averageLine,
    required this.backgroundColor,
    required this.lineColor,
    required this.fillMode,
    required this.fillColor,
  });

  _Configs copyWith({
    bool? averageLabel,
    bool? averageLine,
    Color? backgroundColor,
    Color? lineColor,
    FillMode? fillMode,
    Color? fillColor,
  }) {
    return _Configs(
        averageLabel: averageLabel ?? this.averageLabel,
        averageLine: averageLine ?? this.averageLine,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        lineColor: lineColor ?? this.lineColor,
        fillMode: fillMode ?? this.fillMode,
        fillColor: fillColor ?? this.fillColor);
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
          onChanged: (newColor) => onChanged(
            (configs) => configs.copyWith(
              backgroundColor: newColor,
            ),
          ),
        ),
        _PickColorButton(
          title: 'Pick line color',
          onChanged: (newColor) => onChanged(
            (configs) => configs.copyWith(
              lineColor: newColor,
            ),
          ),
        ),
        Row(
          children: [
            Container(child: Text('FillMode')),
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
        _PickColorButton(
          title: 'Pick fill color',
          onChanged: (newColor) => onChanged(
            (configs) => configs.copyWith(
              fillColor: newColor,
            ),
          ),
        ),
      ],
    );
  }
}

class _PickColorButton extends StatelessWidget {
  const _PickColorButton({
    Key? key,
    required this.title,
    required this.onChanged,
  }) : super(key: key);

  final String title;
  final void Function(Color) onChanged;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final pickerWidget = SizedBox(
          width: 600,
          child: ColorPicker(
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
      },
      child: Text(title),
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
    averageLabel: false,
    averageLine: false,
    backgroundColor: null,
    lineColor: Colors.lightBlue,
    fillMode: FillMode.none,
    fillColor: const Color(0xFF81D4FA),
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
        data: [-1.5, 1 - 0, 2 - 5, -1.5, 2, 5, -2.3],
        averageLine: _configs.averageLine,
        averageLabel: _configs.averageLabel,
        backgroundColor: _configs.backgroundColor,
        lineColor: _configs.lineColor,
        fillMode: _configs.fillMode,
        fillColor: _configs.fillColor,
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
    );
  }
}
