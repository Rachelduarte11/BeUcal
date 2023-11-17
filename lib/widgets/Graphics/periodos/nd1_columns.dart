import 'package:becertus_proyecto/models/colors.dart';
import 'package:becertus_proyecto/models/courses.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class ND1GenColumnChart extends StatefulWidget {
  final String? selectedCourseKey;
  final Map<String, Map<String, dynamic>> nd1cursos; // Agrega este parámetro

  const ND1GenColumnChart(this.selectedCourseKey, {Key? key, required this.nd1cursos}) : super(key: key);

  @override
  State<ND1GenColumnChart> createState() => _ND1GenColumnChartState();
}

class _ND1GenColumnChartState extends State<ND1GenColumnChart> {
   bool showLabels = false;
  List<GenCol> getChartData() {
    final List<GenCol> chartData = [];

    final List<Map<String, dynamic>>? nd1cursos = allCursos['ND1'];

     nd1cursos?.forEach((curso) {
    final String title = curso['title'];
    final double average = double.parse(curso['average'](context).toStringAsFixed(1));
    final Color color = curso['color'];
    final bool isSelected = widget.selectedCourseKey == title;


    chartData.add(GenCol(
      title,
      title, // Para el key, puedes usar el título como identificador único
      average,
      color,
      isSelected,
    ));
  });

  return chartData;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Container(
          alignment: Alignment.centerRight,
          child: _showAverage()),
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          child: SfCartesianChart(
              primaryYAxis: NumericAxis(
                maximum: 20,
              ),
              primaryXAxis: CategoryAxis(
                isVisible: false,
            
              ),
              series: <CartesianSeries>[
            ColumnSeries<GenCol, String>(
              dataSource: getChartData(),
              width: 0.5,
              xValueMapper: (GenCol data, _) => data.title,
              yValueMapper: (GenCol data, _) => data.average,
              // Map color for each data points from the data source
              pointColorMapper: (GenCol data, _) =>
                  data.isSelected ? redStatic : data.color,
              dataLabelSettings: DataLabelSettings(
              isVisible: showLabels,
               labelAlignment: ChartDataLabelAlignment.outer,
               opacity: 1,
              textStyle: TextStyle(fontSize: 13, fontFamily: 'Mitr')
              ),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            )
          ]),
        ),
       
      ],
    );
  }

  Container _showAverage() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:10),
      decoration: BoxDecoration(color: Colors.white,
      borderRadius: BorderRadius.circular(2),
      border: Border.all(color: greyLight)),
      alignment: Alignment.centerRight,
      height: 20,
      width: 100,
      child: GestureDetector(
                      onTap: () {
                setState(() {
                showLabels = !showLabels;
              });
            
            },
            
             child: Text(showLabels ? 'Ocultar Etiquetas' : 'Mostrar Etiquetas', style: TextStyle(
              fontFamily: 'Arimo',
              height: 0.8,
              color: greyDark,
              fontSize: 12
             ),),
             ),
           
    );
  }
}

class GenCol {
  //GestureTapCallback? showLabels;
  GenCol(this.title, this.course, this.average, this.color, this.isSelected);
  String title;
  String course;
  double average;
  Color? color;
  bool isSelected;
}
