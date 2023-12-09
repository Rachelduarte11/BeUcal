import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SemiDoughnutChart extends StatefulWidget {
  const SemiDoughnutChart({Key? key}) : super(key: key);

  @override
  _SemiDoughnutChartState createState() => _SemiDoughnutChartState();
}

class _SemiDoughnutChartState extends State<SemiDoughnutChart> {
  late int startAngle;
  late int endAngle;

  @override
  void initState() {
    startAngle = 0;
    endAngle = 180;
  }

  @override
  Widget build(BuildContext context) {
    return _buildSemiDoughnutChart();
  }

  Widget _buildSemiDoughnutChart() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
              top: 15,
              left: -150,
              child: Container(
                width: 300,
                height: 300,
                //alignment: Alignment.topRight,
                child: SfCircularChart(
                  title: ChartTitle(text: ''),
                  legend: Legend(isVisible: false),
                  centerY: '60%',
                  series: _getSemiDoughnutSeries(),
                  tooltipBehavior: TooltipBehavior(enable: true),
                ),
              )),
        ],
      ),
    );
  }

  List<DoughnutSeries<ChartSampleData, String>> _getSemiDoughnutSeries() {

    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
        dataSource: <ChartSampleData>[
          ChartSampleData(
            x: 'Analista de Inventario',
            y: 50,
          ),
          ChartSampleData(
            x: 'Asistente de Consultorías',
            y: 10,
          ),
          ChartSampleData(
            x: 'Analista de Datos',
            y: 80,
          ),
          ChartSampleData(
            x: 'Especialista en RR.HH',
            y: 70,
          ),
        ],
        innerRadius: '70%',
        radius: '100%',

        startAngle: startAngle,
        endAngle: endAngle,
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.y,
        // dataLabelMapper: (ChartSampleData data, _) => data.text,
        cornerStyle: CornerStyle.bothCurve,
        dataLabelSettings: const DataLabelSettings(
          isVisible: false,
          labelPosition: ChartDataLabelPosition.outside,
        ),
      ),
    ];
  }
}


class ChartSampleData {
  ChartSampleData({required this.x, required this.y});

  final dynamic x;
  final num y;
}

