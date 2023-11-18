import 'dart:async';

import 'package:becertus_proyecto/widgets/dashboard/global/semicirculo.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

/*
class MyAppEjemplo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Center(
          child: ProgressBarDeterminateStyle(),
        ),
      ),
    );
  }
}*/
class ProgressBarDeterminateStyle extends StatefulWidget {
  final double progressValue;
  

  const ProgressBarDeterminateStyle({required this.progressValue, Key? key})
      : super(key: key);

  @override
  _ProgressBarDeterminateStyleState createState() =>
      _ProgressBarDeterminateStyleState();
}

class _ProgressBarDeterminateStyleState
    extends State<ProgressBarDeterminateStyle> {
  late double progressValue;

  @override
  void initState() {
    super.initState();
    progressValue = widget.progressValue;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            showLabels: false,
            showTicks: false,
            startAngle: 270,
            endAngle: 270,
            radiusFactor: 1.0,
            axisLineStyle: const AxisLineStyle(
              thickness: 1,
              color: Color(0xff0BB49D),
              thicknessUnit: GaugeSizeUnit.factor,
            ),
            pointers: <GaugePointer>[
              RangePointer(
                value: progressValue,
                width: 0.15,
                enableAnimation: true,
                animationDuration: 30,
                color: Colors.white,
                pointerOffset: 0.1,
                cornerStyle: CornerStyle.bothCurve,
                animationType: AnimationType.linear,
                sizeUnit: GaugeSizeUnit.factor,
              )
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                positionFactor: 0.5,
                widget: Text(
                  progressValue.toStringAsFixed(0) + '%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
