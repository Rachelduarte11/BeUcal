import 'package:becertus_proyecto/models/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../models/courses.dart';

class GenColumnChart extends StatefulWidget {
  final String? selectedCourseKey;
  
  const GenColumnChart(this.selectedCourseKey, {Key? key}) : super(key: key);

  @override
  State<GenColumnChart> createState() => _GenColumnChartState();
}

class _GenColumnChartState extends State<GenColumnChart> {
   bool showLabels = false;
  List<GenCol> getChartData() {
    final List<GenCol> chartData = [];
    cursos.forEach((key, value) {
      final double average = double.parse(value['average']);
      final bool isSelected = widget.selectedCourseKey == key;
      chartData.add(GenCol(value['title'], key, average, 
      value['color'], widget.selectedCourseKey == key,
      ));
    });
    return chartData;
  }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        // Mostrar los labels cuando se toque en el área del gráfico
      
          setState(() {
          showLabels = !showLabels;
        });
      
      },
      child: Container(
           
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
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                )
              ]),
            
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
