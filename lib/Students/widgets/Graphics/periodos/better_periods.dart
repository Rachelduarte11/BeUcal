
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../functions/Provider.dart';

class MyPeriodBar extends StatefulWidget {
  @override
  State<MyPeriodBar> createState() => _MyPeriodBarState();
}


class _MyPeriodBarState extends State<MyPeriodBar> {
  late List<PeriodData> _periodData;

   @override
  void initState() {
    super.initState();
    // No accedas a Provider aquí, ya que es demasiado temprano
  }
   @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Accede al Provider aquí después de que se hayan establecido las dependencias
    final notasProvider = Provider.of<NotasProvider>(context);

    final nd1ED = notasProvider.ED ?? 0.0;
    final nd1FP = notasProvider.FP ?? 0.0;
    final nd1EG = notasProvider.EG ?? 0.0;
    final nd3ED = notasProvider.ED ?? 0.0;
    final nd3FP = notasProvider.FP ?? 0.0;
    final nd3EG = notasProvider.EG ?? 0.0;
    final nd2ED = notasProvider.nd2ED ?? 0.0;
    final nd2FP = notasProvider.nd2FP ?? 0.0;
    final nd2EG = notasProvider.nd2EG ?? 0.0;

    _periodData = getPeriodData(nd1ED, nd1FP, nd1EG, nd2ED, nd2FP, nd2EG, nd3ED, nd3FP, nd3EG);
  }


  @override
  Widget build(BuildContext context) {
 
    return Container(
      height: 300,
      width: 300,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
        ),
        legend: Legend(
          isVisible: true,
        ),
        primaryYAxis: NumericAxis(
            maximum: 20,
            majorGridLines: const MajorGridLines(width: 0),
            numberFormat: NumberFormat.compact()),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries>[
          BarSeries<PeriodData, String>(
              dataSource: _periodData,
              xValueMapper: (PeriodData data, _) => data.period,
              yValueMapper: (PeriodData data, _) => data.nota1,
              width: 0.8,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              name: 'ED',
              color: Color(0xffBBC700)),
          BarSeries<PeriodData, String>(
              dataSource: _periodData,
              xValueMapper: (PeriodData data, _) => data.period,
              yValueMapper: (PeriodData data, _) => data.nota2,
              width: 0.8,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              name: 'FP',
              color: Color(0xff00C1A7)),
          BarSeries<PeriodData, String>(
              dataSource: _periodData,
              xValueMapper: (PeriodData data, _) => data.period,
              yValueMapper: (PeriodData data, _) => data.nota3,
              width: 0.8,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              name: 'EG',
              color: Color(0xff09806F)),
        ],
      ),
    );
  }

List<PeriodData> getPeriodData(double nd1ED, double nd1FP, double nd1EG, double nd2ED, double nd2FP, double nd2EG,
      double nd3ED, double nd3FP, double nd3EG) {
    final List<PeriodData> periodData = [
      PeriodData('ND1', nd1ED, nd1FP, nd1EG),
      PeriodData('ND2', nd2ED, nd2FP, nd2EG),
      PeriodData('ND3', nd3ED, nd3FP, nd3EG),
    ];
    return periodData;
  }
}

class PeriodData {
  PeriodData(this.period, this.nota1, this.nota2, this.nota3);
  final String period;
  final double nota1;
  final double nota2;
  final double nota3;
}
