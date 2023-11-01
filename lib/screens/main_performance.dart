import 'package:becertus_proyecto/models/colors.dart';
import 'package:becertus_proyecto/screens/home.dart';
import 'package:becertus_proyecto/widgets/Graphics/charts.dart';
import 'package:becertus_proyecto/widgets/chip_data.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../models/results_performance.dart';
import '../models/courses.dart';
import '../widgets/Graphics/column_chart.dart';
import '../widgets/Graphics/periodos/better_periods.dart';

class MainPerformance extends StatefulWidget {
  const MainPerformance({super.key});

  @override
  State<MainPerformance> createState() => _MainPerformanceState();
}

class _MainPerformanceState extends State<MainPerformance> {
  String? selectedCourseKey;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Titles(
          text: 'Arquitectura',
          size: 24,
          fontFamily: 'Mitr',
        ),
        SizedBox(
          height: 2,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.20,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  offset: Offset(1, 3),
                  blurRadius: 3.5,
                ),
              ],
              color: Color(0XFFF5F5F5),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: ClipRRect(
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.48,
                  //height: 300,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: RadiusChartGen(),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.46,
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          chipData2(
                            '$ED',
                            0xffBBC700,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                              child: InfoCourses(
                                  'Cursos enfocados en estrategias de Diseño Arquitectonico')),
                        ],
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          chipData2(
                            '$FP',
                            0xff00C1A7,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                              child: InfoCourses(
                                  'Cursos de Formación Profesional')),
                        ],
                      ),
                      Row(
                        children: [
                          chipData2(
                            '$EG',
                            0xff09806F,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(child: InfoCourses('Estudios Generales')),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.25,
            child: GenColumnChart(selectedCourseKey)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var cursoKey in cursos.keys)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedCourseKey == cursoKey) {
                          selectedCourseKey =
                              null; // Si ya está seleccionado, restablece el estado
                        } else {
                          selectedCourseKey =
                              cursoKey; // De lo contrario, actualiza el elemento seleccionado
                        } // Actualizar el elemento seleccionado
                      });
                    },
                    child: ChipContainer(
                      titulo: cursos[cursoKey]?['title'],
                      promedio: cursos[cursoKey]?['average'],
                      gradient: cursos[cursoKey]?['gradient'],
                      isSelected: selectedCourseKey == cursoKey,
                    ),
                  ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _betterScore(context),
              _worseScore(context)
            ],
          ),
        ),
        SizedBox(height: 6,),
        Titles(text: 'Rendimiento por periodos', size: 18, fontFamily: 'Mitr'),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height *0.4,
          child: MyPeriodBar(),
        )
      ],
    );
  }

  Row _betterScore(BuildContext context) {
    Map<String, dynamic> bestCourseData = findBestCourse(performance);
    String bestCourseTitle = bestCourseData['title'];
    String bestCourseAverage = bestCourseData['average'].toStringAsFixed(1);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.46,
              height: MediaQuery.of(context).size.height * 0.10,
              margin: EdgeInsets.only(bottom: 5),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(1, 3),
                    blurRadius: 3.5,
                  ),
                ],
                color: Color(0XFFFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Titles(
                          text: 'Mejor Curso', size: 14, fontFamily: 'Arimo'),
                      Container(
                        constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width*0.255, // Establece el ancho máximo del contenedor
                    
                      ),
                        child: AutoSizeText(
                          bestCourseTitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            height: 1,
                              fontFamily: 'Mitr',
                              fontSize: 18,
                              color: Color(0xff4B4B4B)),
                          minFontSize: 12, // Tamaño de fuente mínimo
                          maxFontSize: 20, // Tamaño de fuente máximo
                          presetFontSizes: [20, 16, 14, 12], 
                        ),
                      ),

                      // Text('Promedio: $bestCourseAverage'),
                    ],
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(colors: [
                          Color(0xFFC9D32B),
                          Color.fromARGB(201, 100, 219, 112),
                        ],
                        stops: [0.0, 20],)),
                    child: Center(
                      child: AutoSizeText(
                        bestCourseAverage,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Arimo',
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      minFontSize: 12, // Tamaño de fuente mínimo
                      maxFontSize: 20, // Tamaño de fuente máximo
                      presetFontSizes: [20, 16, 14, 12], 
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Row _worseScore(BuildContext context) {
  
    Map<String, dynamic> worstCourse = findWorstCourse(performance);
    String worstAverage = worstCourse['average'].toStringAsFixed(1); // Inicializa con un valor muy alto para asegurarte de que cualquier promedio será menor.
    String worstCourseTitle = worstCourse['title'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.46,
              height: MediaQuery.of(context).size.height * 0.10,
              margin: EdgeInsets.only(bottom: 5),
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(1, 3),
                    blurRadius: 3.5,
                  ),
                ],
                color: Color(0XFFFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Titles(
                          text: 'Por Mejorar ', size: 14, fontFamily: 'Arimo'),
                      Container(
                        constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width*0.26, // Establece el ancho máximo del contenedor
                    
                      ),
                        child: AutoSizeText(
                          worstCourseTitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            height: 1,
                              fontFamily: 'Mitr',
                              fontSize: 20,
                              color: Color(0xff4B4B4B)),
                          minFontSize: 12, // Tamaño de fuente mínimo
                          maxFontSize: 20, // Tamaño de fuente máximo
                          presetFontSizes: [20, 16, 14, 12], 
                        ),
                      ),

                      // Text('Promedio: $bestCourseAverage'),
                    ],
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(colors: [
                          redStatic,
                          Color(0xFFEB078D),
                        ])),
                    child: Center(
                      child: Text(
                        worstAverage ,
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Arimo',
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Text InfoCourses(String text2) {
    return Text(
      text2,
      style: TextStyle(
        fontSize: 11,
        height: 1,
        fontWeight: FontWeight.w400,
        fontFamily: 'Mitr',
        color: Color(0xFF323232),
      ),
      textAlign: TextAlign.start,
    );
  }
}
