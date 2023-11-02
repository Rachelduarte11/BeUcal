import 'package:becertus_proyecto/widgets/Graphics/charts.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class ND3RadiusChartGen extends StatefulWidget {
  const ND3RadiusChartGen({super.key});

  @override
  State<ND3RadiusChartGen> createState() => _ND3RadiusChartGenState();
}

class _ND3RadiusChartGenState extends State<ND3RadiusChartGen> {
  late List<GDPData> _chartData;
  String promedioTexto = ''; // Declarar la variable aquí

//Funcion parea sumar el promedio general
  @override
  void initState() {
    _chartData = getChartData();
    final List<GDPData> averageData = [
      GDPData(nd3ED, Color(0xffBBC700)),
      GDPData(nd3FP, Color(0xff00C1A7)),
      GDPData(nd3EG, Color(0xff09806F)),
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,//double.infinity, // Ocupa todo el ancho disponible
      height:500, //double.infinity, // Ocupa todo el alto disponible
      child: SfCircularChart(
  
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
      ),
      
    );
    
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
     GDPData(nd3ED, Color(0xffBBC700)),
      GDPData(nd3FP, Color(0xff00C1A7)),
      GDPData(nd3EG, Color(0xff09806F)),
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
