import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

/*final double ED = 0;
final dynamic FP = 0;
final dynamic EG = 0;*/

final double proII = 19;
final double creaII = 15;
final double ctI = 18;
final double thcaI = 17;
final double fisica = 20;
final double englishI = 14;


final double VED = (proII + creaII) / 2;
double ED = double.parse(VED.toStringAsFixed(1));

final dynamic VFP = (ctI + thcaI + fisica) / 3;
double FP = double.parse(VFP.toStringAsFixed(1)); 
// Convertir a double
final dynamic VEG = englishI;
double EG = double.parse(VEG.toStringAsFixed(1)); 

class RadiusChartGen extends StatefulWidget {
  const RadiusChartGen({super.key});

  @override
  State<RadiusChartGen> createState() => _RadiusChartGenState();
}

class _RadiusChartGenState extends State<RadiusChartGen> {
  late List<GDPData> _chartData;
  String promedioTexto = ''; // Declarar la variable aquí

  @override
  void initState() {
    _chartData = getChartData();

    final List<GDPData> averageData = [
      GDPData(ED, Color(0xff6851F3)),
      GDPData(FP, Color(0xffEBCA73)),
      GDPData(EG, Color(0xffF56D6C)),
    ];
    double calcularPromedio(List<GDPData> chartData) {
      if (chartData.isEmpty) {
        return 0.0; // Devuelve 0 si la lista está vacía para evitar división por cero.
      }

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
      width: double.infinity, // Ocupa todo el ancho disponible
      height: double.infinity, // Ocupa todo el alto disponible
      margin: EdgeInsets.all(0), // Sin márgenes
      padding: EdgeInsets.all(0),
      child: SfCircularChart(
        /*legend: Legend(
                isVisible: true,
                // Legend will be placed at the left
                position: LegendPosition.right
              ),*/
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
                    fontSize: 20,
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
      GDPData(ED, Color(0xff6851F3)),
      GDPData(FP, Color(0xffEBCA73)),
      GDPData(EG, Color(0xffF56D6C)),
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

String proIIString = proII.toString();
String creaIIString = creaII.toString();
String ctIString = ctI.toString();
String thcaIString = thcaI.toString();
String fisicaString = fisica.toString();
String englishIString = englishI.toString();