import 'package:becertus_proyecto/models/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../functions/Provider.dart';
import '../../models/courses.dart';


class GenColumnChart extends StatefulWidget {
  final String? selectedCourseKey;
  
  final Map<String, Map<String, dynamic>> cursos;
  const GenColumnChart(this.selectedCourseKey, {Key? key, required this.cursos}) : super(key: key);

  @override
  State<GenColumnChart> createState() => _GenColumnChartState();
}

class _GenColumnChartState extends State<GenColumnChart> {
  
   bool showLabels = false;
 List<GenCol> getChartData() {
  final List<GenCol> chartData = [];

  // Accede a los cursos de 'ND1' en el mapa allCursos
  final List<Map<String, dynamic>>? cursos = allCursos['General'];

  // Recorre los cursos de 'ND1' y crea objetos GenCol
  cursos?.forEach((curso) {
    //Esto es para verificar si la funcion esta nula que al principio cuando se cargan los datos viene asi hasta que hace la 
    //carga de los datos, por lo tanto le damos el valor de 0.0 
    //para que no hayan errores
    final Function? averageFunction = curso['average'];
    double average = 0.0; 
    if (averageFunction != null) {
      final double? calculatedAverage = averageFunction(context);
      if (calculatedAverage != null) {
        average = double.parse(calculatedAverage.toStringAsFixed(1));
      }
    }
    final String title = curso['title'];
    //final  average = double.parse(curso['average'](context).toStringAsFixed(1));
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
    final chartData = getChartData();
    final notasProvider = Provider.of<NotasProvider>(context);
 
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
              dataSource: chartData,
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
