
import 'package:becertus_proyecto/screens/home.dart';
import 'package:flutter/material.dart';
import '../models/courses.dart';
import '../widgets/Graphics/charts.dart';
import '../widgets/Graphics/periodos/nd1.dart';
import '../widgets/Graphics/periodos/nd1_columns.dart';
import '../widgets/chip_data.dart';


class ND1Performance extends StatefulWidget {
  const ND1Performance({super.key});

  @override
  State<ND1Performance> createState() => _MainPerformanceState();
}

class _MainPerformanceState extends State<ND1Performance> {
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
                  child: ND1RadiusChartGen(),
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
                            '$nd1ED',
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
                            '$nd1FP',
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
                            '$nd1EG',
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
            child: ND1GenColumnChart(selectedCourseKey)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var cursoKey in nd1cursos.keys)
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
                      titulo: nd1cursos[cursoKey]?['title'],
                      promedio: nd1cursos[cursoKey]?['average'],
                      gradient: nd1cursos[cursoKey]?['gradient'],
                      isSelected: selectedCourseKey == cursoKey,
                    ),
                  ),
              ],
            ),
          ),
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
