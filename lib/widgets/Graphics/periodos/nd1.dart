
import 'package:becertus_proyecto/functions/Provider.dart';
import 'package:becertus_proyecto/widgets/Graphics/charts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class ND1RadiusChartGen extends StatefulWidget {
  const ND1RadiusChartGen({super.key});

  @override
  State<ND1RadiusChartGen> createState() => _ND1RadiusChartGenState();
}

class _ND1RadiusChartGenState extends State<ND1RadiusChartGen> {
  late List<GDPData> _chartData;
  String promedioTexto = ''; // Declarar la variable aquí

//Funcion parea sumar el promedio general
 /* @override
  void initState() {
    _chartData = getChartData();
    final List<GDPData> averageData = [
      GDPData(nd1ED, Color(0xffBBC700)),
      GDPData(nd1FP, Color(0xff00C1A7)),
      GDPData(nd1EG, Color(0xff09806F)),
    ];
    double calcularPromedio(List<GDPData> chartData) {
      if (chartData.isEmpty) {
        return 0.0; }

      double suma = 0.0;
      for (var data in chartData) {
        suma += data.course;
      }

      return suma / chartData.length;
    }

    double promedio = calcularPromedio(averageData);
    promedioTexto = promedio.toStringAsFixed(2); // Asignar el valor aquí

    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    final notasProvider = Provider.of<NotasProvider>(context);
    final nd1ED = notasProvider.nd1ED?? 0.0;
    final nd1FP = notasProvider.nd1FP?? 0.0; 
    final nd1EG = notasProvider.nd1EG?? 0.0;
    
    _chartData = getChartData(nd1ED, nd1FP, nd1EG);
    return  SfCircularChart(
  
        series: <CircularSeries>[
          RadialBarSeries<GDPData, dynamic>(
            dataSource: _chartData,
            useSeriesColor: true,
            trackOpacity: 0.3,
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

  List<GDPData> getChartData(double nd1ED, double nd1FP, double nd1EG) {
    final List<GDPData> chartData = [
     GDPData(nd1ED, Color(0xffBBC700)),
      GDPData(nd1FP, Color(0xff00C1A7)),
      GDPData(nd1EG, Color(0xff09806F)),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.course, this.color);
  final dynamic course;
  // final double gdp;
  final Color color;
}

