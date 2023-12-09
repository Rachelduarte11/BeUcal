import 'package:becertus_proyecto/Students/jobs/model/competences_maps.dart';
import 'package:becertus_proyecto/Students/models/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CompetenciasColumnChart extends StatefulWidget {
  final String? selectedCourseKey;

  CompetenciasColumnChart({Key? key, this.selectedCourseKey}) : super(key: key);

  @override
  State<CompetenciasColumnChart> createState() =>
      _CompetenciasColumnChartState();
}

class _CompetenciasColumnChartState extends State<CompetenciasColumnChart> {
  bool showLabels = false;

  List<GenCol> getChartData() {
    final List<GenCol> chartData = [];

    final List<Map<String, dynamic>>? allCompetenciasList = [
      ...allCompetencias['General'] ?? [],
      ...allCompetencias['Especificas'] ?? [],
    ];
    allCompetenciasList?.forEach((competencia) {
      final double average = getAverageValue(competencia['average']);
      final String title = competencia['title'];
      final Color color = competencia['color'];
      final bool isSelected = widget.selectedCourseKey == title;

      chartData.add(GenCol(
        title,
        title,
        average,
        color,
        isSelected,
      ));
    });

    return chartData;
  }

  double getAverageValue(String? averageImport) {
    double average = 0.0;
    if (averageImport != null) {
      average = double.parse(averageImport.replaceAll('%', ''));
    }
    return average;
  }

  @override
  Widget build(BuildContext context) {
    final chartData = getChartData();

    return Column(
      children: [
        SizedBox(height: 6,),
         Container(alignment: Alignment.topRight, child: _showAverage()),
        Container(
          height: MediaQuery.of(context).size.height * 0.22,
          child: SfCartesianChart(
            primaryYAxis: NumericAxis(
              labelFormat:
                  '{value}%', // Formato de etiqueta para mostrar el porcentaje
              maximum: 100,
              majorTickLines: MajorTickLines(size: 2),
            ),
            primaryXAxis: CategoryAxis(
              isVisible: false,
            ),
            series: <ChartSeries>[
              ColumnSeries<GenCol, String>(
                dataSource: chartData,
                width: 0.7,
                xValueMapper: (GenCol data, _) => data.title,
                yValueMapper: (GenCol data, _) => data.average,
                pointColorMapper: (GenCol data, _) =>
                    data.isSelected ? Colors.red : data.color,
                dataLabelSettings: DataLabelSettings(
                  isVisible: showLabels,
                  labelAlignment: ChartDataLabelAlignment.outer,
                  opacity: 1,
                  textStyle: TextStyle(fontSize: 12, fontFamily: 'Arimo'),
                ),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              )
            ],
          ),
        ),
      ],
    );
  }

  Container _showAverage() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:5),
      padding: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(2),
       // border: Border.all(color: Colors.grey),
      ),
      alignment: Alignment.center,
      height: 20,
      width: 110,
      child: GestureDetector(
        onTap: () {
          setState(() {
            showLabels = !showLabels;
          });
        },
        child: Text(
          showLabels ? 'Ocultar Etiquetas' : 'Mostrar Etiquetas',
          style: TextStyle(
            fontFamily: 'Arimo',
            height: 0.8,
            color: Color.fromARGB(255, 100, 100, 100),
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class GenCol {
  GenCol(this.title, this.course, this.average, this.color, this.isSelected);

  String title;
  String course;
  double average;
  Color color;
  bool isSelected;
}
