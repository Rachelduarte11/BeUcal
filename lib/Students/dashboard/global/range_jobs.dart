import 'dart:async';

import 'package:becertus_proyecto/Students/models/colors.dart';
import 'package:becertus_proyecto/Students/dashboard/global/semicirculo.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ProgressBarDeterminateStyle extends StatefulWidget {
  final double progressValue;

  const ProgressBarDeterminateStyle({required this.progressValue, Key? key})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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
              thicknessUnit: GaugeSizeUnit.factor,
            ),
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
                      stops: <double>[0.25, 0.75]))
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                positionFactor: 0.1,
                widget: Text(
                  '${progressValue.toStringAsFixed(0)}%',
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

class ProgressBarRange extends StatelessWidget {
  ProgressBarRange(this.progressValue, this.gradientColor1, this.gradientColor2,
      {super.key});
  final double progressValue;
  final Color gradientColor1;
  final Color gradientColor2;
  @override
  Widget build(
    BuildContext context,
  ) {
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
              thickness: 0.4,
              color: Color.fromARGB(161, 217, 217, 217),
              thicknessUnit: GaugeSizeUnit.factor,
            ),
            pointers: <GaugePointer>[
              RangePointer(
                  value: progressValue,
                  width: 0.4,
                  enableAnimation: true,
                  animationDuration: 750,
                  color: Colors.white,
                  //pointerOffset: 0.1,
                  cornerStyle: CornerStyle.bothCurve,
                  animationType: AnimationType.linear,
                  sizeUnit: GaugeSizeUnit.factor,
                  gradient: SweepGradient(colors: <Color>[
                    gradientColor1,
                    gradientColor2.withOpacity(0.8)
                  ], stops: const <double>[
                    0.25,
                    0.75
                  ]))
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                positionFactor: 0.2,
                widget: Center(
                  child: Text(
                    '${progressValue.toStringAsFixed(0)}%',
                    style: const TextStyle(
                      color: Color(0xff323232),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
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
