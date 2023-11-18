import 'package:becertus_proyecto/widgets/dashboard/jobs/model/model_future_jobs.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

double promedioPonderado = calcularPromedioPonderado(allCompetencias);
String stringPromedioPonderado = promedioPonderado.toStringAsFixed(1);

class TuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: _buildMarkerPointerExample(),
    );
  }

  SfRadialGauge _buildMarkerPointerExample() {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          startAngle: 180,
          endAngle: 360,
          radiusFactor: 1,
          canScaleToFit: true,
          interval: 10,
          showLabels: false,
          showAxisLine: false,
          pointers: <GaugePointer>[
            MarkerPointer(
              value: promedioPonderado,
              elevation: 4,
              markerWidth: 20,
              markerHeight: 20,
              color: const Color(0xFF323232),
              markerType: MarkerType.invertedTriangle,
              markerOffset: -7,
            ),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              angle: 175,
              positionFactor: 0.8,
              widget: Text(
                'No hay desarrollo',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            GaugeAnnotation(
              angle: 270,
              positionFactor: 0.1,
              widget: Text(
                '${stringPromedioPonderado}%',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const GaugeAnnotation(
              angle: 5,
              positionFactor: 0.8,
              widget: Text(
                'Sobresaliente',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ],
          ranges: <GaugeRange>[
            GaugeRange(
              startValue: 0,
              endValue: 100,
              sizeUnit: GaugeSizeUnit.factor,
              gradient: SweepGradient(
                colors: <Color>[
                  Color(0xFFFD6A6A),
                  Color(0xFFF79521),
                  Color(0xFFFFE484),
                  Color(0xFFC9D32B),
                  Color(0xFF62DBF6)
                ],
                stops: <double>[0.0, 0.25, 0.5, 0.75, 1.0],
              ),
              startWidth: 0.4,
              endWidth: 0.4,
              color: const Color(0xFF00A8B5),
            )
          ],
          showTicks: false,
        ),
      ],
    );
  }
}

double calcularPromedioPonderado(
    Map<String, List<Map<String, dynamic>>> competencias) {
  double sumaProductos = 0;
  double sumaPesos = 0;

  competencias.forEach((categoria, listaCompetencias) {
    listaCompetencias.forEach((competencia) {
      double porcentaje =
          double.parse(competencia['average'].replaceAll('%', '')) / 100;
      double peso =
          1.0; // Puedes ajustar los pesos según la importancia de cada competencia
      sumaProductos += porcentaje * peso;
      sumaPesos += peso;
    });
  });

  if (sumaPesos > 0) {
    return (sumaProductos / sumaPesos) *
        100; // Devuelve el promedio ponderado en porcentaje
  } else {
    return 0.0; // Manejo de caso especial si no hay competencias o pesos
  }
}

String obtenerEvaluacion(double nota) {
  if (nota >= 0 && nota <= 9) {
    return 'No hay Desarrollo';
  } else if (nota >= 10 && nota <= 29) {
    String inicio = 'Inicio';
    return inicio;
  } else if (nota >= 30 && nota <= 49) {
    return 'En Proceso';
  } else if (nota >= 50 && nota <= 69) {
    return 'Logrado';
  } else if (nota >= 70 && nota <= 100) {
    return 'Sobresaliente';
  } else {
    return 'Nota no válida';
  }
}
