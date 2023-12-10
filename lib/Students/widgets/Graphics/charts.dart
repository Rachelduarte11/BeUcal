import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:flutter/material.dart';

import '../../../functions/Provider.dart';

class RadiusChartGen extends StatefulWidget {
  const RadiusChartGen({super.key});

  @override
  State<RadiusChartGen> createState() => _RadiusChartGenState();
}

class _RadiusChartGenState extends State<RadiusChartGen> {
  late List<GDPData> _chartData;

  late double promedio;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final notasProvider = Provider.of<NotasProvider>(context);
    final ED = notasProvider.ED ?? 0.0;
    final FP = notasProvider.FP ?? 0.0;
    final EG = notasProvider.EG ?? 0.0;
    final promedio = (ED + FP + EG) / 3;
    final promedioTexto = promedio.toStringAsFixed(2);
    _chartData = getChartData(ED, FP, EG);
    return SfCircularChart(
      series: <CircularSeries>[
        RadialBarSeries<GDPData, dynamic>(
          dataSource: _chartData,
          useSeriesColor: true,
          trackOpacity: 0.3,
          radius: '100%',
          innerRadius: '50%',
          xValueMapper: (GDPData data, _) => data.course,
          yValueMapper: (GDPData data, _) => data.course,
          pointColorMapper: (GDPData data, _) => data.color,
          maximumValue: 20,
          trackBorderWidth: 5,
          cornerStyle: CornerStyle.bothCurve,
          dataLabelMapper: (GDPData data, _) => data.course.toString(),
        ),
      ],
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          widget: Center(
            child: Text(
              promedioTexto, // Coloca el número que desees
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Mitr',
                  color: Color.fromARGB(255, 52, 52, 52),
                  letterSpacing: 1),
            ),
          ),
        ),
      ],
    );
  }

  List<GDPData> getChartData(double ED, double FP, double EG) {
    return [
      GDPData(ED, Color(0xffBBC700)),
      GDPData(FP, Color(0xff00C1A7)),
      GDPData(EG, Color(0xff09806F)),
    ];
  }
}

class GDPData {
  GDPData(this.course, this.color);
  final dynamic course;
  // final double gdp;
  final Color color;
}
