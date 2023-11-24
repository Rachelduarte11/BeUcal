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
      height: 100,
      width: 100,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            showLabels: false,
            showTicks: false,
            startAngle: 270,
            endAngle: 270,
            radiusFactor: 1,
            axisLineStyle: const AxisLineStyle(
              thickness: 0.2,
              color: Color.fromARGB(30, 0, 169, 181),
                thicknessUnit: GaugeSizeUnit.factor,),
            pointers: <GaugePointer>[
              RangePointer(
                value: progressValue,
                width: 0.2,
                enableAnimation: true,
                animationDuration: 750,
                color: Colors.white,
                //pointerOffset: 0.1,
               cornerStyle: CornerStyle.bothCurve,
                animationType: AnimationType.linear,
                sizeUnit: GaugeSizeUnit.factor,
                gradient: const SweepGradient(
                        colors: <Color>[Color(0xFF44DECC), Color(0xFF0BB49D)],
                        stops: <double>[0.25, 0.75])
              )
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                positionFactor: 0.1,
                widget: Text(
                  progressValue.toStringAsFixed(0) + '%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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
